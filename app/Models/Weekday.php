<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Weekday extends Model {
   
    public function schedules()
    {
        return $this->hasMany('App\Models\Shedule');
    }

    public function calendars()
    {
        return $this->hasMany('App\Models\Calendars');
    }

  	

}
