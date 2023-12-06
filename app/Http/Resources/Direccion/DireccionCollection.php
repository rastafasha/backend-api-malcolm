<?php

namespace App\Http\Resources\Direccion;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;

class DireccionCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @return array<int|string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            "data" =>DireccionResource::collection($this->collection)
        ];
    }
}
