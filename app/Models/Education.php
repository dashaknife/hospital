<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Education extends Model{
    public static function getAll(){
        return  Education::all();

    }

    public function anketas(){
        return $this->hasMany('App\Models\Anketa');
    }
}
