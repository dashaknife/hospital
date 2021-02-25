@extends('layouts.app')

@section('title-block')
Прийом до {{$order->anketa->name}}
@endsection

@section('content')
<div id="container__anket">

    @if($is_trashed)
        <h3 id="fake__anketa">Адміністрація сайту попереджує, що цей прийом є неактивним, тому що анкента була видалена власником!</h3>
    @endif


    <h1 class="container__entry-header">Інформація про прийом  № {{$order->withTrashed()->first()->anketa->id}} ({{$order->anketa->name}})</h1>
    <table class="ui celled table">
        <thead>
            <tr>
                <th>Пункти</th>
                <th>Інформація про прийом</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td data-label="Name">Ім'я спеціаліста</td>
                <td data-label="Age">{{$order->anketa->name}}</td>
            </tr>

            <tr>
                <td data-label="Name">Телефон</td>
                <td data-label="Age">+{{$order->anketa->tel}}</td>
            </tr>

            <tr>
                <td data-label="Name">Місто</td>
                <td data-label="Age">{{$order->anketa->city->name}}</td>
            </tr>

            <tr>
                <td data-label="Name">Метро</td>
                <td data-label="Age">
                    @foreach($order->anketa->metros as $m)
                        {{$m->name}}
                    @endforeach
                </td>
            </tr>
            <tr>
                <td data-label="Name">Години прийому</td>
                <td data-label="Age">
                    {{$order->timetable->begin}}-{{$order->timetable->end}}
                </td>
            </tr>
            <tr>
                <td data-label="Name">Вартість прийому</td>
                <td data-label="Age">{{$order->anketa->price_1h_office}} грн</td>
            </tr>
        </tbody>
    </table>


    <form class="ui form" action="{{route('orders.destroy')}}" method="post" >
        @csrf
        <input type="hidden" id="order_id" name="order_id" value="{{$order->id}}">
        <div id="container__entry-button">
                <button class="ui secondary basic button" type="submit">Відмінити прийом </button>
        </div>
    </form>



</div>


@endsection
