<?php

namespace App\Http\Controllers\admin\sales;

use App\Models\Categoria;
use App\Models\Sale\Sale;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Sale\CategoriaVentas;
use App\Http\Resources\Ecommerce\Sale\SaleCollection;

class salesController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {

        $search = $request->search;
        $status = $request->status;
        
        $sales = Sale::saleFilterAdvance($search, $status)->orderby('id', 'desc')->get();

        return response()->json([
            "sales" => SaleCollection::make($sales),
            // "tota"=>total()
        ]);
        
    }

    public function categoriasVentas( Request $request)
    {
        // where("category_id",NULL)->
        $salecategories = CategoriaVentas::orderBy("id","desc")->get();

        return response()->json([
            "salecategories" => $salecategories,
        ]);


    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        if (!$sale) {
            return response()->json([
                'message' => 'Pago not found.'
            ], 404);
        }

        return response()->json([
            'code' => 200,
            'status' => 'success',
            'sale' => SaleResource::make($sale)
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
        try {
            DB::beginTransaction();

            $input = $request->all();
            $sale = Sale::find($id);
            $sale->update($input);


            DB::commit();
            return response()->json([
                'code' => 200,
                'status' => 'Update sale success',
                'sale' => $sale,
            ], 200);
        } catch (\Throwable $exception) {
            DB::rollBack();
            return response()->json([
                'message' => 'Error no update'  . $exception,
            ], 500);
        }
    }
    
    public function recientes()
    {
        $sales = Sale::orderBy('created_at', 'DESC')
        ->get();

        return response()->json([
            'code' => 200,
            'status' => 'success',
            'sales' => $sales
        ], 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    
    public function config()
    {
        $sales = Sale::orderBy('created_at', 'DESC')
        ->get();

        return response()->json([
            'code' => 200,
            'status' => 'Listar todos las ventas',
            'sales' => $sales,
        ], 200);
    }
    public function pedidoEntregado()
    {
        $sales = Sale::orderBy('created_at', 'DESC')
        ->where('status', 2)
        ->get();

        return response()->json([
            'code' => 200,
            'status' => 'Listar todos las entregas',
            'sales' => $sales,
        ], 200);
    }
    public function pedidoCancelados()
    {
       
        $sales = Sale::orderBy('created_at', 'DESC')
        ->where('status', 3)
        ->get();

        return response()->json([
            'code' => 200,
            'status' => 'Listar todos las cancelaciones',
            'sales' => $sales,
        ], 200);
    }

    public function updateStatus(Request $request, $id)
    {
        $sale = Sale::findOrfail($id);
        $sale->status = $request->status;
        $sale->update();
        return $sale;
    }

}
