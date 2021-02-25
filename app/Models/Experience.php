<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Experience extends Model{

    public static function getAll(){
        return  Experience::all();

    }

    public function anketas(){
        return $this->hasMany('App\Models\Anketa');
    }



}