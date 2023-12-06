<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ContactFormController;




Route::get('/contact', [ContactFormController::class, 'index'])
    ->name('subcripcion.index');

Route::post('/contact/store', [ContactFormController::class, 'store'])
    ->name('contact.store');

Route::get('/contact/show/{contact}', [ContactFormController::class, 'show'])
    ->name('contact.show');