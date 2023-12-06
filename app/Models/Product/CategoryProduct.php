<?php

namespace App\Models\Product;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class CategoryProduct extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable =[
        'nombre',
        'imagen',
        'state',
        'category_product_id',

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
    public function children(){
        return $this->hasMany(CategoryProduct::class, "category_product_id");
    }
    public function father(){
        return $this->belongsTo(CategoryProduct::class, "category_product_id");
        
    }
    public function products(){
        return $this->hasMany(Product::class);
        
    }
    public function discount_product_categories(){
        return $this->hasMany(DiscountProductCategorie::class);
        
    }

    // buscar

    public function scopeFilterAdvance($query, $search, $state)
    {
        if($search){
            $query->where('nombre', 'like', '%'.$search.'%');
        }
        if($state){
            $query->where('state', $state);
        }
        return $query;
    }
}
