@extends('layouts.app')
@section('title-block')
Реєстрація
@endsection

@section('content')

<div class="container__entry">
    <h1 class="container__entry-header">Реєстрація</h1>
    <div class = "login_container">
        <form enctype="multipart/form-data" action="{{route('registration')}}" method="post" class="ui form segment">
            @csrf
            <div class="field">
                <label for="type" id="container__entry-label">Нікнейм</label>
                <input name="name" placeholder="Нікнейм" class="ui input" maxlength="50">
            </div>

            <div class="field">
                <label for="type" id="container__entry-label">Пошта</label>
                <input name="email" placeholder="Пошта" class="ui input">
            </div>

            <div class="field">
                <label for="type" id="container__entry-label">Пароль</label>
                <input name="password" placeholder="Пароль" type="password" class="ui input">
            </div>

            <div class="field">
                <label for="role" id="container__entry-label">Статус</label>
                <select name="role">
                    <option value="3">Лікар</option>
                    <option value="2">Пацієнт</option>
                </select>
            </div>

            <div id="container__entry-button">
                <button type="submit" class="ui primary submit button">Зареєструватися</button>
            </div>
        </form>
    </div>
</div>

@endsection
