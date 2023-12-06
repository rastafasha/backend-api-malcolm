<?php

namespace App\Http\Controllers\portafolio;

use App\Models\Portafolio;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Http\UploadedFile;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;
use App\Http\Resources\Portafolio\PortafolioResource;
use App\Http\Resources\Portafolio\PortafolioCollection;

class portafolioController extends Controller
{
    
    //
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {


        $search = $request->search;
        $status = $request->status;
        
        $portafolios = Portafolio::filterAdvance($search, $status)->orderby('id', 'desc')->get();

        return response()->json([
            "portafolios" => PortafolioCollection::make($portafolios)
        ]);

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        // return Portafolio::create($request->all());
        $if_exist = Portafolio::where('title', $request->title)->first();
        if($if_exist){
            return response()->json([ 
                'message'=> 403,
                'message_text'=>'Ya existe un curso con este titulo'
            ]);
        }
        if($request->hasFile('portada')){
            $path = Storage::putFile('portafolios', $request -> file('portada'));
            $request->request->add(['imagen'=>$path]);
        }

        $request ->request->add(['slug' => Str::slug($request->title)]);
        
        $portafolio = Portafolio::create($request->all());
        
        return response()->json([ 'message'=> 200]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(string $id)
    {
        // if (!$portafolio) {
        //     return response()->json([
        //         'message' => 'portafolio not found.'
        //     ], 404);
        // }

        // return response()->json([
        //     'code' => 200,
        //     'status' => 'success',
        //     'portafolio' => $portafolio,
        // ], 200);
        
        $portafolio = Portafolio::findOrFail($id);
        return response()->json([
            'portafolio'=>PortafolioResource::make($portafolio)
        ]);

        

    }

    public function portafolioShowWithCategory(Portafolio $portafolio)
    {

        // $portafolio = portafolio::with('categories')->find($id);

        $portafolio = Portafolio::join('categories', 'portafolios.category_id', '=', 'categories.id')
        ->select(
            'portafolios.id as id',
            'categories.name'
            )
        ->get();

        if (!$portafolio) {
            return response()->json([
                'message' => 'portafolio not found.'
            ], 404);
        }

        return response()->json([
            'code' => 200,
            'status' => 'success',
            'portafolio' => $portafolio,
        ], 200);
    }

    public function portafolioByCategory($category)
    {
        // $this->authorize('index', User::class);

        $portafolios = Portafolio::with('categorias')
        ->where('category_id', $category)
        ->where('status', $status='PUBLISHED')
        ->get();
            return response()->json([
                'code' => 200,
                'status' => 'Listar portafolio by Category',
                'portafolios' => $portafolios,
            ], 200);
    }


    public function portafolioShowSlug($slug)
    {
        // $portafolio = portafolio::where('slug', $slug)->first();

        $portafolio = Portafolio::select([
            "id",
            'title',
        'description',
        'category_id',
        'slug',
        'image',
        ])
            ->where('slug', $slug)
            ->with(["categorias"])
            ->orderBy('id', 'desc')
            ->get();

            return response()->json([
                'code' => 200,
                'status' => 'Listar portafolio by slug',
                'portafolio' => $portafolio,
            ], 200);
    }

     public function recientes()
    {
        $portafoliorecientes = Portafolio::orderBy('created_at', 'DESC')
        ->with(["categories"])
        ->get();

        return response()->json([
            'code' => 200,
            'status' => 'success',
            'portafoliorecientes' => $portafoliorecientes
        ], 200);
    }

    public function destacados()
    {

        $portafolios = Portafolio::join('categories', 'portafolios.category_id', '=', 'categories.id')
                ->with(["users"])
                ->with(["categories"])
                ->where('isFeatured', $featured=true)
                ->get([
                    'portafolios.*', 'portafolios.title',
                    'categories.*', 'categories.name',
                ]);
            return response()->json([
                'code' => 200,
                'status' => 'Listar portafolio destacados',
                'portafolios' => $portafolios,
            ], 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, string $id)
    {
        
        $if_exist = Portafolio::where('id','<>',$id)->where('title', $request->title)->first();
        if($if_exist){
            return response()->json([ 
                'message'=> 403,
                'message_text'=>'Ya existe un portafolio con este titulo'
            ]);
        }
        $portafolio = Portafolio::findOrFail($id);
        if($request->hasFile('portada')){
            //verifica si tiene imagen o no para actualizar
            if($portafolio->imagen){
                Storage::delete($portafolio->imagen);
            }
            $path = Storage::putFile('portafolios', $request -> file('portada'));
            $request->request->add(['imagen'=>$path]);
        }

        $request ->request->add(['slug' => Str::slug($request->title)]);

        $portafolio->update();

        return response()->json(['portafolio'=> PortafolioResource::make($portafolio)]);


        
    }

    public function portafolioUpdateStatus(Request $request, $id)
    {
        $portafolio = Portafolio::findOrfail($id);
        $portafolio->status = $request->status;
        $portafolio->update();
        return $portafolio;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request $request)
    {

        $portafolio =  Portafolio::where('id', $id)->first();

        if(!empty($portafolio)){

             // borrar
             $portafolio->delete();
             // devolver respuesta
             $data = [
                 'code' => 200,
                 'status' => 'success',
                 'portafolio' => $portafolio
             ];
         }else{
             $data = [
                 'code' => 404,
                 'status' => 'error',
                 'message' => 'el portafolio no existe'
             ];
         }

         return response()->json($data, $data['code']);
    }

    /**
     * @param UploadedFile $file
     * @return string
     */
    protected function generateFileName(UploadedFile $file): string {
        $extension = $file->getClientOriginalExtension();
        $fullName = $file->getClientOriginalName();
        $pathFileName = trim(pathinfo($fullName, PATHINFO_FILENAME));
        $secureMaxName = substr(Str::slug($pathFileName), 0, 90);
        return sprintf('%s-%s.%s', $secureMaxName, now()->timestamp, $extension);
    }




     public function search(Request $request){

        return Portafolio::search($request->buscar);

    }
}
