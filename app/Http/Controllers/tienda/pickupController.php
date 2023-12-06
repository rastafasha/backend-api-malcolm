<?php

namespace App\Http\Controllers\tienda;

use App\Models\Pickup;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\Pickup\PickupResource;
use App\Http\Resources\Pickup\PickupCollection;

class pickupController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // $search = $request->search;
        // $status = $request->status;
        
        // filterAdvance($search, $status)->

        $pickups = Pickup::orderby('id', 'desc')->get();

        return response()->json([
            "pickups" => PickupCollection::make($pickups)
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
        $request->request->add(["user_id"=>auth('api')->user()->id]);
        $pickup = Pickup::create($request->all());

        return response()->json([
            "pickup"=>$pickup
        ]);
        
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $pickup = Pickup::findOrFail($id);
        return response()->json([
            'pickup'=>PickupResource::make($pickup)
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
        $pickup = Pickup::findOrFail($id);
        $pickup ->update($request->all());
        return response()->json(["message"=>200]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $pickup = Pickup::findOrFail($id);
        $pickup->delete();
        return response()->json(["message"=>200]);
    }
}
