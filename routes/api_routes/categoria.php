<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\portafolio\categoriaController;


Route::get('/categorias', [categoriaController::class, 'index'])
    ->name('categorias.index');

Route::post('/categorias/store', [categoriaController::class, 'categoriaStore'])
    ->name('categorias.store');

Route::get('/categorias/show/{categoria}', [categoriaController::class, 'categoriaShow'])
    ->name('categorias.show');

Route::get('/categorias/activos', [categoriaController::class, 'activos'])
    ->name('categorias.activos');

Route::get('/categorias/showbyName/{categoria:name}', [categoriaController::class, 'categoriaShow'])
    ->name('categorias.show');

Route::put('/categorias/update/{categoria}', [categoriaController::class, 'categoriaUpdate'])
    ->name('categoria.update');

Route::delete('/categorias/destroy/{categoria}', [categoriaController::class, 'destroy'])
    ->name('categorias.destroy');

    Route::get('/categorias/search', [categoriaController::class, 'search'])
    ->name('categorias.search');

    Route::put('/categorias/update/status/{categoria}', [categoriaController::class, 'categoriaUpdateStatus'])
    ->name('categoria.categoriaUpdateStatus');
