// App.qml
import QtQuick 6.5
import Dashboard1
import "../ui"

Window {
    width: mainScreen.width
    height: mainScreen.height
    visible: true
    title: "Dashboard1"

    Screen01 {
        id: mainScreen

        // Properti yang mewakili data untuk antarmuka
        property int speedLeds: 90
        property int rpmLeds : 90
        property int currentSpeed: 0
        property int currentRpm: 0
        property int maxSpeed: 180
        property int maxRpm: 15
        property int fuelLeds: 8
        property int currentFuels: 0
        property int maxFuels: 100
        property int percent: 0
        property real progress: 0.0 // Nilai progres (0 - 1)
        property int batteryLevel: 90 // Level baterai default




        // Aksi untuk tombol Home
        // buttonHome.onClicked: {
        //     mainScreen.color = "yellow"
        //     console.log("Changed Home Button")
        // }

        // Aksi untuk tombol Switch
        buttonSwitch.onClicked: {
            mainScreen.parking.color = "maroon"
            mainScreen.reverse.color = "blue"
            mainScreen.rectLeft.color = "#6ffff9"
            mainScreen.rectLamp1.color = "lightblue"
            mainScreen.rectLamp2.color = "yellow"
            mainScreen.rectRight.color = "green"
            console.log("Changed Switch Button")
        }

        // Function to update speed and trigger repaint
        function updateSpeed(newSpeed) {
        mainScreen.currentSpeed = newSpeed;
        speedText.text = newSpeed + "\n KM/H"; // Update speed text
        ledArc.requestPaint();  // Trigger the repaint of the Canvas (LED)
        }

        function updateRpm(newRpm) {
        mainScreen.currentRpm = newRpm;
        rpmText.text = newRpm + "\n RPMx1000"; // Update speed text
        rpmArc.requestPaint();  // Trigger the repaint of the Canvas (LED)
         }


        function updateFuels(newFuels) {
        mainScreen.fuelText.text= newFuels.toString() + " %";
        mainScreen.currentFuels = newFuels;
        }

        // Fungsi untuk memperbarui nilai progress dan teks persentase
        function updateProgress(newProgress) {
        mainScreen.progress = newProgress; // Perbarui nilai progres
        mainScreen.progressText.text = newProgress + " %"; // Perbarui teks
        }

        // Fungsi untuk memperbarui level baterai
        function updateBatteryLevel(newLevel) {
            mainScreen.batteryText.text = newLevel + " %";
            mainScreen.batteryLevel = Math.min(100, Math.max(0, newLevel)); // Batas 0-100
        }

    }

        // Logic for Canvas Painting (JavaScript block)
    function speedCanvas() {
        let ctx = mainScreen.ledArc.getContext("2d");
        ctx.clearRect(0, 0, mainScreen.ledArc.width, mainScreen.ledArc.height);

        let centerX = mainScreen.ledArc.width / 2;
        let centerY = mainScreen.ledArc.height;
        let radius = 180;

        let totalSegments = mainScreen.speedLeds; // Total LED segmen
        let activeSegments = Math.floor((mainScreen.currentSpeed / mainScreen.maxSpeed) * totalSegments);
        let segmentAngle = Math.PI / totalSegments;

        // Gambar segment LED
        for (let i = 0; i < totalSegments; i++) {
            let startAngle = Math.PI + i * segmentAngle;
            let endAngle = startAngle + segmentAngle * 0.8;

            // Tentukan apakah ini LED besar (kelipatan 10)
            let isMajorTick = i % 10 === 0;
            let currentRadius = isMajorTick ? radius + 15 : radius + 20;

            // Gambar LED
            ctx.beginPath();
            ctx.arc(centerX, centerY, currentRadius, startAngle, endAngle);
            ctx.strokeStyle = i < activeSegments ? "#00BFFF" : "#555555";
            ctx.lineWidth = isMajorTick ? 30 : 20; // Lebih tebal untuk kelipatan 10
            ctx.stroke();

            // Gambar angka hanya untuk kelipatan 10
            if (isMajorTick) {
                let angleMid = startAngle + (endAngle - startAngle) / 2;
                let textX = centerX + (radius - 10) * Math.cos(angleMid);
                let textY = centerY + (radius - 10) * Math.sin(angleMid);

                // Tampilkan teks angka (di bawah LED)
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
        let radius = 120;

        let totalSegments = mainScreen.rpmLeds; // Total rpm segmen
        let activeSegments = Math.floor((mainScreen.currentRpm / mainScreen.maxRpm) * totalSegments);
        let segmentAngle = Math.PI / totalSegments;

        // Gambar segment rpm
        for (let i = 0; i < totalSegments; i++) {
            let startAngle = Math.PI + i * segmentAngle;
            let endAngle = startAngle + segmentAngle * 0.8;

            // Tentukan apakah ini rpm besar (kelipatan 10)
            let isMajorTick = i % 10 === 0;
            let currentRadius = isMajorTick ? radius + 15 : radius + 20;

            // Gambar rpm
            ctx.beginPath();
            ctx.arc(centerX, centerY, currentRadius, startAngle, endAngle);
            ctx.strokeStyle = i < activeSegments ? "#00BFFF" : "#555555";
            ctx.lineWidth = isMajorTick ? 30 : 20; // Lebih tebal untuk kelipatan 10
            ctx.stroke();

            // Gambar angka hanya untuk kelipatan 10
            if (isMajorTick) {
                let angleMid = startAngle + (endAngle - startAngle) / 2;
                let textX = centerX + (radius - 10) * Math.cos(angleMid);
                let textY = centerY + (radius - 10) * Math.sin(angleMid);

                // Tampilkan teks angka (di bawah rpm)
                // ctx.font = "16px Arial";
                ctx.fillStyle = "#FFFFFF";
                ctx.textAlign = "center";
                ctx.textBaseline = "middle";
                ctx.fillText((i * mainScreen.maxRpm / totalSegments).toFixed(0), textX, textY);
            }
        }
    }




    // Timer untuk memperbarui progress secara otomatis
    Timer {
        interval: 500
        running: true
        repeat: true
        onTriggered: {
            // if (mainScreen.progress < 1.0) {
            //     let newProgress = mainScreen.progress + 0.05;
            //     mainScreen.updateProgress(newProgress);
            // } else {
            //     mainScreen.updateProgress(0); // Reset progres
            // }
                let newProgress = 80;
                mainScreen.updateProgress(newProgress);

            }
        }


    // Trigger painting after speed update
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            let newSpeed = Math.floor(Math.random() * mainScreen.maxSpeed);
            mainScreen.updateSpeed(newSpeed);
            speedCanvas();  // Update the Canvas display
            }
        }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            let newRpm = Math.floor(Math.random() * mainScreen.maxRpm);
            mainScreen.updateRpm(newRpm);
            rpmCanvas();  // Update the Canvas display
            }
        }


    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
                let newFuels = 80;
                mainScreen.updateFuels(newFuels);
                }
        }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
                let newLevel = Math.max(0, mainScreen.batteryLevel - Math.floor(Math.random() * 5));
                mainScreen.updateBatteryLevel(newLevel);
            }
        }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            mainScreen.timeText.text = Qt.formatTime(new Date(), "hh:mm:ss A");
            mainScreen.dayText.text = Qt.formatDate(new Date(), "dddd |");
            mainScreen.dateText.text = Qt.formatDate(new Date(), "MMMM d, yyyy");
        }
    }


    }
