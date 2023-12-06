<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\admin\product\ProductController;
use App\Http\Controllers\admin\Coupon\CouponProductController;
use App\Http\Controllers\admin\product\ClaseProductController;
use App\Http\Controllers\admin\product\SectionProductController;
use App\Http\Controllers\admin\Discount\DiscountProductController;

Route::get('/product/config', [ProductController::class, 'config'] )->name('config');
    Route::resource('/product', ProductController::class );
    Route::post('/product/upload_video/{id}', [ProductController::class, 'upload_video'] )->name('upload_video');
    Route::post('/product/{id}', [ProductController::class, 'update'] )->name('update');
    
    //secciones
    Route::resource('/product-section', SectionProductController::class );
    Route::put('/product-section/{id}', [SectionProductController::class, 'update'] )->name('update');
    
    //clases
    Route::resource('/product-clase', ClaseProductController::class );
    Route::put('/product-clase/{id}', [ClaseProductController::class, 'update'] )->name('update');
    
    //clase files
    Route::post('/product-clase-file', [ClaseProductController::class, 'addFiles'] )->name('addFiles');
    Route::delete('/product-clase-file/{id}', [ClaseProductController::class, 'removeFiles'] )->name('removeFiles');
    Route::post('/product-clase/upload_video/{id}', [ProductController::class, 'upload_video'] )->name('upload_video');
    
    //cupones
    Route::get('/couponproduct/config', [CouponProductController::class, 'config'] )->name('config');
    Route::resource('/couponproduct', CouponProductController::class );
    Route::put('/couponproduct/{id}', [CouponProductController::class, 'update'] )->name('update');
    
    //descuentos
    
    Route::resource('/descuentoproduct', DiscountProductController::class );
    Route::put('/descuentoproduct/{id}', [DiscountProductController::class, 'update'] )->name('update');
    