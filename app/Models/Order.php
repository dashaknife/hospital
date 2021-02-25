<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Order extends Model
{ 
    use SoftDeletes;

    public function anketa()
    {
        return $this->belongsTo('App\Models\Anketa')->withTrashed();
    }

    public function user()
    {
        return $this->belongsTo('App\User');
    }

    // public function timetables()
    // {
    //     return $this->belongsToMany('App\Models\Timetable');
    // }

     public function timetable()
    {
        return $this->belongsTo('App\Models\Timetable');
    }

}
