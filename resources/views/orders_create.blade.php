@extends('layouts.app')

@section('title-block')
Створити замовлення
@endsection

@section('content')

<div id="container__add-anket">
    <h1 id="header__h1" class="container__entry-header">Запис до спеціаліста</h1>

    <table class="ui celled table">
        <thead>
            <tr>
                <th>Пункти</th>
                <th>Інформація про спеціаліста</th>
            </tr>
        </thead>
        <tbody>

            <tr>
                <td data-label="Name">Анкета № </td>
                <td data-label="Age">{{$anketa->id}}</td>
            </tr>

            <tr>
                <td data-label="Name">Ім'я спеціаліста</td>
                <td data-label="Age">{{$anketa->name}}</td>
            </tr>

            <tr>
                <td data-label="Name">Спеціальність</td>
                <td data-label="Age">{{$anketa->type->name}}</td>
            </tr>

            <tr>
                <td data-label="Name">Телефон</td>
                <td data-label="Age">+{{$anketa->tel}}</td>
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
                <td data-label="Name">Прийом</td>
                <td data-label="Age">{{$anketa->price_1h_office}} грн за прийом
                </td>
            </tr>

        </tbody>
    </table>

    <form enctype="multipart/form-data" method="get" class="ui form">
        @csrf

        <label for="start_date">Дата (від коли):</label>
        <input type="date" id="date" name="start_date" min="2020-12-28" max="2021-02-27">

        <label id="min__date" for="end_date">Дата (до коли):</label>
        <input type="date" id="date" name="end_date" min="2020-12-28" max="2021-02-27">


        <div id="button__end">
            <button class="ui secondary basic button" type="submit">Знайти вільний прийом</button>
        </div>
    </form>

    <form enctype="multipart/form-data" action="{{route('orders.store')}}" method="post" class="ui form">
        @csrf
        <input type="hidden" name="anketa_id" value="{{$anketa->id}}">

        <div class="field">
            <label for="order" id="container__entry-label">Вільні дати та години: </label>
            <select name="order">
                @foreach($result as $r)
                <option value='{"date":"{{$r->dt}}","timetable_id":"{{$r->timetable_id}}"}'>
                    {{$r->dt}} : {{$r->begin}} - {{$r->end}}
                </option>
                @endforeach
            </select>
        </div>

        <div id="container__entry-button">
            <button class="ui secondary basic button" type="submit">Записатися на прийом</button>
        </div>
    </form>

</div>

@endsection
