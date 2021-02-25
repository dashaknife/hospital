<div id="header">
    <div id="container" class="container__header">
        <div id="header__logo" class="header__item">
            <a href="{{ route('home') }}">
                Лікарня по-українськи
            </a>
        </div>
        <div class="header__item">
            <nav class="header__nav">
                {{-- <a class="header__nav-item" href="{{ route('home') }}">Главная</a> --}}
                @if(Auth::check())

                    @if(Auth::user()->role->name == 'owner')
                        <a class="header__nav-item" href="{{ route('create') }}">Додати анкету</a>
                        {{-- @if($anketa->id) --}}
                            {{-- <a class="header__nav-item" href="{{route('anketa',$anketas->id)}}">Особистий кабінет</a> --}}

                            <a class="header__nav-item" href="{{route('my_account')}}">Особистий кабінет</a>
                        {{-- @endif --}}
                    @else
                        <a class="header__nav-item" href="{{ route('orders.index') }}">Мої прийоми</a>
                    @endif


                    <a class="header__nav-item" href="{{ route('logout') }}">Вийти</a>

                @else
                <a id="header__item-auth" class="ui secondary basic button" href="{{ route('login') }}">Увійти</a>
                <a id="header__item-auth" class="ui secondary basic button"
                    href="{{ route('registration') }}">Реєстрація</a>
                @endif
            </nav>
        </div>
    </div>
</div>
