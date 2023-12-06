<?php

namespace App\Http\Controllers\tienda;

use Carbon\Carbon;
use App\Models\User;
use Illuminate\Http\Request;
use App\Models\Course\Course;
use App\Models\CoursesStudent;
use App\Models\Course\Category;
use App\Models\Product\Product;
use App\Models\ProductsStudent;
use App\Models\Discount\Discount;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\Product\CategoryProduct;
use App\Models\Discount\DiscountProduct;
use App\Http\Resources\Curso\CourseResource;
use App\Http\Resources\Product\ProductResource;
use App\Http\Resources\Product\ProductCollection;
use App\Http\Resources\Ecommerce\Course\CourseHomeResource;
use App\Http\Resources\Ecommerce\Course\CourseHomeCollection;
use App\Http\Resources\Ecommerce\Product\ProductHomeResource;
use App\Http\Resources\Ecommerce\Product\ProductHomeCollection;
use App\Http\Resources\Ecommerce\LandingCurso\LandingCursoResource;
use App\Http\Resources\Ecommerce\LandingProduct\LandingProductResource;

class HomeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function home(Request $request)
    {
        $categories =Category::where("category_id", null)
                    ->withCount("courses")
                    ->orderBy("id", "desc")
                    ->get();
        $categoriesProducts =CategoryProduct::where("category_product_id", null)
                    ->withCount("products")
                    ->orderBy("id", "desc")
                    ->get();
        
        $courses = Course::where("state", 2)->inRandomOrder()->limit(3)->get();
        $products = Product::where("state", 2)->inRandomOrder()->limit(3)->get();
        
        $categories_courses =Category::where("category_id", null)
                                ->withCount("courses")
                                ->having("courses_count",">",0)
                                ->orderBy("id", "desc")
                                ->take(5)
                                ->get();
        $categories_products =CategoryProduct::where("category_product_id", null)
                                ->withCount("products")
                                ->having("products_count",">",0)
                                ->orderBy("id", "desc")
                                ->take(5)
                                ->get();

        $group_courses_categories = collect([]);
        $group_products_categories = collect([]);

        foreach ($categories_courses as $key => $categories_course) {
            $group_courses_categories->push([
                "id"=>$categories_course->id,
                "nombre"=>$categories_course->nombre,
                "name_empty"=>str_replace(" ", "", $categories_course->nombre),
                "courses_count"=>$categories_course->courses_count,
                "courses"=> CourseHomeCollection::make($categories_course->courses)
            ]);
        }
        foreach ($categories_products as $key => $categories_product) {
            $group_products_categories->push([
                "id"=>$categories_product->id,
                "nombre"=>$categories_product->nombre,
                "name_empty"=>str_replace(" ", "", $categories_product->nombre),
                "products_count"=>$categories_product->products_count,
                "products"=> ProductHomeCollection::make($categories_product->products)
            ]);
        }

        
        date_default_timezone_set("America/Caracas"); 

        $discount_banner = Discount::where("type_campaing", 3)
                            ->where("state",1)
                            ->where("start_date", "<", today())
                            ->where("end_date",">", today())
                            ->first();

        // $discount_product_banner = DiscountProduct::where("type_campaing_product", 3)
        //                     ->where("state",1)
        //                     ->where("start_date", "<", today())
        //                     ->where("end_date",">", today())
        //                     ->first();
        $discount_banner_courses = collect([]);
        // $discount_banner_products = collect([]);
        if($discount_banner){
            foreach ($discount_banner->courses as $key => $course_discount) {
                $discount_banner_courses->push(CourseHomeResource::make($course_discount->course));
            } 

        }
        // if($discount_product_banner){
        //     foreach ($discount_product_banner->products as $key => $product_discount) {
        //         $discount_banner_products->push(ProductHomeResource::make($product_discount->product));
        //     } 

        // }

        date_default_timezone_set("America/Caracas"); 

        $discount_flash = Discount::where("type_campaing", 2)
                            ->where("state",1)
                            ->where("start_date", "<=", today())
                            ->where("end_date",">=", today())
                            ->first();

        // $discount_flash_product = DiscountProduct::where("type_campaing_product", 2)
        //                     ->where("state",1)
        //                     ->where("start_date", "<=", today())
        //                     ->where("end_date",">=", today())
        //                     ->first();

        $discount_flash_courses = collect([]);
        // $discount_flash_products = collect([]);
        if($discount_flash){
            $discount_flash->end_date = Carbon::parse($discount_flash->end_date)->addDays(1);
            foreach ($discount_flash->courses as $key => $course_discount) {
                $discount_flash_courses->push(CourseHomeResource::make($course_discount->course));
            } 

        }
        // if($discount_flash_product){
        //     $discount_flash_product->end_date = Carbon::parse($discount_flash->end_date)->addDays(1);
        //     foreach ($discount_flash_product->products as $key => $product_discount) {
        //         $discount_flash_products->push(ProductHomeResource::make($product_discount->product));
        //     } 

        // }
                            
        return response()->json([
            "categories" =>$categories ->map(function($category){
                return [
                    "id"=>$category->id,
                    "nombre"=>$category->nombre,
                    "imagen"=> env("APP_URL")."storage/".$category->imagen,
                    "course_count"=>$category->courses_count,
                    
                ];
            }),
            "courses_home"=> CourseHomeCollection::make($courses),
            "products_home"=> ProductHomeCollection::make($products),
            "group_courses_categories"=> $group_courses_categories,
            "group_products_categories"=> $group_products_categories,
            "discount_banner"=>$discount_banner,
            // "discount_product_banner"=>$discount_product_banner,
            "discount_banner_courses"=>$discount_banner_courses,
            // "discount_banner_products"=>$discount_banner_products,
            "discount_flash"=> $discount_flash ? [
                "id"=>$discount_flash->id,
                "discount"=>$discount_flash->discount,
                "code"=>$discount_flash->code,
                "type_campaing"=>$discount_flash->type_campaing,
                "type_discount"=>$discount_flash->type_discount,
                "end_date"=>Carbon::parse($discount_flash->end_date)->format("Y-m-d"),
                "start_date_d"=>Carbon::parse($discount_flash->start_date)->format("d/m/Y"),
                "end_date_d"=>Carbon::parse($discount_flash->end_date)->subDay(1)->format("d/m/Y"),
            ]: null,
            // "discount_flash_product"=> $discount_flash_product ? [
            //     "id"=>$discount_flash_product->id,
            //     "discount"=>$discount_flash_product->discount,
            //     "code"=>$discount_flash_product->code,
            //     "type_campaing"=>$discount_flash_product->type_campaing,
            //     "type_discount"=>$discount_flash_product->type_discount,
            //     "end_date"=>Carbon::parse($discount_flash_product->end_date)->format("Y-m-d"),
            //     "start_date_d"=>Carbon::parse($discount_flash_product->start_date)->format("d/m/Y"),
            //     "end_date_d"=>Carbon::parse($discount_flash_product->end_date)->subDay(1)->format("d/m/Y"),
            // ]: null,
            "discount_flash_courses"=>$discount_flash_courses,
            // "discount_flash_products"=>$discount_flash_products,
        ]);
    }

    /**
     * Show the form for course detail.
     */
    public function course_detail(Request $request, $slug)
    {
        $campaing_discount = $request->get("campaing_discount");
        $discount = null;
        if($campaing_discount){
            $discount = Discount::findOrFail($campaing_discount);
        } 
        $course = Course::where('slug', $slug)->first();
        $isHaveCourse = false;
        if(!$course){
            return 404;
        }
        if(Auth::guard('api')->check()){
            $course_student = CoursesStudent::where("user_id", auth('api')->user()->id)
            ->where("course_id", $course->id)->first();
            if($course_student){
                $isHaveCourse = true;
            }
        }
        

        $courses_related_instructor = Course::where("id","<>",$course->id)->where('user_id', $course->user_id)->inRandomOrder()->take(2)->get();
        $courses_related_category = Course::where("id","<>",$course->id)->where('category_id', $course->category_id)->inRandomOrder()->take(3)->get();

        return response()->json([
            "course"=> LandingCursoResource::make($course),
            "courses_related_instructor"=> $courses_related_instructor->map(function($course){
                return CourseHomeResource::make($course);
            }),
            "courses_related_category"=> $courses_related_category->map(function($course){
                return CourseHomeResource::make($course);

            }),
            "DISCOUNT" =>$discount,
            "isHaveCourse"=>$isHaveCourse,
        ]);
    }

    /**
     * busqueda.
     */
    public function listCourses(Request $request)
    {
        $search = $request->search;
        $selectedCategories = $request->selectedCategories ?? [];
        $instructoresSelected = $request->instructoresSelected ?? [];
        $min_price = $request->min_price;
        $max_price = $request->max_price;
        $levelsSelected = $request->levelsSelected ?? [];
        $idiomasSelected = $request->idiomasSelected ?? [];
        $ratingSelected = $request->ratingSelected;
        
        $courses_a = [];
        if($ratingSelected){
            $courses_query = Course::where("state",2)
                        ->join("reviews", "reviews.course_id", "=", "courses.id")
                        ->select("courses.id as courseId", DB::raw("AVG(reviews.rating) as rating_reviews"))
                        ->groupBy("courseId")
                        ->having("rating_reviews", ">=", $ratingSelected)
                        ->having("rating_reviews", "<", $ratingSelected + 1)
                        ->get();

            $courses_a = $courses_query->pluck("courseId")->toArray();
            // error_log(json_encode($courses_query));
        }

        // if(!$search){
        //     return response()->json([
        //         "courses"=>[]
        //     ]);
        // }

        $courses = Course::filterAdvanceEcommerce(
                        $search, $selectedCategories, 
                        $instructoresSelected, 
                        $min_price, $max_price,
                        $levelsSelected, $idiomasSelected,
                        $courses_a, $ratingSelected
                        )->where("state",2)->orderBy("id", "desc")->get();

        return response()->json([
            "courses"=>CourseHomeCollection::make($courses)
        ]);
    }

    //listado para filtro de busqueda
    public function config_all()
    {
        $categories =Category::where("category_id", null)
                    ->withCount("courses")
                    ->orderBy("id", "desc")
                    ->get();
        
        $instructores = User::where("isInstructor",1)->orderBy("id","desc")->get();
        
        return response()->json([
            "categories"=>$categories,
            "instructores" => $instructores->map(function($instructor){
                return [
                    "id" => $instructor->id,
                    "courses_count" => $instructor->courses_count,
                    "full_name" => $instructor->name.' '.$instructor->surname,
                ];
            }),
            "levels"=>["Básico", "Intermedio", "Avanzado"],
            "idiomas"=>["Español", "Inglés", "Portugues"]

        ]);
    }


    public function course_lesson(Request $resquest, $slug){
        $course = Course::where('slug', $slug)->first();
        $isHaveCourse = false;
        if(!$course){
            return response()->json([
                "message"=> 403,
                "message_text"=>"El curso no existe" ,
            ]);
        }

        $course_student = CoursesStudent::where("course_id", $course->id)
                                ->where("user_id", auth('api')->user()->id)
                                ->first();

        if(!$course_student){
            return response()->json([
                "message"=> 403,
                "message_text"=>"No estas inscrito en este curso" ,
            ]);
        }

        return response()->json([
            "course"=> LandingCursoResource::make($course),
        ]);
    }

    //product

    public function product_detail(Request $request, $slug)
    {
        $campaing_discount = $request->get("campaing_discount");
        $discount_product = null;
        if($campaing_discount){
            $discount_product = Discount::findOrFail($campaing_discount);
        } 
        $product = Product::where('slug', $slug)->first();
        $isHaveProduct = false;
        if(!$product){
            return 404;
        }
        if(Auth::guard('api')->check()){
            $product_student = ProductsStudent::where("user_id", auth('api')->user()->id)//falta
            ->where("product_id", $product->id)->first();
            if($product_student){
                $isHaveProduct = true;
            }
        }
        

        $products_related_instructor = Product::where("id","<>",$product->id)->where('user_id', $product->user_id)->inRandomOrder()->take(2)->get();
        $products_related_category = Product::where("id","<>",$product->id)->where('category_product_id', $product->category_product_id)->inRandomOrder()->take(3)->get();

        return response()->json([
            "product"=> LandingProductResource::make($product),
            
            "products_related_category"=> $products_related_category->map(function($product){
                return ProductHomeResource::make($product);

            }),
            "discount_product" =>$discount_product,
            "isHaveProduct"=>$isHaveProduct,
        ]);
    }

    /**
     * busqueda.
     */
    public function listProducts(Request $request)
    {
        $search = $request->search;
        $selectedCategories = $request->selectedCategories ?? [];
        $min_price = $request->min_price;
        $max_price = $request->max_price;
        $ratingSelected = $request->ratingSelected;
        
        $products_a = [];
        if($ratingSelected){
            $products_query = Product::where("state",2)
                        ->join("reviews", "reviews.product_id", "=", "products.id")
                        ->select("products.id as productId", DB::raw("AVG(reviews.rating) as rating_reviews"))
                        ->groupBy("productId")
                        ->having("rating_reviews", ">=", $ratingSelected)
                        ->having("rating_reviews", "<", $ratingSelected + 1)
                        ->get();

            $products_a = $products_query->pluck("productId")->toArray();
            // error_log(json_encode($courses_query));
        }

        // if(!$search){
        //     return response()->json([
        //         "courses"=>[]
        //     ]);
        // }

        $products = Product::filterAdvanceEcommerce(
                        $search, $selectedCategories, 
                        $min_price, $max_price,
                        $products_a, $ratingSelected
                        )->where("state",2)->orderBy("id", "desc")->get();

        return response()->json([
            "products"=>ProductHomeCollection::make($products)
        ]);
    }
}
