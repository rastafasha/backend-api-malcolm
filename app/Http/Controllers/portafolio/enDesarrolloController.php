<?php

namespace App\Http\Controllers\portafolio;

use App\Models\Endesarollo;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\Desarollo\DesarrolloResource;
use App\Http\Resources\Desarrollo\DesarrolloCollection;

class enDesarrolloController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        // $search = $request->search;
        // $state = $request->state;
        
        // $endesarollos = Endesarollo::filterAdvance($search, $state)->orderby('id', 'desc')->get();

        // return response()->json([
        //     "endesarollos" => DesarrolloCollection::make($endesarollos)
        // ]);

        //
        $endesarollos = Endesarollo::orderBy('created_at', 'DESC')
        ->get();

        return response()->json([
            'code' => 200,
            'status' => 'Listar todos los endesarollos',
            'endesarollos' => $endesarollos,
        ], 200);


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
        $if_exist = Endesarollo::where('title', $request->title)->first();
        if($if_exist){
            return response()->json([ 
                'message'=> 403,
                'message_text'=>'Ya existe un curso con este titulo'
            ]);
        }
        if($request->hasFile('portada')){
            $path = Storage::putFile('endesarollos', $request -> file('portada'));
            $request->request->add(['imagen'=>$path]);
        }

        $request ->request->add(['slug' => Str::slug($request->title)]);
        
        $endesarollo = Endesarollo::create($request->all());
        
        return response()->json([ 'message'=> 200]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $endesarollo = Endesarollo::findOrFail($id);
        return response()->json([
            'endesarollo'=>DesarrolloResource::make($endesarollo)
        ]);

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
        $if_exist = Endesarollo::where('id','<>',$id)->where('title', $request->title)->first();
        if($if_exist){
            return response()->json([ 
                'message'=> 403,
                'message_text'=>'Ya existe un endesarollo con este titulo'
            ]);
        }
        $endesarollo = Endesarollo::findOrFail($id);
        if($request->hasFile('portada')){
            //verifica si tiene imagen o no para actualizar
            if($endesarollo->imagen){
                Storage::delete($endesarollo->imagen);
            }
            $path = Storage::putFile('endesarollos', $request -> file('portada'));
            $request->request->add(['imagen'=>$path]);
        }

        $request ->request->add(['slug' => Str::slug($request->title)]);

        $endesarollo->update();

        return response()->json(['endesarollo'=> DesarrolloResource::make($endesarollo)]);


    }

    public function updateStatus(Request $request, $id)
    {
        $endesarollo = Endesarollo::findOrfail($id);
        $endesarollo->status = $request->status;
        $endesarollo->update();
        return $endesarollo;
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $endesarollo =  Endesarollo::where('id', $id)->first();

        if(!empty($endesarollo)){

             // borrar
             $endesarollo->delete();
             // devolver respuesta
             $data = [
                 'code' => 200,
                 'status' => 'success',
                 'endesarollo' => $endesarollo
             ];
         }else{
             $data = [
                 'code' => 404,
                 'status' => 'error',
                 'message' => 'el endesarollo no existe'
             ];
         }

         return response()->json($data, $data['code']);
    }
}
