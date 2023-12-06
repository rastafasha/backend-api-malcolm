<?php

namespace App\Http\Controllers\admin\product;


use Validator;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Models\Product\CategoryProduct;
use Illuminate\Support\Facades\Storage;
use App\Http\Resources\Product\Category\CategoryProductCollection;
use App\Http\Resources\Product\Category\CategoryProductResource;

class CategoryProductController extends Controller
{
     /**
     * Display a listing of the resource.
     */
    public function index( Request $request)
    {
        $search = $request->search;
        $state = $request->state;
        // filterAdvance($search, $state)->
        $category_products = CategoryProduct::orderby('id', 'desc')->get();

        return response()->json([
            "category_products" => CategoryProductCollection::make($category_products)
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
        if($request->hasFile('portada')){
            $path = Storage::putFile('categories', $request -> file('portada'));
            $request->request->add(['imagen'=>$path]);
        }

        $category = CategoryProduct::create($request->all());

        return response()->json(['category'=> CategoryProductResource::make($category)]);

    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
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
        $category = CategoryProduct::findOrFail($id);
        if($request->hasFile('portada')){
            //verifica si tiene imagen o no para actualizar
            if($category->imagen){
                Storage::delete($category->imagen);
            }
            $path = Storage::putFile('categories', $request -> file('portada'));
            $request->request->add(['imagen'=>$path]);
        }

        $category -> update($request->all());

        return response()->json(['category'=> CategoryProductResource::make($category)]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        
        $category = CategoryProduct::findOrFail($id);
        $category->delete();
        return response()->json(['message' => 200]);
    }
}
