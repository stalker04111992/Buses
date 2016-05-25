<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Добавить автобус</title>
    <link href="css/MainStyle.css" rel="stylesheet" type="text/css">
    <link href="css/style1.css" rel="stylesheet" type="text/css">
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

    <script type="text/javascript">
        var error = '${error}';             //сообщение об ошибке

        $(document).ready(function () {
            if (error.length != 0){
                $("#error").text(error);
            }
        });

    </script>



    <form id="form" name="form" action="add" method="post">
        <div id="block">
            <h3>Добавление автобуса</h3>
            <div id = "error" class = "error"></div>
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
            <input id="submit" name="submit" type="submit" value="Добавить автобус">
            <div class="stopForm"></div>
        </div>
    </form>

</div>


</body>
</html>
