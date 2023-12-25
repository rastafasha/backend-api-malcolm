<?php

namespace App\Models\Portafolio;

use App\Models\User;
use App\Models\Portafolio\Categoria;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Portafolio extends Model
{
    use HasFactory;
    protected $fillable = [
        'title',
        'description',
        'slug',
        'isFeatured',
        'youtubeurl',
        'popup',
        'url',
        'user_id',
        'category_portafolio_id',
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
        $builder->where("status", Portafolio::PUBLISHED);
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

    public function users()
    {
        return $this->belongsTo(User::class, 'id');
    }

    public function categorias()
    {
        return $this->belongsTo(Categoria::class);
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
