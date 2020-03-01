<header>
    <div style="height: 300px; background-color: #ddd;">
    </div>
    <div id="header" class="header-main">
        <ul v-bind:style="{top: (scrollY > 0 ? '' : 0),
                           position: (scrollY > 0 ? '' : 'fixed'),
                           }">
            <li class="header-left">
                <i class="fa fa-user "></i>
            </li>
            <li class="header-center">

            </li>
            <li class="header-right">
                <div class="nav-menu">
                    <div class="nav-menu-property">
                        <p>NEWS</p>
                    </div>
                    <div class="nav-menu-property">
                        <p>INTERVIEW</p>
                    </div>
                    <div class="nav-menu-property">
                        <p>COLUMN</p>
                    </div>
                    <div class="nav-menu-property">
                        <p>ABOUT</p>
                    </div>
                    <div class="nav-menu-property find">
                        <div class="search-container">
                            <input class="input-form" type="text" size="25">
                            <i class="fa fa-search "></i>
                        </div>
                    </div>
                </div>
                <div class="toggle">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </li>
        </ul>
    </div>
</header>

<!-- script -->
<script src="/js/main.js" type="text/javascript"></script>
