<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\tienda\CartController;
use App\Http\Controllers\tienda\HomeController;
use App\Http\Controllers\tienda\ReviewController;
use App\Http\Controllers\tienda\CheckoutController;
use App\Http\Controllers\tienda\ProfileClientController;

Route::get('home', [HomeController::class, 'home'] )->name('home');
    Route::get('config_all', [HomeController::class, 'config_all'] )->name('config_all');
    Route::post('list_courses', [HomeController::class, 'listCourses'] )->name('listCourses');
    Route::get('course-detail/{slug}', [HomeController::class, 'course_detail'] )->name('course_detail');
    Route::post('list_products', [HomeController::class, 'listProducts'] )->name('listProducts');
    Route::get('product-detail/{slug}', [HomeController::class, 'product_detail'] )->name('product_detail');
    
    
    Route::group([
        'middleware' => 'api',
    ], function ($router) {
        Route::get('/course_lesson/{slug}', [HomeController::class, 'course_lesson'] )->name('course_lesson');
        Route::resource('/cart', CartController::class );
        Route::post('/checkout', [CheckoutController::class, 'store'] )->name('store');
        Route::post('/apply_coupon', [CartController::class, 'apply_coupon'] )->name('apply_coupon');
        Route::post('/profile', [ProfileClientController::class, 'profile'] )->name('profile');
        Route::post('/updateclient', [ProfileClientController::class, 'updateclient'] )->name('updateclient');
        
        Route::resource('/review', ReviewController::class );
        Route::put('/review/{id}', [ReviewController::class, 'update'] )->name('update');
    });