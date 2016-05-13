<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Добавить автобус</title>
    <link href="css/MainStyle.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
</head>
<body>

<script type="text/javascript">


    var modelMatches = function () {
        var model = $("#model").val();
        var regexModel = new RegExp(/^[A-Za-zА-Яа-яЁё0-9/ /-]{1,30}$/);
        if (model.length == 0){
            $("#model").css('background-color', '#FFFFFF');
        }
        else if (model.search(regexModel) == -1){
            $("#model").css('background-color', '#FFDAB9');
        }
        else{
            $("#model").css('background-color', '#C1FFC1');
        }
    }

    var regNumberMatches = function () {
        var regNumber = $("#regNumber").val();
        var regexRegNumber = new RegExp(/^[A-Z]{2} [0-9]{4}-[0-9]{1}$/);
        if (regNumber.length == 0){
            $("#regNumber").css('background-color', '#FFFFFF');
        }else
        regNumber.search(regexRegNumber) == -1 ?
            $("#regNumber").css('background-color', '#FFDAB9'):
            $("#regNumber").css('background-color', '#C1FFC1');
    }

    var markMatches = function () {
        var mark = $("#mark").val();
        var regexMark = new RegExp(/^[A-Za-zА-Яа-яЁё0-9/ /-]{1,30}$/);
        if (mark.length == 0){
            $("#mark").css('background-color', '#FFFFFF');
        }else
        mark.search(regexMark) == -1 ?
            $("#mark").css('background-color', '#FFDAB9') :
            $("#mark").css('background-color', '#C1FFC1');
    }

    
</script>

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
                <input type="text" id = "regNumber" oninput="regNumberMatches()" name = "regNumber" placeholder="Регистрационный номер в формате (AA 1234-5)" required pattern="^[A-Z]{2} [0-9]{4}-[0-9]{1}$">
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
