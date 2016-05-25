<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Просмотр графика</title>
    <link href="css/MainStyle.css" rel="stylesheet" type="text/css">
    <link href="css/style1.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <link href="css/table.css" rel="stylesheet" type="text/css">
</head>
<body>
<script type="text/javascript">
    var driver = '${driver}';             //информация о водителях
    var jsonDriver = JSON.parse(driver);
    var graphs = '${graphs}';
    var graphics= JSON.parse(graphs);
    var error = '${error}';                 //сообщение об ошибке

    $(document).ready(function () {

        if (error.length != 0){
            $("#error").text(error);
            return -1;
        }

        if(jsonDriver.length == 0){
            $("#error").text("Водитель не найден");
            return -1;
        }

        $("#driver").text(jsonDriver['id'] + ' ' + jsonDriver['firstName'] + ' ' + jsonDriver['lastName']);

        if(graphics.length == 0){
            $("#error").text("График не составлен");
            return -1;
        }

            var table = $('<table></table>').addClass('table_blur');
            var row = $('<th>Дата</th><th>Смена</th><th>Номер автобуса</th>');
            table.append(row);

            for (var j = 0; j < graphics.length; j++) {
                var graph = graphics[j];
                var work = graph['work'];

                row = $('<tr></tr>');
                var date = new Date(graph['date']);
                var rowData;
                if (work != null){
                    rowData = $('<td>' + graph['date'] + '</td><td>' + graph['shift'] + '</td><td>' + work['busId'].toString() + '</td>');
                }
                else{
                    rowData = $('<td>' + graph['date'] + '</td><td>' + graph['shift'] + '</td><td>' + 'Не задан' + '</td>');
                }
                row.append(rowData);
                table.append(row);
            }
            $('#graph').append(table);

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
            <h3>Просмотр графика</h3>

            <div id = "error" class="spec2"></div>
            <div class="spec2" id = "driver"></div>
        </div>

    <div id = "graph"></div>

    </div>

</div>


</body>
</html>
