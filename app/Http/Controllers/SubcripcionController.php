<?php

namespace App\Http\Controllers;

use App\Models\Subcripcion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;


class SubcripcionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $subcripcions = Subcripcion::get();

        return response()->json([
            'code' => 200,
            'status' => 'List subcripcions',
            'subcripcions' => $subcripcions,
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        return Subcripcion::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Subcripcion $subcripcion)
    {

        if (!$subcripcion) {
            return response()->json([
                'message' => 'subcripcion not found.'
            ], 404);
        }

        return response()->json([
            'code' => 200,
            'status' => 'success',
            'subcripcion' => $subcripcion,
        ], 200);
    }

}
