<?php

namespace App\Http\Controllers\tienda;

use Illuminate\Support\Str;

use App\Models\User;
use App\Models\Direccion;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\Direccion\DireccionResource;
use App\Http\Resources\Direccion\DireccionCollection;

class direccionController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // $search = $request->search;
        // $status = $request->status;
        
        // filterAdvance($search, $status)->

        $direccions = Direccion::orderby('id', 'desc')->get();

        return response()->json([
            "direccions" => DireccionCollection::make($direccions)
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
        $if_exist = Direccion::where('title', $request->title)->first();
        if($if_exist){
            return response()->json([ 
                'message'=> 403,
                'message_text'=>'Ya existe una direccion con este titulo'
            ]);
        }
        
        $request ->request->add(['googlemaps' => json_encode(explode(',', $request->googlemaps))]);
        $direccion = Direccion::create($request->all());

        return response()->json([ 'message'=> 200]);

        // return response()->json([
        //     "direccion"=>$direccion
        // ]);
        
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $direccion = Direccion::findOrFail($id);
        return response()->json([
            'direccion'=>DireccionResource::make($direccion)
        ]);
    }
    /**
     * Display the specified resource.
     */
    public function direccionuser(Request $request)
    {

        // $user = auth('api')->user();
        $direccions = Direccion::where("user_id", $request->user)->get();
        return response()->json([
            'direccions'=>DireccionResource::make($direccions)
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
        $direccion = Direccion::findOrFail($id);
        $direccion ->update($request->all());
        return response()->json(["message"=>200]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $direccion = Direccion::findOrFail($id);
        $direccion->delete();
        return response()->json(["message"=>200]);
    }
}
