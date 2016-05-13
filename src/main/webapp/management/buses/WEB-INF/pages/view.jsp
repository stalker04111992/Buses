<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Автобусы</title>
    <link href="css/MainStyle.css" rel="stylesheet" type="text/css">
    <link href="css/table.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
</head>
<body>

<script type="text/javascript">
    var buses = '${buses}';             //информация об автобусах
    var jsonData = JSON.parse(buses);   //парсинг json
    var error = '${error}';             //сообщение об ошибке

    $(document).ready(function () {

        if (error.length != 0){
            $("#error").text(error);
        }

        if(jsonData.length == 0){
            $("#title").text("Автобусы не найдены");
            return -1;
        }

        $("#title").text("Список автобусов");

        var table = $('<table></table>').addClass('table_blur');
        var row = $('<th>Номер</th><th>Марка</th><th>Модель</th><th>Рег. номер</th><th>Состояние</th>');

        table.append(row);

        for (var j = 0; j < jsonData.length; j++) {
            var bus = jsonData[j];
            var state = bus.state ? "На ходу" : "На техобслуживании";
            row = $('<tr></tr>');
            var rowData = $('<td><a href = "profile?number=' + bus['id'] + '">' + bus['id'] + '</a></td><td>' + bus['mark'] + '</td><td>' +
                    bus['model'] + '</td><td>' + bus['regNumber'] + '</td>' +
                    '<td>' + state + '</td>');
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
                <li id = "menu0"><a href="../../index"><span>Главная</span></a></li>
                <li id = "menu1"><a href="../../management"><span>Управление</span></a></li>
            </ul>
        </div>
    </div>

        <div class="bus">
            <div id = "title" class="error"></div>
            <div id = "error" class="error"></div>
        </div>


    <div id = "someContainer"></div>

    <div id="footer"></div>

</div>

</body>
</html>
