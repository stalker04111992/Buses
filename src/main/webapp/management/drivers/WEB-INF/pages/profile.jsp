<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Данные о водителе</title>
    <link href="css/MainStyle.css" rel="stylesheet" type="text/css">
    <link href="css/style1.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
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
        var driver = '${driver}';                   //информация об автобусах
        var jsonData = JSON.parse(driver);          //парсинг json
        var error = '${error}';                     //сообщение об ошибке

        $(document).ready(function () {

            if (error.length != 0){
                $("#error").text(error);
            }

            if(jsonData.length == 0){
                $("#title").text("Произошла ошибка. Водитель не найден");
                return -1;
            }

            $("#title").text("Данные о водителе");
            var element = $('#someContainer');
            var driver = jsonData[0];

            element.append('<p class = "spec2">Табельный номер: ' + driver['id'] + '</p>');
            element.append('<p class = "spec2">Фамилия: ' + driver['lastName'] + '</p>');
            element.append('<p class = "spec2">Имя: ' + driver['firstName'] + '</p>');
            element.append('<p class = "spec2">Класс вождения: ' + driver['driverClass'] + '</p>');
            element.append('<p class = "spec2">Номер водительского удостоверения: ' + driver['licenseNumber'] + '</p>');

            $("#formEdit").append('<form method="get" action="edit">' +
                    '<input type="hidden" name = "number" value="' + driver['id'] + '">' +
                    '<input id="submit" name="submit" type="submit" value="Редактировать">' +
                    '<div class="stopForm"></div>' +
                    '</form>');

            $("#formDelete").append('<form method="post" action="delete">' +
                    '<input type="hidden" name = "number" value="' + driver['id'] + '">' +
                    '<input id="submit" name="submit" type="submit" value="Удалить">' +
                    '<div class="stopForm"></div>' +
                    '</form>');
        });
    </script>

    <div id="block">
        <div id = "title" class="error"></div>
        <div id = "error" class="error"></div>

        <div id = "someContainer"></div>

        <div id = "formEdit"></div>
        <div id = "formDelete"></div>
    </div>


</div>

</body>
</html>