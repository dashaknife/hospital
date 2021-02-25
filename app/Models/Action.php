<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Action extends Model{
    public static function getAll(){
        return  Action::all();

    }

    public function roles() {
        return $this->belongsToMany('App\Models\Role');
    }
}
