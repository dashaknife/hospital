@extends('layouts.app')

@section('title-block')
Анкета №{{$anketa->id}}
@endsection

@section('content')


<div id="container__anket">

    @if($is_trashed)
    <h3 id="fake__anketa">Адміністрація сайту попереджує, що ця анкета є недійсною!</h3>
    @endif

    <h1 class="container__entry-header">Анкета № {{$anketa->id}} ({{$anketa->name}})</h1>
    @if(Auth::user()->role->name == 'owner' && $anketa->user->id == Auth::id())
    @if(!$is_trashed)
    <div id="buttons__anketa">
        <a class="ui secondary basic button" href="{{route('editAnketa',$anketa->id)}}">Редагувати</a>
        <form class="ui form" action="{{route('anketas.destroy')}}" method="post">
            @csrf
            <input type="hidden" id="anketa_id" name="anketa_id" value="{{$anketa->id}}">
            <div id="delete__button">
                <button class="ui secondary basic button" type="submit"> Видалити анкету </button>
            </div>
        </form>
    </div>
    @endif
    @endif

    <table class="ui celled table">
        <thead>
            <tr>
                <th>Пункти</th>
                <th>Інформація про спеціаліста</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td data-label="Name">Ім'я</td>
                <td data-label="Age">{{$anketa->name}}</td>
            </tr>

            <tr>
                <td data-label="Name">Спеціальність</td>
                <td data-label="Age">{{$anketa->type->name}}</td>
            </tr>

            <tr>
                <td data-label="Name">Вік</td>
                <td data-label="Age">{{$anketa->age}}</td>
            </tr>

            <tr>
                <td data-label="Name">Місто</td>
                <td data-label="Age">{{$anketa->city->name}}</td>
            </tr>

            <tr>
                <td data-label="Name">Адреса</td>
                <td data-label="Age">{{$anketa->address}}</td>
            </tr>

            <tr>
                <td data-label="Name">Метро</td>
                <td data-label="Age">
                    {{ $anketa->metros->implode('name', ', ') }}
                </td>
            </tr>

            <tr>
                <td data-label="Name">Телефон</td>
                <td data-label="Age">+{{$anketa->tel}}</td>
            </tr>

            <tr>
                <td data-label="Name">Освіта</td>
                <td data-label="Age">{{$anketa->education->name}}</td>
            </tr>

            <tr>
                <td data-label="Name">Досвід</td>
                <td data-label="Age">{{$anketa->experience->name}}</td>
            </tr>

            <tr>
                <td data-label="Name">Про себе</td>
                <td data-label="Age">{{$anketa->about_me}}</td>
            </tr>

            <tr>
                <td data-label="Name">Прийом у себе</td>
                <td data-label="Age">{{$anketa->price_1h_office}} грн за прийом
                </td>
            </tr>

            <tr>
                <td data-label="Name">Виїзд до Вас</td>
                <td data-label="Age">{{$anketa->price_1h_challenge}} грн за прийом
                </td>
            </tr>



        </tbody>
    </table>

    <h3 class="container__entry-header">Фото лікаря</h3>
    @foreach($anketa->photos as $photo)
    <img id="anketa__image" class="ui large rounded image" src="{{ asset('storage/images/'.$photo->path) }} ">
    @endforeach

    <h1 class="container__entry-header">Графік роботи лікаря</h1>
    <table class="ui celled table">
        <thead>
            <tr>
                <th>День неділі</th>
                <th>Час</th>
            </tr>
        </thead>
        <tbody>
            @foreach($anketa->schedules as $schedule)
            <tr>
                <td data-label="Name">{{$schedule->weekday->name}}</td>
                <td data-label="Time">{{$schedule->timetable->begin}} - {{$schedule->timetable->end}}</td>
            </tr>
            @endforeach
        </tbody>
    </table>


    @if(Auth::user()->role->name == 'owner' && $anketa->user->id == Auth::id())

    <h1 class="container__entry-header">Зайнятий час</h1>
    <table class="ui celled table">
        <thead>
            <tr>
                <th>№ заказу</th>
                <th>Інформація про прийом</th>
                @if(!$is_trashed)
                <th>Обрати статус пацієнта</th>
                @endif
            </tr>
        </thead>
        <tbody>

            @foreach($anketa->orders as $order)
            <tr>
                <td data-label="Name">{{$order->id}}</td>
                <td data-label="Age">
                    <ul class="ui link list">
                        <li class="active item">
                            Ім'я: {{$order->user->name}}
                        </li>
                        <li class="active item">
                            дата: {{ $order->date}}
                        </li>
                        <li class="active item">
                            час: {{$order->timetable->begin}}-{{$order->timetable->end}}
                        </li>
                    </ul>
                </td>
                @if(!$is_trashed)
                <td>
                    <form class="ui form" action="{{route('orders.destroy')}}" method="post">
                        @csrf
                        <input type="hidden" id="order_id" name="order_id" value="{{$order->id}}">
                        <div id="button_ckeck-wrapper">
                            <button id="button__check" class="ui inverted button green" type="submit"> Прийшов </button>
                        </div>
                    </form>

                    <form class="ui form" action="{{route('orders.destroy')}}" method="post">
                        @csrf
                        <input type="hidden" id="order_id" name="order_id" value="{{$order->id}}">
                        <input type="hidden" id="client_come" name="client_come" value="1">
                        <div id="button_ckeck-wrapper">
                            <button id="button__check" class="ui inverted button red" type="submit">Не прийшов </button>
                        </div>
                    </form>
                </td>
                @endif
            </tr>
            @endforeach

        </tbody>
    </table>

    @endif


    @if(Auth::user()->role->id == 2)
    <div id="button__end">
        <a href="{{route('orders.create', $anketa->id)}}" class="ui secondary basic button">
            Записатися до спеціаліста
        </a>
    </div>
    @endif



</div>


@endsection
