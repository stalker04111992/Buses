<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Редактирование</title>
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link href="css/MainStyle.css" rel="stylesheet" type="text/css">
</head>
<body>

<script>

    $(document).ready(function(){
        if($("#wrapper").height() < $(window).height()){
            $("#wrapper").height($(window).height());
        }
    });
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

    <c:if test="${selectedVacancy != null}">
        <section class="container">
            <div class="bus">
                <h1>Изменение данных</h1>

                <div class = "error">${error}</div>

                <form method="post" action="updatevacancy">
                    <input type="hidden" name = "number" value="${selectedVacancy.getId()}">
                    <input type="text" name = "title" placeholder="Название вакансии" value = "${selectedVacancy.getTitle()}" required pattern="^[A-Za-zА-Яа-яЁё0-9\-(), ]{1,50}$">
                    <input type="text" name = "salary" placeholder="Тарифная ставка" value = "${selectedVacancy.getSalary()}" required pattern="^[0-9\.]{1,12}$">
                    <input type="text" name = "count" placeholder="Количество" value = "${selectedVacancy.getCount()}" required pattern="^[0-9]{1,3}$">
                    <textarea type="text" name = "description" placeholder="Описание" pattern="^[A-Za-zА-Яа-яЁё0-9\-(),. ]{0,256}$">${selectedVacancy.getDescription()}</textarea>
                    <input type="submit" value="Сохранить изменения">
                </form>

                <div class="stopForm"></div>

                <form action="deletevacancy" method="post">
                    <input type="hidden" name = "number" value="${selectedVacancy.getId()}">
                    <input type="submit" value="Удалить автобус">
                </form>

                <div class="stopForm"></div>

            </div>

        </section>
    </c:if>



    <div id="footer"></div>

</div>

</body>
</html>
