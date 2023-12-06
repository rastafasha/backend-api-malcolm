<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\tienda\pickupController;


Route::get('/pickup', [pickupController::class, 'index'])
    ->name('pickup.index');

Route::post('/pickup/store', [pickupController::class, 'store'])
    ->name('pickup.store');

Route::get('/pickup/show/{pickup}', [pickupController::class, 'show'])
    ->name('pickup.show');


Route::post('/pickup/update/{pickup}', [pickupController::class, 'update'])
    ->name('pickup.update');

Route::delete('/pickup/destroy/{pickup}', [pickupController::class, 'destroy'])
    ->name('portafolio.destroy');

