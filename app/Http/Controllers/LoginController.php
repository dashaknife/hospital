<?php

namespace App\Http\Controllers;

use App;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\MessageBag;

class LoginController extends Controller
{

    public function show(){

        return view('login');
    }

    public function authenticate(Request $request){
       $validator = $request->validate([
           'email' => 'required|exists:users,email',
           'password' => 'required|min:5'
       ]); // check if the data is valid, else return to the sign page with MessageBag

        $credentials = $request->only('email', 'password'); // extract data to check it
        if (Auth::attempt($credentials)) { // check in the DB
            return redirect()->intended(); // back to screen user tried to visit or home
        }
        return redirect()->back();//->withErrors(new MessageBag(['password' => 'Wrong password.'])); 
    }

    public function logout(){
        Auth::logout();
        return redirect()->route('home');
    }

  



}
