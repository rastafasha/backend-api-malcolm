<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\admin\product\CategoryProductController;


Route::get('/categoria-product', [CategoryProductController::class, 'index'])
    ->name('categorias.index');

Route::post('/categoria-product/store', [CategoryProductController::class, 'store'])
    ->name('categorias.store');

Route::get('/categoria-product/show/{categoria}', [CategoryProductController::class, 'show'])
    ->name('categorias.show');

Route::get('/categoria-product/activos', [CategoryProductController::class, 'activos'])
    ->name('categorias.activos');

Route::get('/categoria-product/showbyName/{categoria:name}', [CategoryProductController::class, 'show'])
    ->name('categorias.show');

Route::post('/categoria-product/update/{categoria}', [CategoryProductController::class, 'update'])
    ->name('categoria.update');

Route::delete('/categoria-product/destroy/{categoria}', [CategoryProductController::class, 'destroy'])
    ->name('categorias.destroy');

    Route::get('/categoria-product/search', [CategoryProductController::class, 'search'])
    ->name('categorias.search');

    Route::put('/categoria-product/update/status/{categoria}', [CategoryProductController::class, 'categoriaUpdateStatus'])
    ->name('categoria.categoriaUpdateStatus');
