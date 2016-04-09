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

    <c:if test="${numbers != null}">
    <section class="container">
        <div class="bus">
            <h1>Изменить данные об автобусе</h1>
            <div class = "error">${error}</div>

            <form method="get" action="updatebus">
                <select name = "number">
                    <c:forEach var="busNumber" items="${numbers}">
                        <c:if test="${selectedBus != null && busNumber == selectedBus.getId()}">
                            <option selected value="${busNumber}">Номер автобуса: ${busNumber}</option>
                        </c:if>
                        <c:if test="${(selectedBus != null && busNumber != selectedBus.getId()) || selectedBus == null}">
                            <option value="${busNumber}">Номер автобуса: ${busNumber}</option>
                        </c:if>
                    </c:forEach>
                </select>
                <input type="submit" value="Изменить данные">
                <div class="stop"/>
            </form>
        </div>
    </section>
    </c:if>

    <c:if test="${selectedBus != null}">
        <section class="container">
            <div class="bus">
                <h1>Изменение данных</h1>

                <div class = "error">${error}</div>

                <form method="post" action="updatebus">
                    <input type="hidden" name = "number" value="${selectedBus.getId()}">
                    <input type="text" name = "mark" placeholder="Марка автобуса" value="${selectedBus.getMark()}" required pattern="^[A-Za-zА-Яа-яЁё0-9\-\ ]{1,30}$">
                    <input type="text" name = "model" placeholder="Модель автобуса" value="${selectedBus.getModel()}" required pattern="^[A-Za-zА-Яа-яЁё0-9\-\ ]{1,20}$">
                    <input type="text" name = "regNumber" placeholder="Регистрационный номер" value="${selectedBus.getRegNumber()}" required pattern="^[a-zA-Z0-9\-]{5,10}$">
                    <c:if test="${selectedBus.isState() == true}">
                        <label>Состояние: На ходу<input type="radio" name = "state" value ="true" checked></label>
                        <label>Не на ходу<input type="radio" name = "state" value="false"></label>
                    </c:if>
                    <c:if test="${selectedBus.isState() == false}">
                        <label>Состояние: На ходу<input type="radio" name = "state" value="true"></label>
                        <label>Не на ходу<input type="radio" name = "state" value="false" checked></label>
                    </c:if>
                    <textarea type="text" name = "description" placeholder="Описание" pattern="^[A-Za-zА-Яа-яЁё0-9\-(),. ]{0,64}$">${selectedBus.getDescription()}</textarea>
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
