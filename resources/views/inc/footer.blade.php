<footer id="footer">

            <div class="footer_nav ">
                <p>Розділи сайту</p>
                <ul class="">
                    @if(Auth::check())
                    @if(Auth::user()->role->name == 'owner')
                    <li>
                        <a href="{{ route('create') }}">Додати анкету</a>
                    </li>
                    <li>
                        <a href="{{ route('my_account') }}">Особистий кабінет</a>
                    </li>
                    @else
                    <li>
                        <a href="{{ route('orders.index') }}">Мої прийоми</a>
                    </li>
                    @endif
                    <li>
                        <a href="{{ route('logout') }}">Вийти</a>
                    </li>
                    @else
                    <li>
                        <a href="{{ route('login') }}">Увійти</a>
                    </li>
                    <li>
                        <a href="{{ route('registration') }}">Реєстрація</a>
                    </li>
                    @endif
                </ul>
            </div>
            
            <div class="footer_cc">
                <p>Ми в соціальних мережах</p>
                <ul class="cc">
                    <li>
                        <a href="https://www.facebook.com/">
                            <img class="footer__icon" src="https://www.flaticon.com/svg/static/icons/svg/1384/1384053.svg">
                        </a>
                    </li>
                    <li>
                        <a href="https://twitter.com/">
                            <img class="footer__icon" src="https://www.flaticon.com/svg/static/icons/svg/124/124021.svg">
                        </a>
                    </li>
                    <li>
                        <a href="https://www.youtube.com/">
                            <img class="footer__icon" src="https://www.flaticon.com/svg/static/icons/svg/1384/1384060.svg">
                        </a>
                    </li>
                    <li>
                        <a href="https://www.instagram.com/">
                            <img class="footer__icon" src="https://www.flaticon.com/svg/static/icons/svg/2111/2111463.svg">
                        </a>
                    </li>
                </ul>
            </div>
</footer>
