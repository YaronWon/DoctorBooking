document.getElementById(".dday").addEventListener("click", () => {
    console.log('hi');

});

function Check9() {
    var input = document.getElementById("idcard").value;
    if (input.length < 8 || input.length > 8) {
        document.getElementById("Checker9").style.color = "red";
    }
    else {
        document.getElementById("Checker9").style.color = "green";
    }

};