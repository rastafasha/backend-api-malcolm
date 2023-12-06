<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\portafolio\portafolioController;


Route::get('/portafolio', [portafolioController::class, 'index'])
    ->name('portafolio.index');

Route::post('/portafolio/store', [portafolioController::class, 'store'])
    ->name('portafolio.store');

Route::get('/portafolio/show/{portafolio}', [portafolioController::class, 'show'])
    ->name('portafolio.show');

Route::get('/portafolio/activos', [portafolioController::class, 'activos'])
    ->name('portafolio.activos');

Route::get('/portafolio/showbyName/{portafolio:name}', [portafolioController::class, 'show'])
    ->name('portafolio.show');

Route::post('/portafolio/update/{portafolio}', [portafolioController::class, 'update'])
    ->name('portafolio.update');

Route::delete('/portafolio/destroy/{portafolio}', [portafolioController::class, 'destroy'])
    ->name('portafolio.destroy');

    Route::get('/portafolio/search', [portafolioController::class, 'search'])
    ->name('portafolio.search');

    Route::put('/portafolio/update/status/{portafolio}', [portafolioController::class, 'updateStatus'])
    ->name('portafolio.blogUpdateStatus');


Route::get('/portafolio/recientes', [portafolioController::class, 'recientes'])
    ->name('portafolio.recientes');

Route::get('/portafolio/destacados', [portafolioController::class, 'destacados'])
    ->name('portafolio.destacados');


Route::get('/portafolio/showcategory/{portafolio}', [portafolioController::class, 'portafolioShowWithCategory'])
    ->name('portafolio.portafolioShowWithCategory');

Route::get('/portafolio/show/slug/{slug}', [portafolioController::class, 'portafolioShowSlug'])
    ->name('portafolio.portafolioShowSlug');


Route::get('/portafolio/category/{portafolio}', [portafolioController::class, 'portafolioByCategory'])
    ->name('portafolio.portafolioByCategory');



Route::put('/portafolio/update/status/{portafolio:id}', [portafolioController::class, 'portafolioUpdateStatus'])
    ->name('portafolio.status');


Route::get('/portafolio/search/', [portafolioController::class, 'search'])
    ->name('post.search');
