<?php

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Artisan;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\blog\blogController;
use App\Http\Controllers\admin\todoController;
use App\Http\Controllers\admin\UserController;
use App\Http\Controllers\ContactFormController;
use App\Http\Controllers\SubcripcionController;
use App\Http\Controllers\tienda\CartController;
use App\Http\Controllers\tienda\HomeController;
use App\Http\Controllers\tienda\ReviewController;
use App\Http\Controllers\tienda\CheckoutController;
use App\Http\Controllers\admin\curso\ClaseController;
use App\Http\Controllers\admin\sales\salesController;
use App\Http\Controllers\Auth\PasswordResetController;
use App\Http\Controllers\admin\Coupon\CouponController;
use App\Http\Controllers\admin\curso\SectionController;
use App\Http\Controllers\Auth\ChangePasswordController;
use App\Http\Controllers\Auth\ForgotPasswordController;
use App\Http\Controllers\admin\curso\CategoryController;
use App\Http\Controllers\portafolio\categoriaController;
use App\Http\Controllers\tienda\ProfileClientController;
use App\Http\Controllers\admin\product\ProductController;
use App\Http\Controllers\portafolio\portafolioController;
use App\Http\Controllers\admin\Discount\DiscountController;
use App\Http\Controllers\portafolio\enDesarrolloController;
use App\Http\Controllers\admin\product\CategoryProductController;
use App\Http\Controllers\Auth\ChangeForgotPasswordControllerController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::group([
 
    'middleware' => 'api',
    'prefix' => 'auth'
 
], function ($router) {
    Route::post('/register', [AuthController::class, 'register'])->name('register');
    Route::post('/login', [AuthController::class, 'login'])->name('login');
    Route::post('/login_tienda', [AuthController::class, 'login_tienda'])->name('login_tienda');
    Route::post('/logout', [AuthController::class, 'logout'])->name('logout');
    Route::post('/refresh', [AuthController::class, 'refresh'])->name('refresh');
    Route::post('/me', [AuthController::class, 'me'])->name('me');
});



Route::group([
 
    'middleware' => 'api',
 
], function ($router) {
    Route::resource('/user', UserController::class );
    Route::post('/user/{id}', [UserController::class, 'update'] )->name('update');
    Route::post('/user/{user}', [UserController::class, 'show'] )->name('show');
    Route::get('/users', [UserController::class, 'clientes'] )->name('clientes');
    Route::get('/users/recientes', [UserController::class, 'recientes'] )->name('recientes');
    Route::get('/users/showuser/{id}', [UserController::class, 'showuser'] )->name('showuser');
});


Route::group([
 
    'middleware' => 'api',
 
], function ($router) {
    Route::resource('/category', CategoryController::class );
    Route::post('/category/{id}', [CategoryController::class, 'update'] )->name('update');
    Route::resource('/category-product', CategoryProductController::class );
    Route::post('/category-product/{id}', [CategoryProductController::class, 'update'] )->name('update');
});


Route::group([ 'prefix' => 'ecommerce',], function ($router) {
    
// Contacts
require __DIR__ . '/api_routes/ecommerce.php';

});


Route::group(['middleware' => 'api'], function ($router) {

   
    // Contacts
    require __DIR__ . '/api_routes/course.php';

    // Category
    require __DIR__ . '/api_routes/categoria.php';

    // Portafolio
    require __DIR__ . '/api_routes/portafolio.php';
    
    // endesarollo
    require __DIR__ . '/api_routes/endesarollo.php';

    // blog
    require __DIR__ . '/api_routes/blog.php';

    // product
    require __DIR__ . '/api_routes/product.php';

    // // subcripcion
    require __DIR__ . '/api_routes/subcripcion.php';
    
    // // contact
    require __DIR__ . '/api_routes/contact.php';

    // sale
    require __DIR__ . '/api_routes/sale.php';

    // direccion
    require __DIR__ . '/api_routes/direccion.php';

    // delivery
    require __DIR__ . '/api_routes/delivery.php';

    // pickup
    require __DIR__ . '/api_routes/pickup.php';
    
    // todo
    require __DIR__ . '/api_routes/todo.php';



 Route::post('/forgot-password', [ForgotPasswordController::class, 'forgotPassword'])
        ->name('forgot.password');

    Route::post('/change-forgot-password', [ChangeForgotPasswordControllerController::class, 'changeForgotPassword'])
        ->name('change.forgot.password');


    Route::post('/reset-password', [PasswordResetController::class, 'resetPassword'])
        ->name('reset.password');

    Route::post('/change-password', [ChangePasswordController::class, 'changePassword'])
        ->name('change.password');

    Route::post('/contact/form', [ContactFormController::class, 'contactStore'])
        ->name('contact.store');

    Route::post('/subcripcion/store', [SubcripcionController::class, 'store'])
        ->name('subcripcion.store');

    //comandos desde la url del backend

    Route::get('/cache', function () {
        Artisan::call('cache:clear');
        return "Cache";
    });

    Route::get('/optimize', function () {
        Artisan::call('optimize:clear');
        return "Optimización de Laravel";
    });

    Route::get('/storage-link', function () {
        Artisan::call('storage:link');
        return "Storage Link";
    });


    Route::get('/migrate-seed', function () {
        Artisan::call('migrate:refresh --seed');
        return "Migrate seed";
    });


    //rutas libres
    Route::get('/product', [ProductController::class, 'index'])
    ->name('product.index');

    Route::get('/categorias', [categoriaController::class, 'index'])
        ->name('categorias.index');

});
