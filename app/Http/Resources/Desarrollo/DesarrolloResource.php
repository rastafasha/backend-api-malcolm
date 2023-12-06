<?php

namespace App\Http\Resources\enDesarollo;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class DesarrolloResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return[
                
            'id'=>$this->resource-> id,
            'title'=>$this->resource->title,
            'type'=>$this->resource->type,
            'description'=>$this->resource-> description,
            'slug'=>$this->resource-> slug,
            "imagen"=> $this->resource->imagen ? env("APP_URL")."storage/".$this->resource->imagen : null,
            'state'=>$this->resource-> state,
            // 'category_id'=>$this->resource-> category_id,
            // 'categorias'=>[
            //     'id'=> $this->resource->categorias->id,
            //     'name'=> $this->resource->categorias->name
            // ],
            'user_id'=>$this->resource-> user_id,
            // 'user'=>[
            //     'id'=>$this->resource->user->id,
            //     'name'=>$this->resource->user->name,
            //     'email'=>$this->resource->user->email,
            // ],
    ];
    }
}
