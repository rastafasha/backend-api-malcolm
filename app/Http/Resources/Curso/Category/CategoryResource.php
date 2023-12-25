<?php

namespace App\Http\Resources\Curso\Category;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class CategoryResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return[
            "id"=>$this->resource->id,
            "nombre"=>$this->resource->nombre,
            // "imagen"=> $this->resource->imagen ? env("APP_URL")."storage/".$this->resource->imagen : null,
            "imagen"=> $this->resource->imagen ? env("APP_URL").$this->resource->imagen : null,
            "category_id"=>$this->resource->category_id,
            "category_id"=>$this->resource->father ? [
                "id"=> $this->resource->father->id,
                "nombre"=> $this->resource->father->nombre,
                // "imagen"=> $this->resource->father->imagen ? env("APP_URL")."storage/".$this->resource->father->imagen : null,
                "imagen"=> $this->resource->father->imagen ? env("APP_URL").$this->resource->father->imagen : null,
            ]: null,
            "state"=>$this->resource->state ?? 1,
        ];
    }
}
