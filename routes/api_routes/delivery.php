<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\tienda\deliveryController;


Route::get('/delivery', [deliveryController::class, 'index'])
    ->name('delivery.index');

Route::post('/delivery/store', [deliveryController::class, 'store'])
    ->name('delivery.store');

Route::get('/delivery/show/{delivery}', [deliveryController::class, 'show'])
    ->name('delivery.show');


Route::post('/delivery/update/{delivery}', [deliveryController::class, 'update'])
    ->name('delivery.update');

Route::delete('/delivery/destroy/{delivery}', [deliveryController::class, 'destroy'])
    ->name('portafolio.destroy');

