<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\admin\sales\salesController;


Route::get('/sale', [salesController::class, 'index'])
    ->name('sale.index');
Route::get('/sale-categories', [salesController::class, 'categoriasVentas'])
    ->name('sale.categoriasVentas');
Route::get('/sale/config', [salesController::class, 'config'])
    ->name('sale.config');


Route::get('/sale/show/{sale}', [salesController::class, 'show'])
    ->name('sale.show');

Route::get('/sale/recientes', [salesController::class, 'recientes'])
    ->name('sale.recientes');

Route::post('/sale/update/{sale}', [salesController::class, 'update'])
    ->name('sale.update');

Route::post('/sale/update-status/{sale}', [salesController::class, 'updateStatus'])
    ->name('sale.updateStatus');


    Route::get('/sale/entregado', [salesController::class, 'pedidoEntregado'])
    ->name('sale.pedidoEntregado');

    Route::get('/sale/cancelado', [salesController::class, 'pedidoCancelados'])
    ->name('sale.pedidoCancelados');
