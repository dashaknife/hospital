<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Anketa extends Model
{

    use SoftDeletes;

    public static function getAll(){
        return  Anketa::all();
    }



//SELECT * FROM `anketas` WHERE `photo_id`IS NOT NULL ORDER BY `created_at` DESC LIMIT 2
    public static function getNew($n){
        return  Anketa::whereNotNull('photo_id')
            ->orderBy('created_at', 'desc')
            ->take($n)
            ->get();
    }

    public static function getAnketaById($id){

        return Anketa::find($id);
    }

    public function user()
    {
        return $this->belongsTo('App\User');
    }

    public function type()
    {
        return $this->belongsTo('App\Models\Type');
    }

    
    public function photo()
    {
        return $this->belongsTo('App\Models\Photo');
    }

    public function photos()
    {
        return $this->hasMany('App\Models\Photo');
    }

    public function metros()
    {
        return $this->belongsToMany('App\Models\Metro');
    }

    public function experience()
    {
        return $this->belongsTo('App\Models\Experience');
    }

   

    public function education()
    {
        return $this->belongsTo('App\Models\Education');
    }

    public function city()
    {
        return $this->belongsTo('App\Models\City');
    }

     public function orders()
    {
        return $this->hasMany('App\Models\Order')->withTrashed();
    }

    public function schedules()
    {
        return $this->hasMany('App\Models\Schedule');
    }

    public function diplom()
    {
        return $this->hasOne('App\Models\Diplom');
    }


}
