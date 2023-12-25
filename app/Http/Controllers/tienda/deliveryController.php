<?php

namespace App\Http\Controllers\tienda;

use App\Models\Delivery;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\Delivery\DeliveryResource;
use App\Http\Resources\Delivery\DeliveryCollection;

class deliveryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // $search = $request->search;
        // $status = $request->status;
        
        // filterAdvance($search, $status)->

        $deliveries = Delivery::orderby('id', 'desc')->get();

        return response()->json([
            "deliveries" => $deliveries
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
        // $request->request->add(["user_id"=>auth('api')->user()->id]);
        $delivery = Delivery::create($request->all());

        return response()->json([
            "delivery"=>$delivery
        ]);
        
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $delivery = Delivery::findOrFail($id);
        return response()->json([
            'delivery'=>DeliveryResource::make($delivery)
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
        $delivery = Delivery::findOrFail($id);
        $delivery ->update($request->all());
        return response()->json(["message"=>200]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $delivery = Delivery::findOrFail($id);
        $delivery->delete();
        return response()->json(["message"=>200]);
    }
}
