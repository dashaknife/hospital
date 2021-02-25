<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


class Diplom extends Model
{ 
    protected $primaryKey = 'code';
   
    public function anketa()
    {
        return $this->hasOne('App\Models\Anketa');
    }

}
