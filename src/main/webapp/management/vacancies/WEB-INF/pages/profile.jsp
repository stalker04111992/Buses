<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Профиль</title>
    <link href="css/MainStyle.css" rel="stylesheet" type="text/css">
</head>
<body>

<div id="wrapper">
    <div id="menubar">
        <div id="menu">
            <ul>
                <li id = "menu0"><a href="../index"><span>Главная</span></a></li>
                <li id = "menu1"><a href="../management"><span>Управление</span></a></li>
            </ul>
        </div>
    </div>
    <section class="container">
        <div class="bus">
            <h1>Профиль</h1>
            <p>Номер автобуса: ${bus.getId()}</p>
            <p>Регистрационный номер автобуса: ${bus.getRegNumber()}</p>
            <p>Марка автобуса: ${bus.getMark()}</p>
            <p>Модель автобуса: ${bus.getModel()}</p>
            <p>Состояние автобуса: ${bus.isState()}</p>
            <p>Описание: ${bus.getDescription()}</p>

            <form method="get" action="edit">
                <input type="hidden" name = "number" value="${bus.getId()}">
                <input type="submit" value="Редактировать">
                <div class="stopForm"></div>
            </form>
            <form method="post" action="delete">
                <input type="hidden" name = "number" value="${bus.getId()}">
                <input type="submit" value="Удалить">
                <div class="stopForm"></div>
            </form>
        </div>

    </section>

    <div id="footer"></div>

</div>

</body>
</html>