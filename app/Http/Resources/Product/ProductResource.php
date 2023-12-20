<?php

namespace App\Http\Resources\Product;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
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
                'title'=>$this->resource-> title,
                'subtitle'=>$this->resource-> subtitle,
                'slug'=>$this->resource-> slug,
                'price_usd'=>$this->resource-> price_usd,
                'price_bves'=>$this->resource-> price_bves,
                "imagen"=> $this->resource->imagen ? env("APP_URL")."storage/".$this->resource->imagen : null,
                // "imagen"=> $this->resource->imagen ? env("APP_URL").$this->resource->imagen : null,
                'category_product_id'=>$this->resource->category_product_id,
                'categories_product'=>[
                    'id'=> $this->resource->categories_product->id,
                    'name'=> $this->resource->categories_product->nombre
                ],
                'sub_category_id'=>$this->resource->sub_category_id,
                'sub_category'=>[
                    'id'=> $this->resource->sub_category->id,
                    'name'=> $this->resource->sub_category->nombre
                ],
                'user_id'=>$this->resource-> user_id,
                'user'=>[
                    'id'=>$this->resource->instructor->id,
                    'full_name'=>$this->resource->instructor->name.' '.$this->resource->instructor->surname,
                    'email'=>$this->resource->instructor->email,
                ],
                'vimeo_id'=>$this->resource-> vimeo_id,
                'description'=>$this->resource-> description,
                'who_is_it_for'=>json_decode($this->resource-> who_is_it_for),
                'requirements'=> json_decode($this->resource-> requirements),
                'colors'=> json_decode($this->resource-> colors),
                'peso'=> json_decode($this->resource-> peso),
                'medida'=> json_decode($this->resource-> medida),
                'material'=> json_decode($this->resource-> material),
                'state'=>$this->resource-> state,
        ];
    }
}
