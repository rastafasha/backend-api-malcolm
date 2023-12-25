<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\admin\todoController;



Route::get('/todo', [todoController::class, 'index'])
    ->name('todo.index');
Route::get('/todo/pendientes', [todoController::class, 'pendientes'])
    ->name('todo.pendientes');
    Route::get('/todo/terminados', [todoController::class, 'terminados'])
    ->name('todo.terminados');

Route::post('/todo/store', [todoController::class, 'store'])
    ->name('todo.store');

Route::get('/todo/show/{todo}', [todoController::class, 'show'])
    ->name('todo.show');

Route::get('/todo/activos', [todoController::class, 'activos'])
    ->name('todo.activos');
    
Route::get('/todo/destacados', [todoController::class, 'destacados'])
    ->name('blog.destacados');

Route::delete('/todo/destroy/{todo}', [todoController::class, 'destroy'])
    ->name('todo.destroy');


Route::put('/todo/update/status/{todo}', [todoController::class, 'updateStatus'])
    ->name('todo.updateStatus');

