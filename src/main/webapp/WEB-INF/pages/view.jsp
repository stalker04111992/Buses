<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Список водителей</title>
    <link href="css/MainStyle.css" rel="stylesheet" type="text/css">
    <link href="css/style1.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <link href="css/table.css" rel="stylesheet" type="text/css">
</head>
<body>

<script type="text/javascript">
    var drivers = '${drivers}';             //информация о водителях
    var jsonData = JSON.parse(drivers);     //парсинг json
    var error = '${error}';                 //сообщение об ошибке
    var start = 0;
    var end = 19;

    $(document).ready(function () {

        if (error.length != 0){
            $("#error").text(error);
            return -1;
        }

        if(jsonData.length == 0){
            $("#error").text("Водители не найдены");
            return -1;
        }

        $("#error").text("Список водителей");

        var table = $('<table></table>').addClass('table_blur');
        var row = $('<th>Таб. номер</th><th>Имя</th><th>Фамилия</th>');
        table.append(row);
        var length = jsonData.length > end ? end : jsonData.length;
        for (var j = 0; j < jsonData.length; j++) {
            var driver = jsonData[j];
            row = $('<tr></tr>');
            var rowData = $('<td><a class="spec" href = "select?number=' + driver['id'] + '">' + driver['id'] + '</a></td><td>' + driver['firstName'] + '</td><td>' + driver['lastName'] + '</td>');
            row.append(rowData);
            table.append(row);
        }
        $('#someContainer').append(table);
    });
</script>

<div id="wrapper">
    <div id="menubar">
        <div id="menu">
            <ul>
                <li id = "menu0"><a href="index"><span>Главная</span></a></li>
                <li id = "menu1"><a href="management"><span>Управление</span></a></li>
            </ul>
        </div>
    </div>

    <div id="block">
            <div class="spec2" id = "error"></div>
        </div>

    <div id = "someContainer"></div>

</div>

</body>
</html>