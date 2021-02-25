@extends('layouts.app')

@section('title-block')
Мої прийоми
@endsection

@section('content')


<h1 id="header__h1" class="container__entry-header">Мої прийоми</h1>
<div id="cards__list" class="ui link cards">


    @if(!empty($message))
    <h1>{{$message}}</h1>
    @endif




    @if($orders->isEmpty())
    <div class="header"> У вас немає прийомів </div>
    @endif


    @foreach($orders as $order)
    <a href="{{route('orders.show',$order->id)}}" id="cards__list-item" class="card">
        <img src="{{ asset('storage/images/'.$order->anketa->photo->path) }}" class="image card__image" alt="salon">
        <div class="content">
            <div class="header">{{$order->anketa->name}}</div>
            <div class="meta">
                <b>Місто: {{$order->anketa->city->name}}</b>
            </div>
            <div class="meta">
                <b>Дата: {{$order->date}}</b>
                <div>
                    {{$order->timetable->begin}} - {{$order->timetable->end}}

                </div>
            </div>
            <div class="description">
                <span class="metro_list">Метро:
                    @foreach($order->anketa->metros as $metro)
                    {{$metro->name}},
                    @endforeach
                </span>
            </div>
            <div class="description">
                Ціна: {{$order->anketa->price_1h_challenge}} грн за годину
            </div>
        </div>
    </a>
    @endforeach
</div>


<h1 class="container__entry-header">Неактивні прийоми </h1>
<div id="cards__list" class="ui link cards">

    @if($deleted_orders->isEmpty())
    <div class="header"> У вас немає неактивних прийомів </div>
    @endif


    @foreach($deleted_orders as $order)
    <a href="{{route('orders.show',$order->id)}}" id="cards__list-item-link" class="card">
        <img id="cards__list-item-image" src="{{ asset('storage/images/'.$order->anketa->photo->path) }}"
            class="image card__image" alt="salon">
        <div id="message__err">
            Прийом скасовано
        </div>
        <div id="cards__list-content" class="content">
            <div class="header">{{$order->anketa->name}}</div>
            <div class="meta">
                <b>Місто: {{$order->anketa->city->name}}</b>
            </div>
            <div class="meta">
                <b>Дата: {{$order->date}}</b>
                <div>
                    {{$order->timetable->begin}} - {{$order->timetable->end}}

                </div>
            </div>
            <div class="description">
                <span class="metro_list">Метро:
                    @foreach($order->anketa->metros as $metro)
                    {{$metro->name}},
                    @endforeach
                </span>
            </div>
            <div class="description">
                Ціна: {{$order->anketa->price_1h_challenge}} грн за годину
            </div>
        </div>
    </a>
    @endforeach
</div>



@endsection
