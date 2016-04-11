<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Автобусы</title>
    <link href="css/MainStyle.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
</head>
<body>
<style type="text/css">

.table_blur {
font: 12px Tahoma;
background: #f5ffff;
border-collapse: collapse;
text-align: left;
    margin: 10px auto 30px auto;
}
.table_blur th {
border-top: 1px solid #777777;
border-bottom: 1px solid #777777;
box-shadow: inset 0 1px 0 #999999, inset 0 -1px 0 #999999;
background: linear-gradient(#9595b6, #5a567f);
color: white;
padding: 10px 15px;
position: relative;
}
.table_blur th:after {
content: "";
display: block;
position: absolute;
left: 0;
top: 25%;
height: 25%;
width: 100%;
background: linear-gradient(rgba(255, 255, 255, 0), rgba(255,255,255,.08));
}
.table_blur tr:nth-child(odd) {
background: #ebf3f9;
}
.table_blur th:first-child {
border-left: 1px solid #777777;
border-bottom:  1px solid #777777;
box-shadow: inset 1px 1px 0 #999999, inset 0 -1px 0 #999999;
}
.table_blur th:last-child {
border-right: 1px solid #777777;
border-bottom:  1px solid #777777;
box-shadow: inset -1px 1px 0 #999999, inset 0 -1px 0 #999999;
}
.table_blur td {
border: 1px solid #e3eef7;
padding: 10px 15px;
position: relative;
transition: all 0.5s ease;
}

.table_blur td {
    border: 1px solid #e3eef7;
    padding: 10px 15px;
    position: relative;
    transition: all 0.5s ease;
}

.table_blur tbody:hover td {
color: transparent;
text-shadow: 0 0 3px #a09f9d;
}
.table_blur tbody:hover tr:hover td {
color: #444444;
text-shadow: none;
}
</style>

<script>

    $(document).ready(function(){
        if($("#wrapper").height() < $(window).height()){
            $("#wrapper").height($(window).height());
        }
    });

    $( document ).ready( function () {
        Hidden();
    })

    function Show() {
        var param = parseInt($('input[name=search]:checked').val());
        $("#searchLine").show();
        switch (param) {
            case 0:
            {
                $("#searchLine").attr("required");
                $("#searchLine").attr("placeholder", "Номер автобуса (Целое число)");
                break;
            }
            case 1:
            {
                $("#searchLine").attr("required");
                $("#searchLine").attr("placeholder", "Регистрационный номер (5-10 латинских символов или цифр)");
                break;
            }
            case 2:
            {
                $("#searchLine").attr("required");
                $("#searchLine").attr("placeholder", "Марка(1-30 символов)");
                break;
            }
        }
        $("#searchLine").show();
    }

    function Hidden(){
        $("#searchLine").hide();
    }

</script>


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
            <h1>Просмотр списка автобусов</h1>
            <%--@elvariable id="error" type="antlr"--%>
            <c:if test="${error != null}">
                <div class = "error">${error}</div>
            </c:if>
            <form method="get" action="searchbuses">
                <input id = "searchLine" type="text" name = "line" value="" title="">
                <%--@elvariable id="search" type="char"--%>
                <c:if test="${search != null}">
                    <c:if test="${search == 0}">
                        <p><input type="radio" onclick="Show()" checked name = "search" value="0" title="">Поиск по номеру</p>
                    </c:if>
                    <c:if test="${search != 0}">
                        <p><input type="radio" onclick="Show()" name = "search" value="0" title="">Поиск по номеру</p>
                    </c:if>
                    <c:if test="${search == 1}">
                        <p><input type="radio" onclick="Show()" checked name = "search" value="1" title="">Поиск по регистрационному номеру</p>
                    </c:if>
                    <c:if test="${search != 1}">
                        <p><input type="radio" onclick="Show()" name = "search" value="1" title="">Поиск по регистрационному номеру</p>
                    </c:if>
                    <c:if test="${search == 2}">
                        <p><input type="radio" onclick="Show()" checked name = "search" value="2" title="">Поиск по марке</p>
                    </c:if>
                    <c:if test="${search != 2}">
                        <p><input type="radio" onclick="Show()" name = "search" value="2" title="">Поиск по марке</p>
                    </c:if>
                    <c:if test="${search == 3}">
                        <p><input type="radio" onclick="Hidden()" checked name = "search" value="3" title="">Все автобусы</p>
                    </c:if>
                    <c:if test="${search != 3}">
                        <p><input type="radio" onclick="Hidden()" name = "search" value="3" title="">Все автобусы</p>
                    </c:if>
                </c:if>
                <c:if test="${search == null}">
                        <p><input type="radio" onclick="Show()" name = "search" value="0" title="">Поиск по номеру</p>

                        <p><input type="radio" onclick="Show()" name = "search" value="1" title="">Поиск по регистрационному номеру</p>

                        <p><input type="radio" onclick="Show()" name = "search" value="2" title="">Поиск по марке</p>

                        <p><input type="radio" onclick="Hidden()" checked name = "search" value="3" title="">Все автобусы</p>
                </c:if>
                <input type="submit" value="Поиск">
                <div class="stopForm"></div>
            </form>
        </div>
    </section>

<form action="update" method="post">
<%--@elvariable id="buses" type="antlr"--%>
<c:if test="${buses != null && buses.size() > 0}">
    <table class="table_blur">
        <tr>
            <th>№</th>
            <th>Номер</th>
            <th>Марка</th>
            <th>Модель</th>
            <th>Состояние</th>
            <th>Описание</th>
            <th>Выбрать</th>
        </tr>
        <c:forEach var="bus" items="${buses}">
        <tr>
            <td>${bus.getId()}</td>
            <td>${bus.getRegNumber()}</td>
            <td>${bus.getMark()}</td>
            <td>${bus.getModel()}</td>
            <td>${bus.isState()}</td>
            <td>${bus.getDescription()}</td>
            <td><a href="updatebus?selected=${bus.getId()}">Выбрать</a></td>
        </tr>
        </c:forEach>
    </table>
</c:if>
</form>

    <div class="Stop"></div>

    <div id="footer"></div>

</div>
</body>
</html>
