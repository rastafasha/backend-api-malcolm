<?php

namespace App\Http\Controllers\admin\Coupon;

use Illuminate\Http\Request;
use App\Models\Coupon\Coupon;
use App\Models\Course\Category;
use App\Models\Product\Product;
use App\Http\Controllers\Controller;
use App\Models\Coupon\CouponProduct;
use App\Models\Coupon\CouponCategorie;
use App\Http\Resources\Product\Coupon\CouponProductCollection;
use App\Http\Resources\Product\Coupon\CouponClaseProductResource;

class CouponProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $search = $request->search;
        $state = $request->state;
        
        $coupons = Coupon::filterAdvance($search, $state)->orderBy("id", "desc")->get();

        return response()->json([
            "message" => 200,
            // "coupons" => $coupons
            "coupons" => CouponCollection::make($coupons)
        ]);
    }

    public function config( Request $request)
    {
        
        $categories = Category::where("category_id",NULL)->orderBy("id","desc")->get();
        $products = Product::where("state", 2)->orderBy("id","desc")->get();
    
        return response()->json([
            "products" => $products->map(function($product){
                return [
                    "id"=>$product->id,
                    "title"=>$product->title,
                    "imagen"=>env("APP_URL")."storage/".$product->imagen,
                ];
            }),
            "categories" => $categories->map(function($categorie){
                return [
                    "id"=>$categorie->id,
                    "nombre"=>$categorie->nombre,
                    "imagen"=>env("APP_URL")."storage/".$categorie->imagen,
                ];
            }),
            
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
        $IS_EXISTS = Coupon::where("code", $request->code)->first();
        if($IS_EXISTS){
            return response()->json([
                "message"=>403,
                "message_text"=>"El codigo del coupon ya existe"
            ]);
        }

        $coupon = Coupon::create($request->all());

        if($request->type_coupon == 1){
            
            foreach($request->product_selected as $key => $product){
                CouponProduct::create([
                    "coupon_id"=> $coupon->id,
                    "product_id"=> $product["id"],
                ]);
            }
        }
        if($request->type_coupon == 2){
            foreach($request->category_selected as $key => $categorie){
                CouponCategorie::create([
                    "coupon_id"=> $coupon->id,
                    "category_id"=> $categorie["id"],
                ]);
            }
        }

        return response()->json(["message"=>200]);
        
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $coupon = Coupon::findOrFail($id);
        return response()->json([
            'coupon'=>CouponClaseProductResource::make($coupon)
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
        $IS_EXISTS = Coupon::where("id","<>",$id)->where("code", $request->code)->first();
        if($IS_EXISTS){
            return response()->json([
                "message"=>403,
                "message_text"=>"El codigo del coupon ya existe"
            ]);
        }

        $coupon = Coupon::findOrFail($id);
        $coupon->update($request->all());

        foreach($coupon->categories as $key => $categorieD){
            $categorieD->delete();
        }

        foreach($coupon->products as $key => $productD){
            $productD->delete();
        }
        
        if($request->type_coupon == 1){
            
            foreach($request->product_selected as $key => $product){
                CouponProduct::create([
                    "coupon_id"=> $coupon->id,
                    "product_id"=> $product["id"],
                ]);
            }
        }
        if($request->type_coupon == 2){
            foreach($request->category_selected as $key => $categorie){
                CouponCategorie::create([
                    "coupon_id"=> $coupon->id,
                    "category_id"=> $categorie["id"],
                ]);
            }
        }

        return response()->json(["message"=>200]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $coupon = Coupon::findOrFail($id);
        $coupon->delete();

        return response()->json(["message"=>200]);
    }
}
