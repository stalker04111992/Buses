<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Профиль</title>
    <link href="css/MainStyle.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
</head>
<body>

<div id="wrapper">
    <div id="menubar">
        <div id="menu">
            <ul>
                <li id = "menu0"><a href="../../index"><span>Главная</span></a></li>
                <li id = "menu1"><a href="../../management"><span>Управление</span></a></li>
                <li id = "menu2"><a href="view"><span>Просмотр списка автобусов</span></a></li>
            </ul>
        </div>
    </div>


    <script type="text/javascript">
        var bus = '${bus}';                 //информация об автобусах
        var jsonData = JSON.parse(bus);     //парсинг json
        var error = '${error}';             //сообщение об ошибке

        $(document).ready(function () {

            if (error.length != 0){
                $("#error").text(error);
                return -1;
            }

            if(jsonData.length == 0){
                $("#error").text("Произошла ошибка. Автобус не найден");
                return -1;
            }

            var bus = jsonData;
            bus.state ? $("input[name=state][value='true']").prop("checked",true) : $("input[name=state][value='false']").prop("checked",true);;

            $("#number").val(bus['id']);
            $("#regNumber").val(bus['regNumber']);
            $("#mark").val(bus['mark']);
            $("#model").val(bus['model']);
            $("#category").val(bus['category']);
            $("#description").val(bus['description']);

        });
    </script>


        <div class="bus">
            <h1>Редактировать</h1>
            <div class = "error">${error}</div>

            <form method="post" action="edit">
                <input type="hidden" id = "number" name = "number">
                <input type="text" id = "mark" name = "mark" placeholder="Марка автобуса" required pattern="^[A-Za-zА-Яа-яЁё0-9\-\ ]{1,30}$">
                <input type="text" id = "model" name = "model" placeholder="Модель автобуса" required pattern="^[A-Za-zА-Яа-яЁё0-9\-\ ]{1,20}$">
                <input type="text" id = "regNumber" name = "regNumber" placeholder="Регистрационный номер" required pattern="^[A-Z]{2} [0-9]{4}-[0-9]{1}$">
                <input type="hidden" id = "category" name="category">
                <label>Состояние: На ходу<input id = "state1" type="radio" name = "state" value="true"></label>
                <label>Не на ходу<input id = "state2" type="radio" name = "state" value="false"></label>
                <textarea type="text" id = "description" name = "description" placeholder="Описание" pattern="^[A-Za-zА-Яа-яЁё0-9\-(),. ]{0,64}$"></textarea>
                <input type="submit" value="Сохранить изменения">
                <div class="stop"></div>
            </form>
        </div>


    <div id="footer"></div>

</div>

</body>
</html>