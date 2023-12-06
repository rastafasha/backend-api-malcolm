<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\admin\sales\salesController;


Route::get('/sale', [salesController::class, 'index'])
    ->name('sale.index');


Route::get('/sale/show/{sale}', [salesController::class, 'show'])
    ->name('sale.show');

Route::get('/sale/recientes', [salesController::class, 'recientes'])
    ->name('sale.recientes');

Route::post('/sale/update/{sale}', [salesController::class, 'update'])
    ->name('sale.update');
