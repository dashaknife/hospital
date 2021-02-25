@extends('layouts.app')

{{--@section('title-block','')--}}

@section('title-block')
Редагування анкети
@endsection

@section('content')

<div id="container__add-anket">
    <h1 id="header__h1" class="container__entry-header">Редагування анкети</h1>

    <form enctype="multipart/form-data" action="{{route('updateAnketa',$anketa->id)}}" method="post" class="ui form">
        @csrf

        <div class="two fields">
            <div class="field">
                <label id="add__anket-label" for="type">ПІБ</label>
                <input id="profil_name" name="profil_name" class="ui input" maxlength="50" value="{{$anketa->name}}">
            </div>

            <div class="field">
                <label id="add__anket-label" for="type">Вік</label>
                <input id="profil_age" name="age" class="ui input" value="{{$anketa->age}}">
            </div>
        </div>

        <div class="two fields">
            <div class="field">
                <label id="add__anket-label" for="type">Телефон</label>
                <input id="profil_tel" name="tel" class="ui input" placeholder="30508887766" value="{{$anketa->tel}}">
            </div>
            <div class="field">
                <label id="add__anket-label" for="type">Спеціальність</label>
                <select id="type" class="ui fluid dropdown" name="type">
                    @foreach(App\Models\Type::getAll() as $type )
                    @if($type->id==$anketa->type->id)
                    <option selected value="{{$type->id}}">{{$type->name}}</option>
                    @else
                    <option value="{{$type->id}}">{{$type->name}}</option>
                    @endif
                    @endforeach
                </select>
            </div>

        </div>





        <div class="field">
            <label id="add__anket-label" for="сity">Місто</label>
            <select id="сity" class="ui input" name="id_city">
                @foreach(App\Models\City::getAllCities() as $city )
                @if($city->id==$anketa->city->id)
                <option selected value="{{$city->id}}">{{$city->name}}</option>
                @else
                <option value="{{$city->id}}">{{$city->name}}</option>
                @endif
                @endforeach
            </select>
        </div>


        <div class="field">
                <label id="add__anket-label" for="type">Адреса: </label>
                <input id="address" name="address" class="ui input"
                maxlength="50" value="{{$anketa->address}}">
            </div>


        <div class="two fields">
            @for($i=0;$i<3;$i++) <div class="field">
                <label id="add__anket-label" for="metro{{$i}}">Метро</label>
                <select id="metro{{$i}}" class="form-control" name="id_metros[]">
                    <option value="0">Оберіть</option>
                    @foreach(App\Models\Metro::All() as $metro )
                    @if(!empty($anketa->metros[$i]) && $metro->id==$anketa->metros[$i]->id)
                    <option selected value="{{$metro->id}}">{{$metro->name}}</option>
                    @else
                    <option value="{{$metro->id}}">{{$metro->name}}</option>
                    @endif
                    @endforeach
                </select>
        </div>
        @endfor
</div>

<div class="field">
    <label id="add__anket-label">Про мене</label>
    <textarea name="about_me">{{$anketa->about_me}} </textarea>
</div>

<div class="two fileds">
    <div class="field">
        <label id="add__anket-label" for="education">Освіта</label>
        <select id="education" class="ui input" name="id_education">
            @foreach(App\Models\Education::getAll() as $education )
            @if($education->id==$anketa->education->id)
            <option selected value="{{$education->id}}">{{$education->name}}</option>
            @else
            <option value="{{$education->id}}">{{$education->name}}</option>
            @endif
            @endforeach
        </select>
    </div>

    <div class="field">
        <label id="add__anket-label" for="experience">Досвід</label>
        <select id="experience" class="ui input" name="id_experience">
            @foreach(App\Models\Experience::getAll() as $experience )
            @if($experience->id==$anketa->experience->id)
            <option selected value="{{$experience->id}}">{{$experience->name}}</option>
            @else
            <option value="{{$experience->id}}">{{$experience->name}}</option>
            @endif
            @endforeach
        </select>
    </div>
</div>

<div>
    <label id="add__anket-label" for="pris">Ціна за прийом</label>
</div>

<div class="two fields">
    <div class="field">
        <label for="pris">в лікарні</label>
        <input id="pris" class="ui input" name="price_1h_office" maxlength="50" value="{{$anketa->price_1h_office}}">
    </div>
    <div class="field">
        <label for="pris3">з виїздом до клієнта</label>
        <input id="pris3" name="price_1h_challenge" class="ui input" maxlength="50" value="{{$anketa->price_1h_challenge}}">
    </div>
</div>



{{-- <div class="field">
    <label id="add__anket-label">
        Виберіть Ваші послуги
    </label>
    @foreach($services->chunk(15) as $part_services)
    <div class="field">
        @foreach($part_services as $service)
        <div class="ui toggle checkbox">
            <div class="field">
                @if($anketa->services->contains($service))
                    <input type="checkbox" checked name="services[]" value="{{$service->id}}">
<label for="pris">{{$service->name}}</label>
@else
<input type="checkbox" name="services[]" value="{{$service->id}}">
<label for="pris">{{$service->name}}</label>
@endif
</div>
</div>
@endforeach
</div>
@endforeach
</div> --}}



<div id="container__entry-button" class="field">
    <button class="ui secondary basic button" type="submit">Оновити</button>
</div>

</form>

</div>


@endsection
