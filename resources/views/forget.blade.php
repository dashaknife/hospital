@extends('layouts.app')

@section('title-block')
Увійти до системи
@endsection

@section('content')

<div class="container__entry">
    <h1 class="container__entry-header">Відновлення пороля</h1>
    <div class = "login_container">
        <form enctype="multipart/form-data" action="{{route('home')}}" method="post" class="ui form segment log_form">
            @csrf

            <div class="field">
                <label for="type" id="container__entry-label">Введіть пошту для відновлення</label>
                <input name="email" type="email" placeholder="Пошта" class="ui input" maxlength="50">
            </div>

            <div id="container__entry-button">
                <button type="submit" class="ui primary submit button">Відновити</button>
            </div>

            
        </form>
    </div>
</div>

@endsection
