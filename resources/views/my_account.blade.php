@extends('layouts.app')

{{--@section('title-block','')--}}

@section('title-block')
Мої анкети
@endsection

@section('content')

<h1 id="header__h1" class="container__entry-header">Мої анкети</h1>
<div id="cards__list" class="ui link cards">
    @if($anketas->isEmpty())
    <div class="header"> У вас немає анкет</div>
    @endif
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
                Адреса: {{$anketa->address}}
            </div>
        </div>
    </a>
    @endforeach
</div>




<h1 class="container__entry-header">Неактивні анкети: </h1>
<div id="cards__list" class="ui link cards">

    @if($deleted_anketas->isEmpty())
    <div class="header"> У вас немає неактивних прийомів </div>
    @endif
    @foreach($deleted_anketas as $anketa)
    @if($anketa->photo==null)
    @continue;
    @endif
    <a href="{{route('anketa',$anketa->id)}}" id="cards__list-item-link" class="card">
        <img id="cards__list-item-image" src="{{ asset('storage/images/'.$anketa->photo->path) }}" class="image
        card__image" alt="salon">
        <div id="message__err">
            Скасовано
        </div>
        <div id="cards__list-content" class="content">

            <div class="header">{{$anketa->name}}</div>
            <div class="meta">
                <b>Місто: {{$anketa->city->name}}</b>
            </div>
            <div class="description">
                Спеціальність: {{$anketa->type->name}}
            </div>
            <div class="description">
                Адреса: {{$anketa->address}}
            </div>
        </div>
    </a>
    @endforeach
</div>

@endsection
