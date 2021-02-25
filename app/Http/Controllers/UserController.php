<?php

namespace App\Http\Controllers;

use App;
use App\Models\Anketa;
use App\Models\User;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;

class UserController extends Controller
{
    public function my_account(){

//        return view('my_account', ['anketas' => Anketa:: where('user_id',Auth::id())]);
        return view('my_account', [
        	'anketas' => Auth::user()->anketas,
        	'user'=> Auth::user(),
        	'deleted_anketas' => Anketa::onlyTrashed()->where('user_id', Auth::id())->get()
        ]);

    }

}