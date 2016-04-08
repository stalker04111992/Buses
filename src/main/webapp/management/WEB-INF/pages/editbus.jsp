<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Редактирование</title>
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link href="css/MainStyle.css" rel="stylesheet" type="text/css">
</head>
<body>

<div id="wrapper">
    <div id="menubar">
        <div id="menu">
            <ul>
                <li><a href="../index"><span>Главная</span></a></li>
                <li><a href="../management"><span>Управление</span></a></li>
            </ul>
        </div>
    </div>

    <section class="container">
        <div class="bus">
            <h1>Изменить данные об автобусе</h1>
            <div class = "error">${error}</div>

            <form method="post" action="editbus">
                <input type="hidden" name = "action" value="select">
                <select name = "busIndex">
                    <c:forEach var="bus" items="${buses}">
                        <option value="${buses.indexOf(bus)}">${bus.getId()}  Рег. номер: ${bus.getRegNumber()} Автобус: ${bus.getMark()}   ${bus.getModel()}</option>
                    </c:forEach>
                </select>
                <input type="submit" value="Изменить данные">
                <div class="stop"/>
            </form>
        </div>
    </section>

    <c:if test="${bus != null}">
        <section class="container">
            <div class="bus">
                <h1>Изменение данных</h1>

                <div class = "error">${error}</div>

                <form method="post" action="editbus">
                    <input type="hidden" name = "action" value="edit">
                    <input type="hidden" name = "number" value="${bus.getId()}">
                    <input type="text" name = "mark" placeholder="Марка автобуса" value="${bus.getMark()}" required pattern="^[A-Za-zА-Яа-яЁё0-9\-\ ]{1,30}$">
                    <input type="text" name = "model" placeholder="Модель автобуса" value="${bus.getModel()}" required pattern="^[A-Za-zА-Яа-яЁё0-9\-\ ]{1,20}$">
                    <input type="text" name = "regNumber" placeholder="Регистрационный номер" value="${bus.getRegNumber()}" required pattern="^[a-zA-Z0-9\-]{5,10}$">
                    <c:if test="${bus.isState() == true}">
                        <label>Состояние: На ходу<input type="radio" name = "state" value ="true" checked></label>
                        <label>Не на ходу<input type="radio" name = "state" value="false"></label>
                    </c:if>
                    <c:if test="${bus.isState() == false}">
                        <label>Состояние: На ходу<input type="radio" name = "state" value="true"></label>
                        <label>Не на ходу<input type="radio" name = "state" value="false" checked></label>
                    </c:if>
                    <textarea type="text" name = "description" placeholder="Описание" pattern="^[A-Za-zА-Яа-яЁё0-9\-(),. ]{0,64}$">${bus.getDescription()}</textarea>
                    <input type="submit" value="Сохранить изменения">
                    <div class="stop"/>
                </form>
            </div>

        </section>
    </c:if>



    <div id="footer"></div>

</div>

</body>
</html>
