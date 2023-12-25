<?php

namespace App\Http\Controllers\portafolio;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Portafolio\Categoria;
use App\Http\Resources\Portafolio\CategoriaResource;
use App\Http\Resources\Portafolio\CategoriaCollection;

class categoriaController extends Controller
{
   /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        // $categorias = Categoria::orderBy('created_at', 'DESC')
        // ->get();

        // return response()->json([
        //     'code' => 200,
        //     'status' => 'Listar todos los categorias',
        //     'categorias' => $categorias,
        // ], 200);

        $search = $request->search;
        $status = $request->status;
        
        $categorias = Categoria::filterAdvance($search, $status)->orderby('id', 'desc')->get();

        return response()->json([
            "categorias" => CategoriaCollection::make($categorias)
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function categoriaStore(Request $request)
    {
        // return Categoria::create($request->all());

        //  if($request->hasFile('portada')){
        //     $path = Storage::putFile('categories', $request -> file('portada'));
        //     $request->request->add(['imagen'=>$path]);
        // }

        $category = Categoria::create($request->all());

        return response()->json(['categoria'=> CategoriaResource::make($category)]);

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Categoria $categoria
     * @return \Illuminate\Http\Response
     */
    public function categoriaShow(string $id)
    {
        //
        // if (!$categoria) {
        //     return response()->json([
        //         'message' => 'Categoria not found.'
        //     ], 404);
        // }

        // return response()->json([
        //     'code' => 200,
        //     'status' => 'success',
        //     'categoria' => $categoria,
        // ], 200);

        $categoria = Categoria::findOrFail($id);
        return response()->json([
            'categoria'=>CategoriaResource::make($categoria)
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Categoria $categoria
     * @return \Illuminate\Http\Response
     */
    public function categoriaUpdate(Request $request, $id)
    {
        $categoria = Categoria::findOrFail($id);
        
        $categoria -> update($request->all());

        return response()->json(['categoria'=> CategoriaResource::make($categoria)]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Categoria $categoria
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Categoria $categoria)
    {
        //
    }

    public function categoriaUpdateStatus(Request $request, $id)
    {
        $categoria = Categoria::findOrfail($id);
        $categoria->status = $request->status;
        $categoria->update();
        return $categoria;
    }

    public function activos()
    {

        $categorias = Categoria::orderBy('created_at', 'DESC')
                
                ->where('status', $status='PUBLISHED')
                ->get();
            return response()->json([
                'code' => 200,
                'status' => 'Listar categorias activas',
                'categorias' => $categorias,
            ], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Categoria $categoria
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request $request)
    {

        $categoria =  Categoria::where('id', $id)->first();

        if(!empty($categoria)){

             // borrar
             $categoria->delete();
             // devolver respuesta
             $data = [
                 'code' => 200,
                 'status' => 'success',
                 'categoria' => $categoria
             ];
         }else{
             $data = [
                 'code' => 404,
                 'status' => 'error',
                 'message' => 'el categoria no existe'
             ];
         }

         return response()->json($data, $data['code']);
    }

    public function search(Request $request){
        return Categoria::search($request->buscar);
    }
}
