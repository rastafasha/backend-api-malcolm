<?php

namespace App\Models;

use App\Models\Categoria;
use App\Models\Portafolio;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Categoria extends Model
{
    use HasFactory;
    /*
    |--------------------------------------------------------------------------
    | goblan variables
    |--------------------------------------------------------------------------
    */
    protected $fillable = [

        'name',
        'status',

    ];

    const PUBLISHED = 'PUBLISHED';
    const PENDING = 'PENDING';
    /*
    |--------------------------------------------------------------------------
    | functions
    |--------------------------------------------------------------------------
    */

    public function scopeForPublic(Builder $builder)
    {
        $builder->where("status", Categoria::PUBLISHED);
        return $builder->get();
    }


    /*
    |--------------------------------------------------------------------------
    | RELATIONS
    |--------------------------------------------------------------------------
    */

    public function portafolios()
    {
        return $this->hasMany(Portafolio::class);
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
    //     return self::where('name', 'like', "%$query%")
    //     ->get();
    // }
    public function scopeFilterAdvance($query, $search, $state)
    {
        if($search){
            $query->where('name', 'like', '%'.$search.'%');
        }
        if($state){
            $query->where('state', $state);
        }
        return $query;
    }
}
