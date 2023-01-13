
const date = new Date();

const renderCalendar = () => {
    date.setDate(1);

    const monthDays = document.querySelector(".days");

    const lastDay = new Date(
        date.getFullYear(),
        date.getMonth() + 1,
        0
    ).getDate();

    const prevLastDay = new Date(
        date.getFullYear(),
        date.getMonth(),
        0
    ).getDate();

    const firstDayIndex = date.getDay();

    const lastDayIndex = new Date(
        date.getFullYear(),
        date.getMonth() + 1,
        0
    ).getDay();

    const nextDays = 7 - lastDayIndex - 1;

    const months = [
        "ינואר",
        "פברואר",
        "מרץ",
        "אפריל",
        "מאי",
        "יוני",
        "יולי",
        "אוגוסט",
        "ספטמבר",
        "אוקטובר",
        "נובמבר",
        "דצמבר",
    ];

    document.querySelector(".date h1").innerHTML = months[date.getMonth()];
    document.querySelector(".date span").innerHTML = date.getFullYear();

  //  document.querySelector(".date p").innerHTML = new Date().toDateString();

    let days = "";
   

    for (let x = firstDayIndex; x > 0; x--) {
        days += `<div class="prev-date">${prevLastDay - x + 1}</div>`;
    }

    for (let i = 1; i <= lastDay; i++) {
        if (
            i === new Date().getDate() &&
            date.getMonth() === new Date().getMonth()
        ) {
            days +=`<div class="today">${i}</div>`;
        } else {
            days += `<div id="dday${i}" onclick="Showpopup('dday${i}')">${i}</div>`;
        }
    }

    for (let j = 1; j <= nextDays; j++) {
        days += `<div id="nday${j}" class="next-date" onclick="Showpopup('nday${j}')">${j}</div>`;

        monthDays.innerHTML = days;
    }
    const OPH = document.querySelector(".openhours");
    let openhours = "";
    for (let a = 8; a < 20; a++) {

        openhours += `<option value="${a + ':00'}"> ${a + ':00'} </option>`;
    };
    OPH.innerHTML = openhours;

    
};

document.querySelector(".prev").addEventListener("click", () => {
    date.setMonth(date.getMonth() - 1);
    renderCalendar();
});

document.querySelector(".next").addEventListener("click", () => {
    date.setMonth(date.getMonth() + 1);
    renderCalendar();
});

//var x = document.getElementById("dday") + '';
//if (x) {
//    x.addEventListener("click", () => {
//        console.log('hi');
//    });
//}

function Showpopup(get) {

    document.getElementById(get).addEventListener('click', () => {
        document.querySelector(".popup p").innerHTML =
            document.getElementById(get).innerHTML
            + " ב"
            + document.querySelector(".date h1").innerHTML;
        document.querySelector(".popup").style.display = "flex";

    });
};


    document.querySelector('.Closer').addEventListener('click', () => {
        document.querySelector(".popup").style.display = "none";

    });







renderCalendar();

function hi() {
        console.log('hi');
}


//addEventListener('click', () => {
//    document.querySelector(".popup").style.display = "flex";
//});




//document.getElementById('dday1').addEventListener('click', () => {
//    document.querySelector(".popup p").innerHTML =
//        document.getElementById('dday1').innerHTML
//        + "."
//        + document.querySelector(".date h1").innerHTML;
//    document.querySelector(".popup").style.display = "flex";
//});

//=================================================================
////פונקציית סגירה
//document.querySelector('.Closer').addEventListener('click', () => {
//    document.querySelector(".popup").style.display = "none";
//});
//days.foreach(addEventListener('click', () => {
//    console.log('hi');
//}));

//for (let i = 0; i < days.length; i++) {
//    days[i].addEventListener('click', () => {
//        console.log('hi');
//    });
//}