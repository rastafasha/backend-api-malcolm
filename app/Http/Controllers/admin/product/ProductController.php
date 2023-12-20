<?php

namespace App\Http\Controllers\admin\product;

use Validator;
use App\Models\User;

use Illuminate\Support\Str;
use Illuminate\Http\Request;

use App\Models\Product\Product;
use App\Models\Product\CategoryProduct;
use Owenoj\LaravelGetId3\GetId3;
use Vimeo\Laravel\Facades\Vimeo;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;
use App\Http\Resources\Product\ProductResource;
use App\Http\Resources\Product\ProductCollection;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index( Request $request)
    {
        $search = $request->search;
        $state = $request->state;
        
        $products = Product::filterAdvance($search, $state)->orderby('id', 'desc')->get();

        return response()->json([
            "products" => ProductCollection::make($products)
        ]);
    }

    public function config( Request $request)
    {
        
        $category_products = CategoryProduct::where("category_product_id",NULL)->orderBy("id","desc")->get();
        $subcategories = CategoryProduct::where("category_product_id","<>",NULL)->orderBy("id","desc")->get();
    
        $instructores = User::where("isInstructor",1)->orderBy("id","desc")->get();
        
        return response()->json([
            "category_products" => $category_products,
            "subcategories" => $subcategories,
        
            "instructors" => $instructores->map(function($instructor){
                return [
                    "id" => $instructor->id,
                    "full_name" => $instructor->name.' '.$instructor->surname,
                ];
            }),
        ]);


    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $if_exist = Product::where('title', $request->title)->first();
        if($if_exist){
            return response()->json([ 
                'message'=> 403,
                'message_text'=>'Ya existe un product con este titulo'
            ]);
        }
        if($request->hasFile('portada')){
            $path = Storage::putFile('products', $request -> file('portada'));
            $request->request->add(['imagen'=>$path]);
        }

        $request ->request->add(['slug' => Str::slug($request->title)]);
        $request ->request->add(['who_is_it_for' => json_encode(explode(',', $request->who_is_it_for))]);
        $request ->request->add(['requirements' => json_encode(explode(',', $request->requirements))]);
        $request ->request->add(['colors' => json_encode(explode(',', $request->colors))]);
        $request ->request->add(['peso' => json_encode(explode(',', $request->peso))]);
        $request ->request->add(['material' => json_encode(explode(',', $request->material))]);
        $request ->request->add(['medida' => json_encode(explode(',', $request->medida))]);
        
        $product = Product::create($request->all());
        // 'course'=> CourseResource::make($course)
        return response()->json([ 
            'message'=> 200,
            'product'=> ProductResource::make($product)
        ]);

    }

    public function upload_video(Request $request, $id)
    {
        $time = 0;
        
        //instantiate class with file
        $track = new GetId3($request->file('video'));

        //get playtime
        $time = $track->getPlaytimeSeconds();

        $response = Vimeo::upload($request->file('video'));
        // importas el Log
        Log::info(json_encode($response));

        $product = Course::findOrFail($id);
        error_log(json_encode(explode("/",$response)));
        $vimeo_id = explode("/",$response)[2];

        $product->update(["vimeo_id" => $vimeo_id,"time" => date("H:i:s",$time)]);

        return response()->json([
            "link_video" => "https://player.vimeo.com/video/".$vimeo_id,
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $product = Product::findOrFail($id);
        return response()->json([
            'product'=>ProductResource::make($product)
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $if_exist = Product::where('id','<>',$id)->where('title', $request->title)->first();
        if($if_exist){
            return response()->json([ 
                'message'=> 403,
                'message_text'=>'Ya existe un product con este titulo'
            ]);
        }
        $product = Product::findOrFail($id);
        if($request->hasFile('portada')){
            //verifica si tiene imagen o no para actualizar
            if($product->imagen){
                Storage::delete($product->imagen);
            }
            $path = Storage::putFile('products', $request -> file('portada'));
            $request->request->add(['imagen'=>$path]);
        }

        $request ->request->add(['slug' => Str::slug($request->title)]);
        $request ->request->add(['who_is_it_for' => json_encode(explode(',', $request->who_is_it_for))]);
        $request ->request->add(['requirements' => json_encode(explode(',', $request->requirements))]);
        $request ->request->add(['colors' => json_encode(explode(',', $request->colors))]);
        $request ->request->add(['peso' => json_encode(explode(',', $request->peso))]);
        $request ->request->add(['material' => json_encode(explode(',', $request->material))]);
        $request ->request->add(['medida' => json_encode(explode(',', $request->medida))]);

        $product -> update($request->all());

        return response()->json(['product'=> ProductResource::make($product)]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        
        $product = Product::findOrFail($id);
        $product->delete();
        return response()->json(['message' => 200]);
    }


    public function updateStatus(Request $request, $id)
    {
        $product = Product::findOrfail($id);
        $product->state = $request->state;
        $product->update();
        return $product;
    }

    public function recientes()
    {
        $productrecientes = Product::orderBy('created_at', 'DESC')
        ->with(["categories"])
        ->get();

        return response()->json([
            'code' => 200,
            'status' => 'success',
            'productrecientes' => $productrecientes
        ], 200);
    }

    public function destacados()
    {

        $products = Product::join('categories', 'posts.category_id', '=', 'categories.id')
                ->with(["users"])
                ->with(["categories"])
                ->where('isFeatured', $featured=true)
                ->get([
                    'products.*', 'products.title',
                    'categories.*', 'categories.name',
                ]);
            return response()->json([
                'code' => 200,
                'status' => 'Listar products destacados',
                'products' => $products,
            ], 200);
    }
}
