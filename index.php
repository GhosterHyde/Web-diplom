<?php

session_start();
include_once('pages/classes.php');
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="yandex-verification" content="d18273abb890ad85" />
    <title>Кино+Фильм</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <!-- Yandex.Metrika counter -->
    <script type="text/javascript" >
        (function(m,e,t,r,i,k,a){m[i]=m[i]||function(){(m[i].a=m[i].a||[]).push(arguments)};
            m[i].l=1*new Date();k=e.createElement(t),a=e.getElementsByTagName(t)[0],k.async=1,k.src=r,a.parentNode.insertBefore(k,a)})
        (window, document, "script", "https://mc.yandex.ru/metrika/tag.js", "ym");

        ym(56374675, "init", {
            clickmap:true,
            trackLinks:true,
            accurateTrackBounce:true
        });
    </script>
    <noscript><div><img src="https://mc.yandex.ru/watch/56374675" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
    <!-- /Yandex.Metrika counter -->

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-153235704-1"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'UA-153235704-1');
    </script>

    <meta name="google-site-verification" content="ytSrYsqwqL904dQkkWMS2rWwoVEUGHJsDBhpz7VRphE" />
</head>

<body>
    <div class="container">
        <div class="row">
            <header class="col-sm-12 col-md-12 col-lg-12">

            </header>
        </div>
        <div class="row menu">
            <div class="reg">
                <?php
                if($_SESSION['ruser']=='') {
                    ?>
                    <a href="index.php?reg=1"><span class="reg">Регистрация</span></a><span class="slash">/</span><a
                            href="index.php?reg=0"><span class="reg">Вход</span></a>
                    <?php
                }
                else{
                    echo '<span class="reg name">Добро пожаловать, <a
                            href="index.php?reg=0">';
                    echo $_SESSION['ruser'];
                    echo '</a>!</span>';
                }
                ?>
            </div>
            <nav class="navbar navbar-expand navbar-light bg-white w-100">
                <?php include_once('pages/menu.php'); ?>
            </nav>
        </div>
        <div class="row content">
            <section class="col-sm-12 col-md-12 col-lg-12">
                <?php
    if(isset($_GET['page'])){
        $page = $_GET['page'];
        if($page == 1) include_once('pages/catalog.php');
        if($page == 2) include_once('pages/timetable.php');
        if($page == 3) include_once('pages/cinemas.php');
        if($page == 4) include_once('pages/selebreties.php');
        if($page == 5) include_once('pages/connect.php');
        if($page == 6) include_once('pages/admin.php');
    }else if(isset($_GET['reg'])){
        if($_GET['reg']==1)
          include_once('pages/registration.php');
        if($_GET['reg']==0)
            include_once('pages/login.php');
    } else if (!isset($_GET['film'])){
        ?>
        <h3>Добро пожаловать!</h3>
        <div class="photo">
            <h5>Наш кинотеатр:</h5>
        <img src="images/cinemaM.jpg" alt="cinema">
        </div>
        <span class="fs">Рады приветствовать вас на нашем сайте!</span>
        <div class="mt-5 mb-5 ml-5">
    <span class="contact fs"><p>Наши контакты:</p><p>Адрес: г. Новосибирск, ул. Фрунзе, д. 67.</p>
        <p>Телефон: <a class="telnum" href="tel:+79515714250">+7(951)571-42-50</a></p><p>Телефон: <a class="telnum" href="tel:+792347339523">+7(923)733-95-23</a></p></span>
        </div>
                <?php
    } else {
        include_once('pages/filminfo.php');
    }
    ?></section>
        </div>
        <footer class="row foot">
            <div class="copies mt-3">
                <p>
                <span>Step academy &copy; 2019</span>
                </p>
                <p>
                    <span>&copy; 2019 Сеть киноцентров &laquo;Кино+Фильм&raquo;</span>
                </p>
            </div>
            <div class="references ml-5 mt-3 mb-3">
                <h4 class="mb-3">Для гостей</h4>
                <div class="ref">
                    <a href="index.php?page=1">Афиша</a>
                </div>
                <div class="ref">
                    <a href="index.php?page=2">Расписание</a>
                </div>
                <div class="ref">
                    <a href="index.php?page=3">Кинотеатры</a>
                </div>
                <div class="ref">
                    <a href="index.php?page=4">Мероприятия</a>
                </div>
                <div class="ref">
                    <a href="index.php?page=5">Контакты</a>
                </div>
            </div>
            <div class="copies mt-3 ml-3">
                <p>
                    <span>Тел.: <a class="telnumfooter" href="tel:+79515714250">+7(951)571-4250</a></span>
                </p>
                <p>
                    <span>Тел.: <a class="telnumfooter" href="tel:+79237339523">+7(923)733-9523</a></span>
                </p>
                <p>
                    <span>Адрес: г. Новосибирск, ул. Фрунзе, дом 67</span>
                </p>
            </div>
        </footer>
    </div>

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jqcookie.js"></script>
</body>

</html>