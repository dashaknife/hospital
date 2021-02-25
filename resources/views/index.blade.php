@extends('layouts.app')

@section('title-block')
Запис до лікарні
@endsection

@section('content')



    @if(Auth::user())
    <div id="container">
        <h1 id="header__h1" class="container__entry-header">Доброго дня, {{Auth::user()->name}}</h1>

    <div id="search">
        <h1 class="container__entry-header">Пошук</h1>


        <form name="search" action="" method="get" class="ui form segment">

        <div class="two fields">
        <div class="field">
                    <label for="type_id">Спеціальність</label>
                    <select id="type_id" class="ui dropdown" name="type_id">
                        @if(empty($params['type_id']))
                            <option value="" selected>Не вибрано</option>
                        @else
                            <option value="">Не вибрано</option>
                        @endif
                        @foreach($types as $type)
                            @if(!empty($params['type_id']) &&
                                $params['type_id'] == $type->id)
                                <option value="{{$type->id}}" selected>{{$type->name}}</option>;
                            @else
                                <option value="{{$type->id}}">{{$type->name}}</option>
                            @endif
                        @endforeach
                    </select>
                </div>
                <div class="field">
                    <label for="сity">Місто</label>
                    <select id="сity" class="ui fluid search dropdown" name="city_id">
                        @if(empty($params['city_id']))
                        <option value="" selected>Не вибрано</option>
                        @else
                        <option value="">Не вибрано</option>
                        @endif
                        @foreach($cities as $city)
                        @if(!empty($params['city_id']) && $params['city_id']==$city->id)
                        <option value="{{$city->id}}" selected>{{$city->name}}</option>
                        @else
                        <option value="{{$city->id}}">{{$city->name}}</option>
                        @endif
                        @endforeach
                    </select>
                </div>
            </div>




                <div class="two fields">
                    <div class="field">
                        <label for="сity">Параметр сортування: </label>
                        <select id="direction" class="ui fluid search dropdown" name="order">
                        @if(empty($params['order']))
                            <option value="" selected>Не вибрано</option>
                        @else
                            <option value="">Не вибрано</option>
                        @endif
                        @foreach($sort_params as $key => $value)
                            @if(!empty($params['order']) && $params['order']==$key)
                                <option value="{{$key}}" selected>{{$value}}</option>
                            @else
                                <option value="{{$key}}">{{$value}}</option>
                            @endif
                        @endforeach
                        </select>
                    </div>

                    <div class="field">
                        <label for="сity">Напрямок: </label>
                        <select id="direction" class="ui fluid search dropdown" name="direction">
                            @if(empty($params['direction']))
                                <option value="" selected>Не вибрано</option>
                            @else
                                <option value="">Не вибрано</option>
                            @endif
                            @foreach($direction_params as $key => $value)
                            @if(!empty($params['direction']) && $params['direction']==$key)
                                <option value="{{$key}}" selected>{{$value}}</option>
                            @else
                                <option value="{{$key}}">{{$value}}</option>
                            @endif
                        @endforeach
                        </select>
                    </div>
                </div>







             <div class="two fields">
                <div class="field">
                    <label for="сity">Мінімальна ціна: </label>
                        @if(empty($params['min_price']))
                             <input type="text" name="min_price" value="">
                        @else
                             <input type="text" name="min_price" value="{{$params['min_price']}}">
                        @endif
                </div>
               <div class="field">
                    <label for="сity">Максимальна ціна: </label>
                        @if(empty($params['max_price']))
                             <input type="text" name="max_price" value="">
                        @else
                             <input type="text" name="max_price" value="{{$params['max_price']}}">
                        @endif
                </div>
            </div>











            <div class="two fields">
                <div class="field">
                    <label for="experience">Досвід</label>
                    <select id="experience" class="ui dropdown" name="experience_id">
                        @if(empty($params['experience_id']))
                        <option value="" selected>Не вибрано</option>
                        @else
                        <option value="">Не вибрано</option>
                        @endif
                        @foreach($list_experience as $experience)
                        @if(!empty($params['experience_id']) &&
                        $params['experience_id']==$experience->id)
                        <option value="{{$experience->id}}" selected>{{$experience->name}}</option>;
                        @else
                        <option value="{{$experience->id}}">{{$experience->name}}</option>
                        @endif
                        @endforeach
                    </select>
                </div>

                <div class="field">
                    <label for="education_id">Освіта</label>
                    <select id="education_id" class="ui dropdown" name="education_id">
                        @if(empty($params['education_id']))
                        <option value="" selected>Не вибрано</option>
                        @else
                        <option value="">Не вибрано</option>
                        @endif
                        @foreach($educations as $education)
                        @if(!empty($params['education_id']) &&
                        $params['education_id']==$education->id)
                        <option value="{{$education->id}}" selected>{{$education->name}}</option>;
                        @else
                        <option value="{{$education->id}}">{{$education->name}}</option>
                        @endif
                        @endforeach
                    </select>
                </div>
            </div>




                <!-- <div class="field">
                    <label for="type_id">Спеціальність</label>
                    <select id="type_id" class="ui dropdown" name="type_id">
                        @if(empty($params['type_id']))
                            <option value="" selected>Не вибрано</option>
                        @else
                            <option value="">Не вибрано</option>
                        @endif
                        @foreach($types as $type)
                            @if(!empty($params['type_id']) &&
                                $params['type_id'] == $type->id)
                                <option value="{{$type->id}}" selected>{{$type->name}}</option>;
                            @else
                                <option value="{{$type->id}}">{{$type->name}}</option>
                            @endif
                        @endforeach
                    </select>
                </div> -->





            <div id="container__entry-button">
                <button class="ui primary submit button">Пошук</button>
            </div>
        </form>
    </div>


    <h1 class="container__entry-header">Знайдені пропозиції</h1>
    <div id="cards__list" class="ui link cards">
        @foreach($anketas as $anketa)
            @if($anketa->photo==null)
                @continue;
            @endif

            <a href="{{route('anketa',$anketa->id)}}" id="cards__list-item" class="card">
                <img src="{{ asset('storage/images/'.$anketa->photo->path) }}" class="image card__image" alt="salon">
                <div class="content">
                    <div class="header">{{$anketa->name}}</div>
                    <div class="meta">
                        <b>Місто: {{$anketa->city->name}}</b>

                    </div>
                    <div class="description">
                        Спеціальність: {{$anketa->type->name}}
                    </div>
                    <div class="description">
                        <span class="metro_list">Метро:
                            {{ $anketa->metros->implode('name', ', ') }}
                        </span>
                    </div>
                    <div class="description">
                        Ціна: {{$anketa->price_1h_office}} грн за прийом (операцію)
                    </div>
                </div>
            </a>
        @endforeach
    </div>
    </div>
    @else
    <img src="{{ asset('storage/images/9_10.jpg') }}" class="main_photo" alt="salon">
    <!-- <div style="position = relative; "></div> -->
    <div class="welcome_c">
    <div class = "welcome_t">Записуйся на прийом з нами!</div>
    </div>
    @endif



@endsection
