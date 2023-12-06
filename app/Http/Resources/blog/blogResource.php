<?php

namespace App\Http\Resources\blog;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class blogResource extends JsonResource
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
            'description'=>$this->resource-> description,
            'slug'=>$this->resource-> slug,
            'youtubeurl'=>$this->resource-> youtubeurl,
            'popup'=>$this->resource-> popup,
            'url'=>$this->resource-> url,
            "imagen"=> $this->resource->imagen ? env("APP_URL")."storage/".$this->resource->imagen : null,
            'status'=>$this->resource-> status,
            'category_id'=>$this->resource-> category_id,
            // 'categorias'=>[
            //     'id'=> $this->resource->categorias->id,
            //     'name'=> $this->resource->categorias->name
            // ],
            
            'user_id'=>$this->resource-> user_id,
            'user'=>[
                'id'=>$this->resource->user->id,
                'name'=>$this->resource->user->name,
                'email'=>$this->resource->user->email,
            ],
    ];
    }
}
