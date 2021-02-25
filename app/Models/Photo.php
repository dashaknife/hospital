<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Photo extends Model
{

    public static function getAll(){
        return  Photo::all();

    }

//    public function anketa()
//    {
//        return $this->hasOne('App\Models\Anketa');
//    }

    public function anketa()
    {
        return $this->belongsTo('App\Models\Anketa');
    }
}