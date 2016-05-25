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
            <h1>Редактировать</h1>
            <div class = "error">${error}</div>

            <form method="post" action="edit">
                <input type="hidden" name = "number" value="${bus.getId()}">
                <input type="text" name = "mark" value="${bus.getMark()}" placeholder="Марка автобуса" required pattern="^[A-Za-zА-Яа-яЁё0-9\-\ ]{1,30}$">
                <input type="text" name = "model" value="${bus.getModel()}" placeholder="Модель автобуса" required pattern="^[A-Za-zА-Яа-яЁё0-9\-\ ]{1,20}$">
                <input type="text" name = "regNumber" value="${bus.getRegNumber()}" placeholder="Регистрационный номер" required pattern="^[a-zA-Z0-9\-]{5,10}$">
                <c:if test="${bus.isState() == true}">
                    <label>Состояние: На ходу<input type="radio" name = "state" value="true" checked></label>
                    <label>Не на ходу<input type="radio" name = "state" value="false"></label>
                </c:if>
                <c:if test="${bus.isState() != true}">
                    <label>Состояние: На ходу<input type="radio" name = "state" value="true"></label>
                    <label>Не на ходу<input type="radio" name = "state" checked value="false"></label>
                </c:if>
                <textarea type="text" name = "description" placeholder="Описание" pattern="^[A-Za-zА-Яа-яЁё0-9\-(),. ]{0,64}$">${bus.getDescription()}</textarea>
                <input type="submit" value="Сохранить изменения">
                <div class="stop"></div>
            </form>
        </div>

    </section>

    <div id="footer"></div>

</div>

</body>
</html>