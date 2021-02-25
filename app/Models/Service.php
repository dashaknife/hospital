<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Service extends Model
{

    public static function getAll(){
        return  Service::all();

    }
    public function anketas()
    {
        return $this->belongsToMany('App\Models\Anketa');
    }

}