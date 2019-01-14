
var milk_button = document.getElementById("milk_button");
milk_button.onclick = function () {
    var emp = document.getElementById("emp").value;
    var usr = document.getElementById("usr").value;
    if(usr==""){
        window.confirm("请选择一个顾客进行测试")
        return;
    }else if(usr==""){
        window.confirm("请选择一个导购的售货员")
        return;
    }
    var milk_input = document.getElementById("milk_input").value;
    var url = "buy?1=p000&2="+usr+"&3="+emp+"&4=pr00&5="+milk_input;
    console.log(url);
    window.location.href=url;
}

var egg_button = document.getElementById("egg_button");
egg_button.onclick = function () {
    var emp = document.getElementById("emp").value;
    var usr = document.getElementById("usr").value;
    if(usr==""){
        window.confirm("请选择一个顾客进行测试")
        return;
    }else if(usr==""){
        window.confirm("请选择一个导购的售货员")
        return;
    }
    var egg_input = document.getElementById("egg_input").value;
    var url = "buy?1=p000&2="+usr+"&3="+emp+"&4=pr01&5="+egg_input;
    console.log(url);
    window.location.href=url;
}

var bread_button = document.getElementById("bread_button");
bread_button.onclick = function () {
    var emp = document.getElementById("emp").value;
    var usr = document.getElementById("usr").value;
    if(usr==""){
        window.confirm("请选择一个顾客进行测试")
        return;
    }else if(usr==""){
        window.confirm("请选择一个导购的售货员")
        return;
    }
    var bread_input = document.getElementById("bread_input").value;
    var url = "buy?1=p000&2="+usr+"&3="+emp+"&4=pr02&5="+bread_input;
    console.log(url);
    window.location.href=url;
}

var pineapple_button = document.getElementById("pineapple_button");
pineapple_button.onclick = function () {
    var emp = document.getElementById("emp").value;
    var usr = document.getElementById("usr").value;
    if(usr==""){
        window.confirm("请选择一个顾客进行测试")
        return;
    }else if(usr==""){
        window.confirm("请选择一个导购的售货员")
        return;
    }
    var pineapple_input = document.getElementById("pineapple_input").value;
    var url = "buy?1=p000&2="+usr+"&3="+emp+"&4=pr03&5="+pineapple_input;
    console.log(url);
    window.location.href=url;
}

var knife_button = document.getElementById("knife_button");
knife_button.onclick = function () {
    var emp = document.getElementById("emp").value;
    var usr = document.getElementById("usr").value;
    if(usr==""){
        window.confirm("请选择一个顾客进行测试")
        return;
    }else if(usr==""){
        window.confirm("请选择一个导购的售货员")
        return;
    }
    var knife_input = document.getElementById("knife_input").value;
    var url = "buy?1=p000&2="+usr+"&3="+emp+"&4=pr04&5="+knife_input;
    console.log(url);
    window.location.href=url;
}

var shovel_button = document.getElementById("shovel_button");
shovel_button.onclick = function () {
    var emp = document.getElementById("emp").value;
    var usr = document.getElementById("usr").value;
    if(usr==""){
        window.confirm("请选择一个顾客进行测试")
        return;
    }else if(usr==""){
        window.confirm("请选择一个导购的售货员")
        return;
    }
    var shovel_input = document.getElementById("shovel_input").value;
    var url = "buy?1=p000&2="+usr+"&3="+emp+"&4=pr05&5="+shovel_input;
    console.log(url);
    window.location.href=url;
}


