<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Endesarollo extends Model
{
    use HasFactory;
    protected $fillable = [
        'title',
        'type',
        'description',
        'user_id',
        // 'category_id',
        'state',
    ];

    /*
    |--------------------------------------------------------------------------
    | RELATIONS
    |--------------------------------------------------------------------------
    */

    public function users()
    {
        return $this->belongsTo(User::class, 'id');
    }

    // public function categorias()
    // {
    //     return $this->belongsTo(Categoria::class, 'category_id');
    // }

    //filtro

    public function scopeFilterAdvance($query, $search, $state)
    {
        if($search){
            $query->where('title', 'like', '%'.$search.'%');
        }
        if($search){
            $query->where('description', 'like', '%'.$search.'%');
        }
        if($state){
            $query->where('state', $state);
        }
        return $query;
    }
}
