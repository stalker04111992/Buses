<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Добавить автобус</title>
    <link href="css/MainStyle.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>

<div id="wrapper">
    <div id="menubar">
        <div id="menu">
            <ul>
                <li id = "menu0"><a href="../../index"><span>Главная</span></a></li>
                <li id = "menu1"><a href="../../management"><span>Управление</span></a></li>
            </ul>
        </div>
    </div>

    <section class="container">
        <div class="bus">
            <h1>Добавление автобуса</h1>

            <div class = "error">${error}</div>

            <form method="post" action="addbus">
                <input type="text" name = "mark" placeholder="Марка автобуса" required pattern="^[A-Za-zА-Яа-яЁё0-9\-\ ]{1,30}$">
                <input type="text" name = "model" placeholder="Модель автобуса" required pattern="^[A-Za-zА-Яа-яЁё0-9\-\ ]{1,20}$">
                <input type="text" name = "regNumber" placeholder="Регистрационный номер" required pattern="^[a-zA-Z0-9\-]{5,10}$">
                <label>Состояние: На ходу<input type="radio" name = "state" value="true" checked></label>
                <label>Не на ходу<input type="radio" name = "state" value="false"></label>
                <textarea type="text" name = "description" placeholder="Описание" pattern="^[A-Za-zА-Яа-яЁё0-9\-(),. ]{0,64}$"></textarea>
                <input type="submit" value="Добавить автобус">
                <div class="stop"/>
            </form>
        </div>

    </section>

    <div id="footer">

    </div>

</div>


</body>
</html>
