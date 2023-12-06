<?php

namespace App\Models;

use App\Models\User;
use App\Models\Categoria;
use App\Models\Course\Category;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Blog extends Model
{
    use HasFactory;
    protected $fillable = [
        'title',
        'description',
        'slug',
        'youtubeurl',
        'popup',
        'url',
        'user_id',
        'category_id',
        'imagen',
        'status',
    ];

    const PUBLISHED = 'PUBLISHED';
    const PENDING = 'PENDING';
    const REJECTED = 'REJECTED';

    /*
    |--------------------------------------------------------------------------
    | functions
    |--------------------------------------------------------------------------
    */

    public function scopeForPublic(Builder $builder)
    {
        $builder->where("status", Blog::PUBLISHED);
        return $builder->get();
    }

    public function setCreateAttribute($value){
        date_default_timezone_set("America/Caracas"); 
        $this->attribute['created_at']= Carbon::now();
    }

    public function setUpdateAttribute($value){
        date_default_timezone_set("America/Caracas"); 
        $this->attribute['updated_at']= Carbon::now();
    }


    /*
    |--------------------------------------------------------------------------
    | RELATIONS
    |--------------------------------------------------------------------------
    */

    public function user()
    {
        return $this->belongsTo(User::class, 'id');
    }

    public function categorias()
    {
        return $this->belongsTo(Categoria::class, 'category_id');
    }


    /*
    |--------------------------------------------------------------------------
    | search
    |--------------------------------------------------------------------------
    */

    // public static function search($query = ''){
    //     if(!$query){
    //         return self::all();
    //     }
    //     return self::where('title', 'like', "%$query%")
    //     ->orWhere('description', 'like', "%$query%")
    //     ->get();
    // }

    public function scopeFilterAdvance($query, $search, $status)
    {
        if($search){
            $query->where('title', 'like', '%'.$search.'%');
        }
        if($search){
            $query->where('description', 'like', '%'.$search.'%');
        }
        if($status){
            $query->where('status', $status);
        }
        return $query;
    }
}
