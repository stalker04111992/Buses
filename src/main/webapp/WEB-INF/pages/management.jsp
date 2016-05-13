<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Управление</title>
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
</head>
<body>
<div id = "wrapper">
    <div id="menubar">
        <div id="menu">
            <ul>
                <li id = "menu0"><a href="index"><span>Главная</span></a></li>
            </ul>
        </div>
    </div>

    <div id="managementBuses">
        <ul>
            <li><a href="management/buses/add">Добавить автобус</a></li>
            <li><a href="management/buses/view">Работа с данными об автобусах</a></li>
        </ul>
    </div>

    <div id="managementPersonnel">
        <ul>
            <li><a href="management/drivers/add">Добавить водителя</a></li>
            <li><a href="management/drivers/view">Работа с данными о водителях</a></li>
        </ul>
    </div>

    <div id="managementPosts">
        <ul>
            <li><a href="management/graph/view">Управление графиком</a></li>
        </ul>
    </div>

    <div id="managementTable">
        <ul>
            <li><a href="management/table/view">Назначить автобусы</a></li>
        </ul>
    </div>

    <div id="footer">

    </div>

</div>

</body>
</html>
