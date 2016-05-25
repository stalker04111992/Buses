<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Назначить транспорт</title>
    <link href="css/MainStyle.css" rel="stylesheet" type="text/css">
    <link href="css/style1.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <link href="css/table.css" rel="stylesheet" type="text/css">

    <link rel='stylesheet' href='css/calendar.css' type='text/css'>
    <script type='text/javascript' src='js/calendar.js'></script>


</head>
<body>

<script type="text/javascript">

    $(document).ready(function () {
        var error = '${error}';
        if (error.length != 0){
            exception(error);
        }
        var d = new Date();
        var n = d.toISOString();
        n = n.substring(0, n.indexOf('T'));
        $("#searchDate").val(n);
    });

    var ondelete = function (graph) {
        $.ajax({

            type: 'post',//тип запроса: get,post либо head
            url: 'delete',//url адрес файла обработчика
            data: {'graph':graph},//параметры запроса
            dataType: 'json',
            success: function (data) {//возвращаемый результат от сервера
                alert(data);
                onsearch();
            },
            error: function (rsp) {
                var error = JSON.parse(rsp.responseText);
                exception(error);
                onsearch();
            }
        });
    };

    var onadd = function (bus, graph) {
        var number = $(bus).val();

        $.ajax({

            type: 'post',//тип запроса: get,post либо head
            url: 'add',//url адрес файла обработчика
            data: {'bus': number, 'graph':graph},//параметры запроса
            dataType: 'json',
            success: function (data) {//возвращаемый результат от сервера
                alert(data);
                onsearch();
            },
            error: function (rsp) {
                var error = JSON.parse(rsp.responseText);
                exception(error);
                onsearch();
            }
        });
    };


    var onsearch = function () {
        var work = $("#work");
        if (work != null){
            work.remove();
        }

        var searchDate = $("#searchDate").val();
        var searchShift = $("#searchShift").val();

        $.ajax({

            type: 'get',//тип запроса: get,post либо head
            url: 'date',//url адрес файла обработчика
            data: {'shift': searchShift, 'date':searchDate},//параметры запроса
            dataType: 'json',
            success: function (data) {//возвращаемый результат от сервера

                if(data.length == 0){
                    $("#error").text("Не найдены водители");
                    return -1;
                }
                else{
                    $("#error").text("");
                }

                print(data);

                $.ajax({

                    type: 'get',//тип запроса: get,post либо head
                    url: 'buses',//url адрес файла обработчика
                    data: {'shift': searchShift, 'date':searchDate},//параметры запроса
                    dataType: 'json',
                    success: function (data) {//возвращаемый результат от сервера
                        if(data.length == 0){
                            $("#error").text("Не найдены свободные автобусы");
                            return -1;
                        }
                        addToSelect(data);
                    },
                    error: function (rsp) {
                        var error = JSON.parse(rsp.responseText);
                        exception(error);
                    }
                });
            },
            error: function (rsp) {
                var error = JSON.parse(rsp.responseText);
                exception(error);
            }

        });
    };

    var addToSelect = function (buses) {
        for (var j = 0; j < buses.length; j++){
            var bus = buses[j];
            $(".buses").append($("<option></option>").val(bus['id']).html(bus['id']));
        }
    };

    var exception = function (msg) {
        $("#error").text(msg);
        alert(msg);
    };

    var print = function (graphics) {
        var table = $('<table id = "work"></table>').addClass('table_blur');
        var row = $('<th>Фамилия</th><th>Имя</th><th>Отчество</th><th>Дата</th><th>Смена</th><th>Номер автобуса</th><th>Марка автобуса</th><th></th>');
        table.append(row);

        for (var j = 0; j < graphics.length; j++) {
            var graph = graphics[j];
            var driver = graph['driver'];
            row = $('<tr></tr>');
            var date = new Date(graph['date']);
            var rowData;
            var bus = graph['bus'];

            if (graph['busId'] != null && bus != null){
                rowData = $('<td>' + driver['lastName'] + '</td><td>' + driver['firstName'] + '</td><td>' + driver['patronymic'] + '</td><td>' + graph['date'] + '</td><td>' + graph['shift'] + '</td><td>' + bus['id'] + '</td><td>' + bus['mark'] + ' ' + bus['model'] + '</td><td><input type="button" value="-" onclick="ondelete(' + graph['id'] + ')">');
            }
            else{
                var id = "select" + j.toString();
                rowData = $('<td>' + driver['lastName'] + '</td><td>' + driver['firstName'] + '</td><td>' + driver['patronymic'] + '</td><td>' + graph['date'] + '</td><td>' + graph['shift'] + '</td><td><select class = "buses" id = "' + id + '" type = "text" name = "bus"></select></td><td> Не выбрано </td><td><input type="button" value="+" onclick="onadd(' + id + ',' + graph['id'] +')">');
            }
            row.append(rowData);
            table.append(row);
        }
        $('#graph').append(table);
    };

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
        <div id="block">
            <h3>Назначить транспорт</h3>

            <div id = "error" class="error"></div>
            <input id = "searchDate" name="data1" class="date">
            <select id = "searchShift" required>
                <option value="1">1</option>
                <option value="2">2</option>
            </select>
            <input id="submit" name="submit" type="submit" onclick = "onsearch()" value="Выбрать">
        </div>

    <div id = "graph"></div>
</div>

</body>
</html>