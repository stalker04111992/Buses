var load = function (jsonData, error) {
    if (error.length != 0) {
        $("#error").text(error);
        return -1;
    }

    if (jsonData.length == 0) {
        $("#error").text("Произошла ошибка. Автобус не найден");
        return -1;
    }

    var form = $("#editform");
    var bus = jsonData[0];

    form.append('<input type="hidden" id = "number" name = "number">');
    form.append('<input type="text" id = "mark" name = "mark" oninput="markMatches()" onchange="markMatches()" placeholder="Марка автобуса (1 - 30 символов, включая пробелы и тире)" required pattern="^[A-Za-zА-Яа-яЁё0-9- ]{1,30}$">');
    form.append('<input type="text" id = "model" name = "model" oninput="modelMatches()" name = "model" placeholder="Модель автобуса (1 - 20 символов, включая пробелы и тире)" required pattern="^[A-Za-zА-Яа-яЁё0-9- ]{1,20}$">');
    form.append('<input type="text" id = "regNumber" name = "regNumber" onchange="control(' + bus['id']+ ')" oninput="regNumberMatches()" placeholder="Регистрационный номер в формате (AA 1234-5)" required pattern="^[A-Z]{2} [0-9]{4}-[0-9]{1}$">');
    form.append('<input type="hidden" id = "category" name="category">');
    form.append('<label>Состояние: На ходу<input id = "state1" type="radio" name = "state" value="true"></label>');
    form.append('<label>Не на ходу<input id = "state2" type="radio" name = "state" value="false"></label>');
    form.append('<textarea type="text" id = "description" name = "description" placeholder="Описание"></textarea>');
    form.append('<input id="submit" name="submit" type="submit" value="Сохранить изменения">');
    form.append('<div class="stop"></div>');


    $("#number").val(bus['id']);
    $("#regNumber").val(bus['regNumber']);
    $("#mark").val(bus['mark']);
    $("#model").val(bus['model']);
    $("#category").val(bus['category']);
    $("#description").val(bus['description']);


    if (bus['state'])
    {
        $("input[name=state][value=true]").attr("checked", true);
    }
    else
    {
        $("input[name=state][value=false]").attr("checked", true);
    }

};