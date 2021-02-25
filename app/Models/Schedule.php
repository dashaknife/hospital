<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Schedule extends Model {
   
    public function anketa(){
        return $this->belongsTo('App\Models\Anketa');
    }

    public function weekday(){
        return $this->belongsTo('App\Models\Weekday');
    }

    public function timetable(){
        return $this->belongsTo('App\Models\Timetable');
    }

}
