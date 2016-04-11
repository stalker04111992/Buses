<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Вакансии</title>
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
                $("#searchLine").attr("placeholder", "Номер вакансии (Целое число)");
                break;
            }
            case 1:
            {
                $("#searchLine").attr("required");
                $("#searchLine").attr("placeholder", "Количество вакансий, не менее (Целое число)");
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
                <li><a href="../../index"><span>Главная</span></a></li>
                <li><a href="../../management"><span>Управление</span></a></li>
            </ul>
        </div>
    </div>

    <section class="container">
        <div class="bus">
            <h1>Просмотр списка вакансий</h1>
            <%--@elvariable id="error" type="antlr"--%>
            <c:if test="${error != null}">
                <div class = "error">${error}</div>
            </c:if>
            <form method="get" action="searchvacancies">
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
                        <p><input type="radio" onclick="Show()" checked name = "search" value="1" title="">Поиск по количеству</p>
                    </c:if>
                    <c:if test="${search != 1}">
                        <p><input type="radio" onclick="Show()" name = "search" value="1" title="">Поиск по количеству</p>
                    </c:if>
                    <c:if test="${search == 2}">
                        <p><input type="radio" onclick="Hidden()" checked name = "search" value="2" title="">Все вакансии</p>
                    </c:if>
                    <c:if test="${search != 2}">
                        <p><input type="radio" onclick="Hidden()" name = "search" value="2" title="">Все вакансии</p>
                    </c:if>

                </c:if>
                <c:if test="${search == null}">
                    <p><input type="radio" onclick="Show()" name = "search" value="0" title="">Поиск по номеру</p>

                    <p><input type="radio" onclick="Show()" name = "search" value="1" title="">Поиск по количеству</p>

                    <p><input type="radio" checked onclick="Hidden()" name = "search" value="2" title="">Все вакансии</p>
                </c:if>
                <input type="submit" value="Поиск">
                <div class="stopForm"></div>
            </form>
        </div>
    </section>

<form action="update" method="post">
<%--@elvariable id="vacancies" type="antlr"--%>
<c:if test="${vacancies != null && vacancies.size() > 0}">
    <table class="table_blur">
        <tr>
            <th>№</th>
            <th>Название</th>
            <th>Ставка</th>
            <th>Количество</th>
            <th>Описание</th>
            <th>Действие</th>
        </tr>
        <c:forEach var="vacancy" items="${vacancies}">
        <tr>
            <td>${vacancy.getId()}</td>
            <td>${vacancy.getTitle()}</td>
            <td>${vacancy.getSalary()}</td>
            <td>${vacancy.getCount()}</td>
            <td>${vacancy.getDescription()}</td>
            <td><a href="updatevacancy?selected=${vacancy.getId()}">Выбрать</a></td>
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
