<?php

namespace App\Models\Product;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Sale\Review;
use App\Models\ProductsStudent;
use App\Models\Product\CategoryProduct;
use App\Models\Product\ProductSection;
use Illuminate\Database\Eloquent\Model;
use App\Models\Discount\DiscountProduct;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Discount\DiscountProductCategorie;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Product extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable =[
        'id',
        'title',
        'subtitle',
        'slug',
        'imagen',
        'price_usd',
        'price_bves',
        'user_id',
        'category_product_id',
        'sub_category_id',
        'vimeo_id',
        'time',
        'description',
        'requirements',
        'who_is_it_for',
        'colors',
        'peso',
        'medida',
        'material',
        'state',

    ];

    public function setCreateAttribute($value){
        date_default_timezone_set("America/Caracas"); 
        $this->attribute['created_at']= Carbon::now();
    }

    public function setUpdateAttribute($value){
        date_default_timezone_set("America/Caracas"); 
        $this->attribute['updated_at']= Carbon::now();
    }

    
    // relaciones

    public function instructor(){
        return $this->belongsTo(User::class, 'user_id');
    }

    public function categories_product(){
        return $this->belongsTo(CategoryProduct::class, 'category_product_id');
    }

    public function sub_category(){
        return $this->belongsTo(CategoryProduct::class);
    }

    public function sections(){
        return $this->hasMany(ProductSection::class);
    }
    public function discount_products(){
        return $this->hasMany(DiscountProduct::class);
    }

    public function discount_categories(){
        return $this->hasMany(DiscountProductCategorie::class);
    }

    public function product_students(){
        return $this->hasMany(ProductsStudent::class);
    }

    public function reviews(){
        return $this->hasMany(Review::class);
    }


    // buscar admin

    public function scopeFilterAdvance($query, $search, $state)
    {
        if($search){
            $query->where('title', 'like', '%'.$search.'%');
        }
        if($state){
            $query->where('state', $state);
        }
        return $query;
    }


    //buscar tienda

    public function scopeFilterAdvanceEcommerce($query, $search, 
    $selectedCategories =[], $instructoresSelected = [],
    $min_price = 0, $max_price = 0,
    $levelsSelected = [], $idiomasSelected = [],
    $products_a = [], $ratingSelected = 0
    )
    {
        if($search){
            $query->where('title', 'like', '%'.$search.'%');
        }
        if(sizeof($selectedCategories) > 0){
            $query->whereIn('category_product_id',$selectedCategories);
        }
        // if(sizeof($instructoresSelected) > 0){
        //     $query->whereIn('user_id',$instructoresSelected);
        // }
        if($min_price > 0 && $max_price > 0 ){
            $query->whereBetween('price_usd', [$min_price, $max_price]);
        }
        
        if($products_a || $ratingSelected ){
            $query->whereIn('id',$products_a);
        }
        return $query;
    }

    public function getDiscountCAttribute(){
        date_default_timezone_set("America/Caracas");
        $discount = null;
        foreach ($this->discount_products as $key => $discount_product) {
            if($discount_product->discount->type_campaing == 1 && $discount_product->discount->state == 1){
                if(Carbon::now()->between($discount_product->discount->start_date, Carbon::parse($discount_product->discount->end_date)->addDays(1))){
                    //existe una campaña de descuento con el curso
                    $discount = $discount_product->discount;
                    break;
                }
            }
        }
        return $discount;
    }
    public function getDiscountCTPAttribute(){
        date_default_timezone_set("America/Caracas");
        $discount = null;
        foreach ($this->category->discount_categories as $key => $discount_categorie) {
            if($discount_categorie->discount->type_campaing == 1 && $discount_categorie->discount->state == 1){
                if(Carbon::now()->between($discount_categorie->discount->start_date, Carbon::parse($discount_categorie->discount->end_date)->addDays(1))){
                    //existe una campaña de descuento con el curso
                    $discount = $discount_categorie->discount;
                    break;
                }
            }
        }
        return $discount;
    }

    

    // public function getCountStudentsAttribute(){
        
    //     return $this->product_students->count();
    // }
    
    // public function getCountReviewsAttribute(){
        
    //     return $this->reviews_products->count();
    // }
    
    // public function getAvgReviewsAttribute(){
        
    //     return $this->reviews_products->avg("rating");
    // }
    



}
