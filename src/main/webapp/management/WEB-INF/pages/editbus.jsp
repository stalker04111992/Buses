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

            <form method="post" action="addbus">
                <select>
                    <c:forEach var="bus" items="${buses}">
                        <option value="${buses.indexOf(bus)}">${bus.getId()}  Рег. номер: ${bus.getRegNumber()} Автобус: ${bus.getMark()}   ${bus.getModel()}</option>
                    </c:forEach>
                </select>
                <input type="submit" value="Изменить данные">
                <div class="stop"/>
            </form>
        </div>

    </section>

    <div id="footer"></div>

</div>

</body>
</html>
