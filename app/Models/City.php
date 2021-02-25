<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class City extends Model {
    public static function getAllCities(){
        $cities = City::all();
        return $cities;
    }

    public static function getCityById($id){
        $city = City::find($id);
        return $city;
    }


    public function metros(){
        return $this->belongsToMany('App\Models\Metro');
    }

    public function anketas(){
        return $this->belongsToMany('App\Models\Anketa');
    }

}
