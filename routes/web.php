<?php

use Illuminate\Support\Facades\Route;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/','AnketaController@allData')->name('home');
Route::post('/registration', 'RegistrationController@register');
Route::get('/registration','RegistrationController@show')->name('registration');
Route::post('/login', 'LoginController@authenticate')->name('post_login');
Route::get('/login','LoginController@show')->name('login');
Route::get('/logout','LoginController@logout')->name('logout');

Route::get('/forget', 'RegistrationController@forget')->name('forget');
Route::post('/', 'AnketaController@allData')->name('home');

Route::post('/anketa_create', 'AnketaController@storeAnketa')->name('store')->middleware('auth');
Route::get('/anketa_create','AnketaController@createAnketa')->name('create')->middleware('auth');
Route::get('/anketa/{id}','AnketaController@showAnketa')->name('anketa');
Route::get('/my_account','UserController@my_account')->name('my_account')->middleware('auth');
Route::get('/anketa_edit/{id}','AnketaController@editAnketa')->name('editAnketa')->middleware('auth');
Route::post('/anketa_update/{id}', 'AnketaController@updateAnketa')->name('updateAnketa')->middleware('auth');
Route::post('/anketas/destroy', 'AnketaController@destroy')->name('anketas.destroy')->middleware('auth');

Route::get('/orders','OrderController@index')->name('orders.index')->middleware('auth');
Route::get('/orders/{order}','OrderController@show')->name('orders.show')->middleware('auth');
Route::get('/orders/create/{anketa_id}','OrderController@create')->name('orders.create')->middleware('auth');
Route::post('/orders', 'OrderController@store')->name('orders.store')->middleware('auth');
Route::post('/orders/destroy', 'OrderController@destroy')->name('orders.destroy')->middleware('auth');










