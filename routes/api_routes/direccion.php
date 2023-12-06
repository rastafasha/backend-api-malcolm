<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\tienda\direccionController;


Route::get('/direccion', [direccionController::class, 'index'])
    ->name('direccion.index');

Route::post('/direccion/store', [direccionController::class, 'store'])
    ->name('direccion.store');

Route::get('/direccion/show/{direccion}', [direccionController::class, 'show'])
    ->name('direccion.show');

Route::get('/direccion/{user}', [direccionController::class, 'direccionuser'])
    ->name('direccion.direccionuser');



Route::post('/direccion/update/{direccion}', [direccionController::class, 'update'])
    ->name('direccion.update');

Route::delete('/direccion/destroy/{direccion}', [direccionController::class, 'destroy'])
    ->name('direccion.destroy');

