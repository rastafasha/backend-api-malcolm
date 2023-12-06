<?php

namespace App\Http\Resources\enDesarrollo;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;

class DesarrolloCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @return array<int|string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            "data" =>DesarrolloResource::collection($this->collection)
        ];
    }
}
