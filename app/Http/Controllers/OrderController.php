<?php
namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;

use App\Models\Anketa;
use App\Models\Education;
use App\Models\Experience;
use App\Models\Metro;
use App\Models\Photo;
use App\Models\Type;
use App\Models\City;
use App\Models\Order;
use App\Models\Timetable;
use App\Models\Calendar;
use App\Models\Schedule;
use App\Models\Role;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;



use Illuminate\Database\QueryException;

class OrderController extends Controller{

    // check $calendar->orders   column date change to calendar_dt
    public function index(Request $request) {
        // $deleted_orders = Order::withTrashed()->where('user_id', Auth::id())->get();
        return view('orders_index', [
            'orders' => Auth::user()->orders,
            'deleted_orders' => Order::onlyTrashed()->where('user_id', Auth::id())->get()
        ]);
    }

    public function show($id){
        // $order->withTrashed()->first()->anketa->city->name
        $order = Order::withTrashed()->find($id);
        if ($order->trashed()) {
            $order = $order->withTrashed()->first();
            $is_trashed = true;
        }else{
            $is_trashed = false;
        }

        return view('order', [
            'order' => $order,
            'is_trashed' => $is_trashed
        ]);
    }

   	public function create($anketa_id, Request $request){
        $anketa = Anketa::find($anketa_id);
        $result = DB::select("SELECT dt, schedules_calendar.timetable_id, begin, end
            FROM (
                SELECT dt, id, anketa_id, schedules.weekday_id as schedule_weekday_id, timetable_id
                FROM schedules, calendars
                WHERE schedules.weekday_id = calendars.weekday_id AND
                anketa_id = $anketa_id AND
                dt BETWEEN '" . $request->start_date . "' AND '" . $request->end_date . "'
            ) schedules_calendar
            LEFT JOIN (
                SELECT anketa_id, date, timetable_id,
                calendars.weekday_id as orders_weekday_id
                FROM orders, calendars
                WHERE orders.date = calendars.dt) orders_calendar
                ON
                schedules_calendar.anketa_id = orders_calendar.anketa_id AND
                schedules_calendar.schedule_weekday_id = orders_calendar.orders_weekday_id AND
                schedules_calendar.timetable_id = orders_calendar.timetable_id
            LEFT JOIN timetables ON timetables.id = schedules_calendar.timetable_id
            where orders_calendar.date IS NULL");
        // print_r($result);

        return view('orders_create', [
        	'anketa' => $anketa,
            'result' => $result
        ]);
    }

    public function store(Request $request){

        // $validator = $request->validate([
        //     'from_currency_id' => ['required', 'exists:currencies,id'],
        // ]);

        // try {
            $order_data = json_decode($request->order);
            $order = new Order();
            $order->date = $order_data->date;
            $anketa = Anketa::find($request->anketa_id);
            $order->anketa()->associate($anketa);
            $user=Auth::user();
            $order->user()->associate($user);
            $timetable = Timetable::find($order_data->timetable_id);
            $order->timetable()->associate($timetable);
            $order->save();
            return redirect()->route('home');
        // } catch (QueryException $e) {
        //     return redirect()->route('orders.create', $request->anketa_id);
        // }
    }

    public function destroy(Request $request) { // forceDelete

        $order = Order::withTrashed()->find($request->order_id);
        $user = $order->user;

        var_dump(Auth::id());
        var_dump($order->user->id);

        if($order->user->id == Auth::id()){
            $user->cancels += 5;    // client
        }else{
            if(!empty($request->client_come)){
                $user->cancels += 10;
            }
        }
        $user->save();

        if($user->cancels >= 30){
            $role_blocked = Role::find(1);
            $user->role()->associate($role_blocked);
            foreach ($user->orders as $order) {
                $order->forceDelete();
            }
            $user->save();
        }else{
             $order->forceDelete();
        }

        if(Auth::user()->role->name == 'owner'){
            return redirect()->route('my_account');
        }
        if(Auth::user()->role->name == 'user'){
            return redirect()->route('orders.index');
        }


    }


}

























        // $free = null;
        // $busy = null;
        // if(!empty($request->date)){
        //     $free = Schedule::select('timetable_id')->where([
        //         ['weekday_id', '=', $date->weekday->id],
        //         ['anketa_id', '=', $anketa_id]
        //     ])->get();

        //     $busy = Order::select('timetable_id')->where([
        //         ['date', '=', $request->date],
        //         ['anketa_id', '=', $anketa_id]
        //     ])->get();
        // }
        // $result = $busy->diff($free);
        // // var_dump($busy);




 //$date = Calendar::where('dt', $request->date)->first();
// $all = $anketa->schedules->where('weekday_id', $date->weekday->id);
        // $busy = $anketa->orders->where('date', $request->date);
        // var_dump($busy);


        // $f = $anketa->schedules;



// SELECT * FROM calendars
// LEFT JOIN schedules ON schedules.weekday_id = calendars.weekday_id
// WHERE dt BETWEEN '2020-12-28' AND '2020-12-30'


        // $schedules_calendar = DB:table('schedules')
        // ->select('anketa_id', 'dt', 'timetable_id')
        // ->where()


        // $orders_calendar = DB::table('orders')
        //            ->select('anketa_id', 'date', 'timetable_id',
        //             DB::raw('weekday_id as orders_weekday_id'))
        //            ->where('date', DB::raw($request->date));


        // $result = DB::table('schedules')
        // ->leftjoinSub($orders_calendar, 'orders_calendar', function ($join) {
        //     $join->on('schedules.anketa_id', '=', 'orders_calendar.anketa_id')->
        //     orOn('schedules.weekday_id', '=', 'orders_calendar.orders_weekday_id')->
        //     orOn('schedules.timetable_id', '=', 'orders_calendar.timetable_id');
        // })->get();




        // <div class="field">
        //     <h3>Години прийому: </h3>
        //     <select  id="timetable" class="ui input" name="timetable">
        //         @foreach($timetables as $timetable )
        //             <option value="{{$timetable->id}}">{{$timetable->begin}} - {{$timetable->end}}</option>
        //         @endforeach
        //     </select>
        // </div>




 // @if(!empty($free))

            // <br>  <br>  <br>
            // <p> free </p>
            // @foreach($free as $timetable )
            //      {{$timetable}}  <br>
            // @endforeach

 //            <br>  <br>  <br>
 //            <p> busy </p>
 //            @foreach($busy as $timetable )
 //               {{$timetable}}  <br>
 //            @endforeach

 //             <br>  <br>  <br>
 //                <p> result </p>
 //            @foreach($result as $timetable )
 //               {{$timetable}}  <br>
 //            @endforeach


 //        @endif
