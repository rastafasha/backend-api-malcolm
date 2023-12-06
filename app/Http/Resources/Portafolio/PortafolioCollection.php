<?php

namespace App\Http\Resources\Portafolio;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;

class PortafolioCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @return array<int|string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            "data" =>PortafolioResource::collection($this->collection)
        ];
    }
}
