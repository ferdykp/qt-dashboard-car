// App.qml
import QtQuick 6.5
// import Dashboard1
import "../ui"

Screen01 {
    id: mainScreen
    // Properti yang mewakili data untuk antarmuka
    property bool isIncreasing: true // Menyimpan arah perubahan (naik atau turun)
    property int speedLeds: 90
    property int currentSpeed: 0
    property int maxSpeed: 180
    property int rpmLeds : 90
    property int currentRpm: 0
    property int maxRpm: 15
    property int tempLeds : 100
    property int currentTemp : 0
    property int maxTemp : 100
    property int healthLeds : 100
    property int currentHealth : 0
    property int maxHealth : 100
    property int circleLeds : 100
    property int currentCircle: 0
    property int maxCircle: 100
    property int chargeLeds: 100
    property int currentCharge: 0
    property int maxCharge: 100
    property int batteryLevel: 90  // Level baterai default
    property string currentMode: "ECO"
    property string currentInd: "P"
    // property int currScreenNumber: 1 // Layar awal adalah Screen01
    // property bool transitioning: false
    // property string slideDirection: "left"



    buttonSwitch.onClicked: {
        mainScreen.rectLeft.color = "#6ffff9"
        mainScreen.rectLamp1.color = "lightblue"
        mainScreen.rectLamp2.color = "yellow"
        mainScreen.rectRight.color = "green"
        console.log("Changed Switch Button")
        mainScreen.changeMode();
        mainScreen.changeIndicator();
    }


    switchScreenButton.onClicked: {
        console.log("Menu ui ")
        switchScreen(2); // Pindah ke Screen02
    }

    function changeMode() {
        // Ganti mode secara berurutan
        if (currentMode === "Eco") {
            currentMode = "Sport"; // Ganti ke Mode Sport
        } else if (currentMode === "Sport") {
            currentMode = "Normal"; // Ganti ke Mode Normal
        } else {
            currentMode = "Eco"; // Kembali ke Mode Eco
        }
        updateModeDisplay(currentMode); // Panggil fungsi untuk memperbarui tampilan mode
    }

    function updateModeDisplay(mode) {
        // Mengupdate tampilan berdasarkan mode yang aktif
        if (mode === "Eco") {
            mainScreen.rectMode.border.color = "#00FF7F"; // Hijau neon untuk Eco
            mainScreen.textEco.text = "ECO"; // Teks ECO
        } else if (mode === "Sport") {
            mainScreen.rectMode.border.color = "#FF4500"; // Merah jingga terang untuk Sport
            mainScreen.textEco.text = "SPORT"; // Teks SPORT
        } else if (mode === "Normal") {
            mainScreen.rectMode.border.color = "#FFD700"; // Kuning emas terang untuk Normal
            mainScreen.textEco.text = "NORMAL"; // Teks NORMAL
        }
    }

    function changeIndicator() {
        // Ganti mode secara berurutan
        if (currentInd === "P") {
            currentInd = "R"; // Ganti ke Mode Sport
        } else if (currentInd === "R") {
            currentInd = "N"; // Ganti ke Mode Normal
        } else if (currentInd === "N"){
            currentInd = "D"
        } else {
            currentInd = "P"; // Kembali ke Mode Eco
        }
        updateIndDisplay(currentInd); // Panggil fungsi untuk memperbarui tampilan mode
    }

    // Fungsi untuk memperbarui tampilan berdasarkan mode
    function updateIndDisplay(ind) {
        mainScreen.parking.color = "#313237"; // Warna default (tidak aktif)
        mainScreen.reverse.color = "#313237";
        mainScreen.netral.color = "#313237";
        mainScreen.push.color = "#313237";
        // Mengupdate tampilan berdasarkan mode yang aktif
        if (ind === "P") {
            mainScreen.parking.color = "#00FF7F"; // Hijau neon untuk Eco
        } else if (ind === "R") {
            mainScreen.reverse.color = "#FF4500"; // Merah jingga terang untuk Sport
        } else if (ind === "N") {
            mainScreen.netral.color = "#FFD700"; // Kuning emas terang untuk Normal
        } else if (ind === "D") {
            mainScreen.push.color = "#FFD700"; // Kuning emas terang untuk Normal
        }
    }

    function updateSpeed(newSpeed) {
    mainScreen.currentSpeed = newSpeed;
    speedText.text = newSpeed + "\nKM/H";
    ledArc.requestPaint();
    }

    function updateRpm(newRpm) {
    mainScreen.currentRpm = newRpm;
    rpmText.text = newRpm + "\nRPM";
    rpmArc.requestPaint();
     }

    function updateBatteryLevel(newLevel) {
        mainScreen.batteryText.text = newLevel + " %";
        mainScreen.batteryLevel = Math.min(100, Math.max(0, newLevel));
    }

    function updateCircle(newCircle) {
        mainScreen.currentCircle = newCircle;
        circleText.text = newCircle + "% \nthrottle"
        circleArc.requestPaint();
    }

    function updateTemp(newTemp) {
        mainScreen.currentTemp = newTemp;
        tempText.text = newTemp + "°C \nTemp";
        tempArc.requestPaint();
    }

    function updateHealth(newHealth) {
        mainScreen.currentHealth = newHealth;
        healthText.text = newHealth + "%\nSoH";
        healthArc.requestPaint();
    }

    function updateCharge(newCharge) {
        mainScreen.currentCharge = newCharge;
        chargeText.text = newCharge + "%\nSoC";
        chargeArc.requestPaint();
    }


function speedCanvas() {
    let ctx = mainScreen.ledArc.getContext("2d");
    ctx.clearRect(0, 0, mainScreen.ledArc.width, mainScreen.ledArc.height);

    let centerX = mainScreen.ledArc.width / 2;
    let centerY = mainScreen.ledArc.height;
    let radius = 180;

    let totalSegments = mainScreen.speedLeds;
    let activeSegments = Math.floor((mainScreen.currentSpeed / mainScreen.maxSpeed) * totalSegments);
    let segmentAngle = Math.PI / totalSegments;

    for (let i = 0; i < totalSegments; i++) {
        let startAngle = Math.PI + i * segmentAngle;
        let endAngle = startAngle + segmentAngle * 0.8;

        let isMajorTick = i % 10 === 0;
        let currentRadius = isMajorTick ? radius + 15 : radius + 20;

        ctx.beginPath();
        ctx.arc(centerX, centerY, currentRadius, startAngle, endAngle);
        ctx.strokeStyle = i < activeSegments ? "#00BFFF" : "#555555";
        ctx.lineWidth = isMajorTick ? 30 : 20;
        ctx.stroke();

        if (isMajorTick) {
            let angleMid = startAngle + (endAngle - startAngle) / 2;
            let textX = centerX + (radius - 10) * Math.cos(angleMid);
            let textY = centerY + (radius - 10) * Math.sin(angleMid);

            // ctx.font = "16px Arial";
            ctx.fillStyle = "#FFFFFF";
            ctx.textAlign = "center";
            ctx.textBaseline = "middle";
            ctx.fillText((i * mainScreen.maxSpeed / totalSegments).toFixed(0), textX, textY);
        }
    }
}

function rpmCanvas() {
       let ctx = mainScreen.rpmArc.getContext("2d");
       ctx.clearRect(0, 0, mainScreen.rpmArc.width, mainScreen.rpmArc.height);

       let centerX = mainScreen.rpmArc.width / 2;
       let centerY = mainScreen.rpmArc.height;
       let radius = 100;

       let totalSegments = mainScreen.rpmLeds;
       let activeSegments = Math.floor((mainScreen.currentRpm / mainScreen.maxRpm) * totalSegments);
       let segmentAngle = Math.PI / totalSegments;

       for (let i = 0; i < totalSegments; i++) {
           let startAngle = Math.PI + i * segmentAngle;
           let endAngle = startAngle + segmentAngle * 0.8;

           let isMajorTick = i % 10 === 0;
           let currentRadius = isMajorTick ? radius + 15 : radius + 20;

           ctx.beginPath();
           ctx.arc(centerX, centerY, currentRadius, startAngle, endAngle);
           ctx.strokeStyle = i < activeSegments ? "#00BFFF" : "#555555";
           ctx.lineWidth = isMajorTick ? 30 : 20;
           ctx.stroke();

           if (isMajorTick) {
               let angleMid = startAngle + (endAngle - startAngle) / 2;
               let textX = centerX + (radius - 10) * Math.cos(angleMid);
               let textY = centerY + (radius - 10) * Math.sin(angleMid);

               // ctx.font = "16px Arial";
               ctx.fillStyle = "#FFFFFF";
               ctx.textAlign = "center";
               ctx.textBaseline = "middle";
               ctx.fillText((i * mainScreen.maxRpm / totalSegments).toFixed(0), textX, textY);
           }
       }
}

function circleCanvas() {
        let ctx = mainScreen.circleArc.getContext("2d");
        ctx.clearRect(0, 0, mainScreen.circleArc.width, mainScreen.circleArc.height);

        let centerX = mainScreen.circleArc.width / 2;
        let centerY = mainScreen.circleArc.height / 2;
        let radius = 50;

        let totalSegments = mainScreen.circleLeds;
        let activeSegments = Math.floor((mainScreen.currentCircle / mainScreen.maxCircle) * totalSegments); // Aktif sesuai persentase
        let segmentAngle = (2 * Math.PI) / totalSegments;

        for (let i = 0; i < totalSegments; i++) {
            let startAngle = -Math.PI / 2 + i * segmentAngle;
            let endAngle = startAngle + segmentAngle * 2;

            ctx.beginPath();
            ctx.arc(centerX, centerY, radius, startAngle, endAngle);
            ctx.strokeStyle = i < activeSegments ? "#44e6f8" : "#555555";
            ctx.lineWidth = 5;
            ctx.stroke();
        }
    }

function tempCanvas() {
        let ctx = mainScreen.tempArc.getContext("2d");
        ctx.clearRect(0, 0, mainScreen.tempArc.width, mainScreen.tempArc.height);

        let centerX = mainScreen.tempArc.width / 2;
        let centerY = mainScreen.tempArc.height / 2;
        let radius = 50;

        let totalSegments = mainScreen.tempLeds;
        let activeSegments = Math.floor((mainScreen.currentTemp / mainScreen.maxTemp) * totalSegments);
        let segmentAngle = (2 * Math.PI) / totalSegments;

        for (let i = 0; i < totalSegments; i++) {
            let startAngle = -Math.PI / 2 + i * segmentAngle;
            let endAngle = startAngle + segmentAngle * 2;

            ctx.beginPath();
            ctx.arc(centerX, centerY, radius, startAngle, endAngle);
            ctx.strokeStyle = i < activeSegments ? "#44e6f8" : "#555555";
            ctx.lineWidth = 5;
            ctx.stroke();
        }
    }

function healthCanvas() {
        let ctx = mainScreen.healthArc.getContext("2d");
        ctx.clearRect(0, 0, mainScreen.healthArc.width, mainScreen.healthArc.height);

        let centerX = mainScreen.healthArc.width / 2;
        let centerY = mainScreen.healthArc.height / 2;
        let radius = 50;

        let totalSegments = mainScreen.healthLeds;
        let activeSegments = Math.floor((mainScreen.currentHealth / mainScreen.maxHealth) * totalSegments);
        let segmentAngle = (2 * Math.PI) / totalSegments;

        for (let i = 0; i < totalSegments; i++) {
            let startAngle = -Math.PI / 2 + i * segmentAngle;
            let endAngle = startAngle + segmentAngle * 2;

            ctx.beginPath();
            ctx.arc(centerX, centerY, radius, startAngle, endAngle);
            ctx.strokeStyle = i < activeSegments ? "#44e6f8" : "#555555";
            ctx.lineWidth = 5;
            ctx.stroke();
        }
    }

function chargeCanvas() {
        let ctx = mainScreen.chargeArc.getContext("2d");
        ctx.clearRect(0, 0, mainScreen.chargeArc.width, mainScreen.chargeArc.height);

        let centerX = mainScreen.chargeArc.width / 2;
        let centerY = mainScreen.chargeArc.height / 2;
        let radius = 50;

        let totalSegments = mainScreen.chargeLeds;
        let activeSegments = Math.floor((mainScreen.currentCharge / mainScreen.maxCharge) * totalSegments);
        let segmentAngle = (2 * Math.PI) / totalSegments;

        for (let i = 0; i < totalSegments; i++) {
            let startAngle = -Math.PI / 2 + i * segmentAngle;
            let endAngle = startAngle + segmentAngle * 2;

            ctx.beginPath();
            ctx.arc(centerX, centerY, radius, startAngle, endAngle);
            ctx.strokeStyle = i < activeSegments ? "#44e6f8" : "#555555";
            ctx.lineWidth = 5;
            ctx.stroke();
        }
    }

// Timer {
//     interval: 1000
//     running: true
//     repeat: true
//     onTriggered: {
//         let newSpeed = Math.floor(Math.random * mainScreen.maxSpeed);
//         mainScreen.updateSpeed(newSpeed);
//         speedCanvas();
//         }
//     }

// Timer untuk mengupdate kecepatan secara berurutan
Timer {
    interval: 10 // Interval 1 detik
    running: true
    repeat: true
    onTriggered: {
            // Jika arah sedang naik (increment)
            if (mainScreen.isIncreasing) {
                if (mainScreen.currentSpeed < 160) {
                    mainScreen.currentSpeed += 1; // Naikkan nilai speed secara berurutan
                } else {
                    mainScreen.isIncreasing = false; // Setelah mencapai 160, ganti arah ke turun
                }
            }
            // Jika arah sedang turun (decrement)
            else {
                if (mainScreen.currentSpeed > 1) {
                    mainScreen.currentSpeed -= 1; // Turunkan nilai speed secara berurutan
                } else {
                    mainScreen.isIncreasing = true; // Setelah mencapai 1, ganti arah ke naik
                }
            }
        // Memperbarui nilai speed pada UI
        mainScreen.updateSpeed(mainScreen.currentSpeed);

        // Fungsi untuk memperbarui tampilan canvas atau tampilan terkait
        speedCanvas();
    }
}

Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: {
        let newRpm = Math.floor(Math.random() * mainScreen.maxRpm);
        mainScreen.updateRpm(newRpm);
        rpmCanvas();
        }
    }

Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: {
        // let newCircle = Math.floor(Math.random() * mainScreen.maxCircle);
        // mainScreen.updateCircle(newCircle);
        // circleCanvas();  // Update the Canvas display

            let newCircle = Math.floor(0.3 * mainScreen.maxCircle);
            mainScreen.updateCircle(newCircle);
            circleCanvas();

        }
    }

Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: {
            let newTemp = Math.floor(0.22 * mainScreen.maxTemp);
            mainScreen.updateTemp(newTemp);
            tempCanvas();

        }
    }

Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: {
            let newHealth = Math.floor(0.97 * mainScreen.maxHealth);
            mainScreen.updateHealth(newHealth);
            healthCanvas();

        }
    }

Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: {
            let newCharge = Math.floor(0.95 * mainScreen.maxCharge);
            mainScreen.updateCharge(newCharge);
            chargeCanvas();

        }
    }

Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: {
            let newLevel = Math.max(0, mainScreen.batteryLevel - Math.floor(0.5 * 5));
            mainScreen.updateBatteryLevel(newLevel);
        }
    }

Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: {
        mainScreen.timeText.text = Qt.formatTime(new Date(), "\thh:mm");
        mainScreen.dayText.text = Qt.formatDate(new Date(), "dddd |");
        mainScreen.dateText.text = Qt.formatDate(new Date(), "MMMM d, yyyy");
    }
}
}
