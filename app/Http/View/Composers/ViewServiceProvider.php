<?php

//namespace App\Providers;
namespace App\Http\View\Composers;

use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;
use App\Models\Anketa;
class ViewServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {

        // Using Closure based composers...
        View::composer('inc.footer', function ($view) {
            $view->with('new_anketas',Anketa::getNew(6));

        });
    }
}

