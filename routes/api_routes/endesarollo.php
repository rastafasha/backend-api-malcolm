<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\portafolio\enDesarrolloController;


Route::get('/endesarrollo', [enDesarrolloController::class, 'index'])
    ->name('endesarrollo.index');

Route::post('/endesarrollo/store', [enDesarrolloController::class, 'store'])
    ->name('endesarrollo.store');

Route::get('/endesarrollo/show/{endesarrollo}', [enDesarrolloController::class, 'endesarrollohow'])
    ->name('endesarrollo.show');

Route::get('/endesarrollo/activos', [enDesarrolloController::class, 'activos'])
    ->name('endesarrollo.activos');

Route::get('/endesarrollo/showbyName/{endesarrollo:name}', [enDesarrolloController::class, 'show'])
    ->name('endesarrollo.show');

Route::put('/endesarrollo/update/{endesarrollo}', [enDesarrolloController::class, 'update'])
    ->name('endesarrollo.update');

Route::delete('/endesarrollo/destroy/{endesarrollo}', [enDesarrolloController::class, 'destroy'])
    ->name('endesarrollo.destroy');

    Route::get('/endesarrollo/search', [enDesarrolloController::class, 'search'])
    ->name('endesarrollo.search');

    Route::put('/endesarrollo/update/status/{endesarrollo}', [enDesarrolloController::class, 'updateStatus'])
    ->name('endesarrollo.endesarrolloUpdateStatus');
