<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Добавить автобус</title>
    <link href="css/MainStyle.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="js/addition.js"></script>
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

            <div id = "error" class = "error">${error}</div>

            <form method="post" action="add">
                <input type="text" id = "mark" oninput="markMatches()" onchange="markMatches()" name = "mark" placeholder="Марка автобуса (1 - 30 символов, включая пробелы и тире)" required pattern="^[A-Za-zА-Яа-яЁё0-9\-\ ]{1,30}$">
                <input type="text" id = "model" oninput="modelMatches()" name = "model" placeholder="Модель автобуса (1 - 20 символов, включая пробелы и тире)" required pattern="^[A-Za-zА-Яа-яЁё0-9\-\ ]{1,20}$">
                <input type="text" onchange="control(0)" id = "regNumber" oninput="regNumberMatches()" name = "regNumber" placeholder="Регистрационный номер в формате (AA 1234-5)" required pattern="^[A-Z]{2} [0-9]{4}-[0-9]{1}$">
                <input type="hidden" name = "state" value="true">
                <select id = "category" name="category" required>
                    <option selected disabled>Выберите категорию</option>
                    <option value="D">D</option>
                    <option value="DE">DE</option>
                </select>
                <textarea id = "description" type="text" name = "description" placeholder="Описание" maxlength="64"></textarea>
                <input id = "addBus" type="submit" value="Добавить автобус">
                <div class="stopForm"></div>
            </form>
        </div>

    </section>

    <div id="footer"></div>

</div>


</body>
</html>
