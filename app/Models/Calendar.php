<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Calendar extends Model {
   
    public function weekday(){
        return $this->belongsTo('App\Models\Weekday');
    }

}
