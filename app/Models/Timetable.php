<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Timetable extends Model
{
    
    public function anketa()
    {
        return $this->belongsTo('App\Models\Anketa');
    }

    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

    // public function orders()
    // {
    //     return $this->belongsToMany('App\Models\Order');
    // }

    public function orders()
    {
        return $this->hasMany('App\Models\Order');
    }

    public function schedules()
    {
        return $this->hasMany('App\Models\Shedule');
    }


    public static function all_timeslots($value='')
    { 
        return DB::select("SELECT weekdays.id as weekday_id, timetables.id as timetable_id, name, begin, end 
            FROM weekdays, timetables ORDER BY weekdays.id, timetables.id");
    }



}
