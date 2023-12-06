<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\blog\blogController;


Route::get('/blogs', [blogController::class, 'index'])
    ->name('blogs.index');

Route::post('/blog/store', [blogController::class, 'store'])
    ->name('blog.store');

Route::get('/blog/show/{blog}', [blogController::class, 'show'])
    ->name('blog.show');

Route::get('/blog/activos', [blogController::class, 'activos'])
    ->name('blog.activos');
    
Route::get('/blog/destacados', [blogController::class, 'destacados'])
    ->name('blog.destacados');

Route::get('/blog/showbyName/{blog:name}', [blogController::class, 'show'])
    ->name('blog.show');

Route::post('/blog/update/{blog}', [blogController::class, 'update'])
    ->name('blog.update');

Route::delete('/blog/destroy/{blog}', [blogController::class, 'destroy'])
    ->name('blog.destroy');

    Route::get('/blog/search', [blogController::class, 'search'])
    ->name('blog.search');

    Route::put('/blog/update/status/{blog}', [blogController::class, 'updateStatus'])
    ->name('blog.blogUpdateStatus');

Route::get('/blog/show/slug/{slug}', [blogController::class, 'blogShowSlug'])
    ->name('blog.blogShowSlug');
