<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Metro extends Model
{
//    public static function getMetroById($id){
//        $metro = Metro::find($id);
//        return $metro;
//    }

    public function city()
    {
        return $this->belongsTo('App\Models\City');
    }

    public function anketas()
    {
        return $this->belongsToMany('App\Models\Anketa');
    }

}
