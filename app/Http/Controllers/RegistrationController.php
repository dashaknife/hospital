<?php

namespace App\Http\Controllers;

use App;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;

use App\Models\Role;

class RegistrationController extends Controller
{

    public function show(){

        return view('registration');
    }

    public function forget(){

        return view('forget');
    }

    public function register(Request $request){


        $validator = $request->validate([
            'name' => 'required|unique:users,name',
            'email' => 'required|unique:users,email',
            'password' => 'required|min:5'
            ]);


        $user = new App\User;
        $data = [
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ];
        $user = $user->create($data);
        $role = Role::find($request->role);
        $user->role()->associate($role);
        $user->save();
        return redirect()->route('login');
    }



}
