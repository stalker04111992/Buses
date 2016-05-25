<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Редактирование</title>
    <link href="css/MainStyle.css" rel="stylesheet" type="text/css">
    <link href="css/style1.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
</head>
<body>

<script type="text/javascript">
    var driver = '${driver}';                   //информация об автобусах
    var jsonData = JSON.parse(driver);          //парсинг json
    var error = '${error}';                     //сообщение об ошибке

    $(document).ready(function () {

        if (error.length != 0){
            $("#error").text(error);
        }

        if(jsonData.length == 0){
            $("#error").text("Произошла ошибка. Водитель не найден");
            return -1;
        }

        var driver = jsonData[0];

        $("#number").val(driver['id']);
        $("#lastName").val(driver['lastName']);
        $("#firstName").val(driver['firstName']);
        $("#driverClass").val(driver['driverClass']);
        $("#licenseNumber").val(driver['licenseNumber']);
    });
</script>

<div id="wrapper">
    <div id="menubar">
        <div id="menu">
            <ul>
                <li><a href="../../index"><span>Главная</span></a></li>
                <li><a href="../../management"><span>Управление</span></a></li>
            </ul>
        </div>
    </div>

        <div id="block">
            <h3>Редактирование</h3>

            <div id = "error" class = "error">${error}</div>

            <form method="post" action="edit">
                <input type="hidden" id = "number" name = "number">
                <input type="text" id = "lastName" name = "lastName" placeholder="Фамилия" required pattern="^[A-Za-zА-Яа-яЁё0-9\-, ]{1,50}$">
                <input type="text" id = "firstName" name = "firstName" placeholder="Имя" required pattern="^[A-Za-zА-Яа-яЁё0-9\-, ]{1,50}$">
                <select id = "driverClass" name = "driverClass" required>
                    <option disabled selected>Класс вождения</option>
                    <option value="1">1 класс</option>
                    <option value="2">2 класс</option>
                    <option value="3">3 класс</option>
                </select>
                <input type="text" id = "licenseNumber" name = "licenseNumber" placeholder="Номер водительского удостоверения" pattern="^[0-9]{1}[A-Z]{2} [0-9]{6}$">

                <input id="submit" name="submit" type="submit" value="Сохранить изменения">
                <div class="stopForm"/>
            </form>
        </div>

</div>

</body>
</html>
