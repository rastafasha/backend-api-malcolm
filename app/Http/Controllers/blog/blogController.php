<?php

namespace App\Http\Controllers\blog;

use App\Models\Blog;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\blog\blogResource;
use App\Http\Resources\blog\blogCollection;
use Illuminate\Support\Facades\Storage;

class blogController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $search = $request->search;
        $status = $request->status;
        
        $blogs = Blog::filterAdvance($search, $status)->orderby('id', 'desc')->get();

        return response()->json([
            "blogs" => blogCollection::make($blogs)
        ]);

    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
       // return Portafolio::create($request->all());
       $if_exist = Blog::where('title', $request->title)->first();
       if($if_exist){
           return response()->json([ 
               'message'=> 403,
               'message_text'=>'Ya existe un curso con este titulo'
           ]);
       }
       if($request->hasFile('portada')){
           $path = Storage::putFile('blogs', $request -> file('portada'));
           $request->request->add(['imagen'=>$path]);
       }

       $request ->request->add(['slug' => Str::slug($request->title)]);
       
       $blog = Blog::create($request->all());
       
       return response()->json([ 'message'=> 200]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $blog = Blog::findOrFail($id);
        return response()->json([
            'blog'=>blogResource::make($blog)
        ]);

        
    }

    public function activos()
    {
        // $this->authorize('index', User::class);

        $blogs = Blog::where('status', $status='PUBLISHED')
        ->orderby('id', 'desc')
        ->get();
            return response()->json([
                'code' => 200,
                'status' => 'Listar blogs activos',
                'blogs' => $blogs,
            ], 200);
    }
    public function destacados()
    {
        // $this->authorize('index', User::class);

        $destacados = Blog::where('status', $status='PUBLISHED')
        ->where('isFeatured',$featured=true)
        ->orderby('id', 'desc')
        ->get();
            return response()->json([
                'code' => 200,
                'status' => 'Listar destacados activos',
                'destacados' => $destacados,
            ], 200);
    }


    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $if_exist = Blog::where('id','<>',$id)->where('title', $request->title)->first();
        if($if_exist){
            return response()->json([ 
                'message'=> 403,
                'message_text'=>'Ya existe un curso con este titulo'
            ]);
        }
        $blog = Blog::findOrFail($id);
        if($request->hasFile('portada')){
            //verifica si tiene imagen o no para actualizar
            if($blog->imagen){
                Storage::delete($blog->imagen);
            }
            $path = Storage::putFile('blogs', $request -> file('portada'));
            $request->request->add(['imagen'=>$path]);
        }

        $request ->request->add(['slug' => Str::slug($request->title)]);
        $blog -> update($request->all());

        return response()->json(['blog'=> blogResource::make($blog)]);

    }

    public function updateStatus(Request $request, $id)
    {
        $blog = Blog::findOrfail($id);
        $blog->status = $request->status;
        $blog->update();
        return $blog;
    }


    public function blogShowSlug($slug)
    {
        // $portafolio = portafolio::where('slug', $slug)->first();

        $blog = Blog::select([
            "id",
            'title',
        'description',
        'category_id',
        'slug',
        'imagen',
        'user_id',
        'created_at',
        ])
            ->where('slug', $slug)
            // ->with(["category"])
            // ->with(["user"])
            ->orderBy('id', 'desc')
            ->get();

            return response()->json([
                'code' => 200,
                'status' => 'Listar blog by slug',
                'blog' => $blog,
            ], 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $blog =  Blog::where('id', $id)->first();

        if(!empty($blog)){

             // borrar
             $blog->delete();
             // devolver respuesta
             $data = [
                 'code' => 200,
                 'status' => 'success',
                 'blog' => $blog
             ];
         }else{
             $data = [
                 'code' => 404,
                 'status' => 'error',
                 'message' => 'el blog no existe'
             ];
         }

         return response()->json($data, $data['code']);
    }
}
