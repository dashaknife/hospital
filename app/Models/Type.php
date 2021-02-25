<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Type extends Model
{

    public static function getAll(){
        return  Type::all();

    }

    public function anketas()
    {
        return $this->hasMany('App\Models\Anketa');
    }
}