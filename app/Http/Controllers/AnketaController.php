<?php
namespace App\Http\Controllers;


use App\Models\Anketa;
use App\Models\Education;
use App\Models\Experience;
use App\Models\Metro;
use App\Models\Photo;
use App\Models\Type;
use App\Models\City;
use App\Models\Timetable;
use App\Models\Schedule;
use App\Models\Weekday;
use App\Models\Diplom;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AnketaController extends Controller{

    public function allData(Request $request) { // $direction = null means asc
        $sort_params = ['price_1h_office' => 'За ціною', 'city_id' => 'За містом'];
        $direction_params = ['asc' => 'За зростанням ', 'desc' => 'За спаданням'];

        $params = [];
        $conditions = [];
        $param_list = ['city_id', 'type_id', 'experience_id', 'education_id'];

        foreach ($param_list as $param) {
           if ($request->input($param)) {
                $params[$param] = $request->input($param);
                array_push($conditions,  [$param, '=', $request->input($param)]);
            }
        }

        if ($request->input('min_price')) {
            $params['min_price'] = $request->input('min_price');
            array_push($conditions,  ['price_1h_office', '>=', $request->input('min_price')]);
        }

         if ($request->input('max_price')) {
            $params['max_price'] = $request->input('max_price');
            array_push($conditions,  ['price_1h_office', '<=', $request->input('max_price')]);
        }

        // sort result
        $order = $request->input('order');
        $direction = $request->input('direction');
        if ($order) {
            $params['order'] = $order;
        }
        if ($direction) {
            $params['direction'] = $direction;
        }


        if(empty($direction)){
            $direction = 'asc'; // default direction
        }
        if(!empty($order)){
            $result_anketas = Anketa::where($conditions)->orderBy($order, $direction)->get();
        }else{
            $result_anketas = Anketa::where($conditions)->get();
        }

        return view('index', [
            'anketas' => $result_anketas,
            'cities' => City::all(),
            'types' => Type::all(),
            'list_experience' => Experience::all(),
            'educations' => Education::all(),
            'params' => $params,
            'sort_params' => $sort_params,
            'direction_params' => $direction_params,
        ]);
    }

    public function showAnketa($id){
        $anketa = Anketa::withTrashed()->find($id);
        if ($anketa->trashed()) {
           //  $anketa = $anketa->withTrashed()->first(); // is needed?
            $is_trashed = true;
        }else{
            $is_trashed = false;
        }
        return view('anketa', [
            'anketa' => $anketa,
            'is_trashed' => $is_trashed
        ]);
    }

    public function createAnketa(){
        return view('anketa_create', [
            'cities' => City::all(),
            'types' => Type::all(),
            'experiences' => Experience::all(),
            'educations' => Education::all(),
            'metros' => Metro::all(),
            'all_timeslots'  => Timetable::all_timeslots()
        ]);
    }

    public function updateAnketa(Request $request,$id){

        $anketa= Anketa::find($id);

        $anketa->name=$request->input('profil_name');

        $anketa->age=$request->input('age');

        $anketa->about_me=$request->input('about_me');

        $anketa->price_1h_office=$request->input('price_1h_office');

        $anketa->price_1h_challenge=$request->input('price_1h_challenge');


        $anketa->address=$request->input('address');



        $type = Type::find($request->input('type'));
        $anketa->type()->associate($type);


        $anketa->tel=$request->input('tel');
        $city = City::find($request->input('id_city'));
        $anketa->city()->associate($city);
        $education = Education::find($request->input('id_education'));
        $anketa->education()->associate($education);
        $experience = Experience::find($request->input('id_experience'));
        $anketa->experience()->associate($experience);
        $anketa->metros()->detach();


        $anketa->save();
        foreach ($request->id_metros as $id_metro){
            if($id_metro!=0){
                $anketa->metros()->attach($id_metro);
            }
        }


//        if(!empty($request->photos)){
//            $i=1;
//            foreach ($request->photos as $photo) {
//                $extensionContent = $photo->getClientOriginalExtension();
//                $photo_db=new Photo();
//                $photo_db->path=$anketa->id .'_' . $i . '.' . $extensionContent;
//                $anketa->photos()->save($photo_db);
//                $photo_db->save();
//                if($i==1){
//                    $id_main_photo=$photo_db->id;
//                }
//                $path = $photo->storeAs('images', $photo_db->path , 'public');
//                $i++;
//            }
//            $anketa->photo_id=$id_main_photo;
//        }

        $anketa->save();
        return redirect()->route('home');
    }

    public function storeAnketa(Request $request){

        $validator = $request->validate([
            'diplom_code' => ['required','unique:anketas,diplom_code', 'exists:diploms,code'],
        ]);

        $anketa = new Anketa();
        $anketa->name=$request->input('profil_name');
        $anketa->age=$request->input('age');
        $anketa->about_me=$request->input('about_me');
        $anketa->price_1h_office=$request->input('price_1h_office');
        $anketa->price_1h_challenge=$request->input('price_1h_challenge');
        $anketa->address=$request->input('address');
        $type = Type::find($request->input('type'));
        $anketa->type()->associate($type);
        $anketa->tel=$request->input('tel');
        $city = City::find($request->input('id_city'));
        $anketa->city()->associate($city);
        $education = Education::find($request->input('id_education'));
        $anketa->education()->associate($education);
        $experience = Experience::find($request->input('id_experience'));
        $anketa->experience()->associate($experience);

        $user=Auth::user();
        $anketa->user()->associate($user);


        $diplom = Diplom::find($request->diplom_code);
        $diplom->anketa()->save($anketa);

        $anketa->save();





        $anketa->metros()->detach();
        $j=0;
        $arr = array();
        foreach ($request->id_metros as $id_metro){
            array_push($arr, $id_metro);
            if($id_metro!=0)
            {
                if ($j==0 || ($j==1 && $id_metro!= $arr[0]) ||
                 ($j==2 && $id_metro!= $arr[0] && $id_metro!= $arr[1]))
                {
                    $metro = Metro::find($id_metro);
                    $metro->anketas()->attach($anketa->id);
                }
            }
            $j++;
        }


        foreach ($request->weekday_times as $weekday_time_json) {
            $weekday_time = json_decode($weekday_time_json);
            //var_dump($request->weekday_times);
            $schedule = new Schedule();
            $timetable = Timetable::find($weekday_time->timetable_id);
            $weekday = Weekday::find($weekday_time->weekday_id);
            $schedule->weekday()->associate($weekday);
            $schedule->timetable()->associate($timetable);
            $schedule->anketa()->associate($anketa);
            $schedule->save();
        }



        if(!empty($request->photos)){
            $i=1;
            foreach ($request->photos as $photo) {
                $extensionContent = $photo->getClientOriginalExtension();
                $photo_db=new Photo();
                $photo_db->path=$anketa->id .'_' . $i . '.' . $extensionContent;
                $anketa->photos()->save($photo_db);
                $photo_db->save();
                if($i==1){
                    $id_main_photo=$photo_db->id;
                }
                $path = $photo->storeAs('images', $photo_db->path , 'public');
                $i++;
            }
            $anketa->photo_id=$id_main_photo;
        }



        $anketa->save();
        return redirect()->route('home');
    }

    public function editAnketa($id){
        return view('anketa_edit', [
            'anketa' => Anketa::getAnketaById($id)
        ]);
    }

    public function destroy(Request $request) {
        $anketa = Anketa::find($request->anketa_id);
        foreach ($anketa->orders as $order) {
            $order->delete();
        }
        $anketa->delete();
        return redirect()->route('home');
    }


}
