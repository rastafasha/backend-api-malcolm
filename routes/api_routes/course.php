<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\admin\curso\ClaseController;
use App\Http\Controllers\admin\curso\CursoController;
use App\Http\Controllers\admin\Coupon\CouponController;
use App\Http\Controllers\admin\curso\SectionController;
use App\Http\Controllers\admin\Discount\DiscountController;

Route::get('/course/config', [CursoController::class, 'config'] )->name('config');
    Route::resource('/course', CursoController::class );
    Route::post('/course/upload_video/{id}', [CursoController::class, 'upload_video'] )->name('upload_video');
    Route::post('/course/{id}', [CursoController::class, 'update'] )->name('update');
    
    //secciones
    Route::resource('/course-section', SectionController::class );
    Route::put('/course-section/{id}', [SectionController::class, 'update'] )->name('update');
    
    //clases
    Route::resource('/course-clase', ClaseController::class );
    Route::put('/course-clase/{id}', [ClaseController::class, 'update'] )->name('update');
    
    //clase files
    Route::post('/course-clase-file', [ClaseController::class, 'addFiles'] )->name('addFiles');
    Route::delete('/course-clase-file/{id}', [ClaseController::class, 'removeFiles'] )->name('removeFiles');
    Route::post('/course-clase/upload_video/{id}', [CursoController::class, 'upload_video'] )->name('upload_video');
    
    //cupones
    Route::get('/coupon/config', [CouponController::class, 'config'] )->name('config');
    Route::resource('/coupon', CouponController::class );
    Route::put('/coupon/{id}', [CouponController::class, 'update'] )->name('update');
    
    //descuentos
    
    Route::resource('/descuento', DiscountController::class );
    Route::put('/descuento/{id}', [DiscountController::class, 'update'] )->name('update');