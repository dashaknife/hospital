<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{

    public static function getAll(){
        return  Role::all();

    }

    public function actions()
    {
        return $this->belongsToMany('App\Models\Action');
    }

    public function users()
    {
        return $this->hasMany('App\User');
    }

}


