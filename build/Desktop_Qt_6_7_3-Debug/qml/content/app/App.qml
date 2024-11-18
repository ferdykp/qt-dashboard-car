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
        property int speedLeds: 91
        property int currentSpeed: 0
        property int fuelLeds: 8
        property int currentFuels: 0
        property int maxFuels: 100
        property int percent: 0
        property int maxSpeed: 180
        property real progress: 0.0 // Nilai progres (0 - 1)



        // Aksi untuk tombol Home
        // buttonHome.onClicked: {
        //     mainScreen.color = "yellow"
        //     console.log("Changed Home Button")
        // }

        // Aksi untuk tombol Switch
        buttonSwitch.onClicked: {
            mainScreen.parking.color = "maroon"
            mainScreen.reverse.color = "blue"
            console.log("Changed Switch Button")
        }

        // Function to update speed and trigger repaint
                function updateSpeed(newSpeed) {
                    mainScreen.currentSpeed = newSpeed;
                    speedText.text = newSpeed + "\n KM/H"; // Update speed text
                    ledArc.requestPaint();  // Trigger the repaint of the Canvas (LED)
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
            }

            // Logic for Canvas Painting (JavaScript block)
            function speedCanvas() {
                let ctx = mainScreen.ledArc.getContext("2d");
                ctx.clearRect(0, 0, mainScreen.ledArc.width, mainScreen.ledArc.height);
                ctx.lineWidth = 5; // Lebar border

                let centerX = mainScreen.ledArc.width / 2;
                let centerY = mainScreen.ledArc.height;
                let radius = 180;

                let totalSegments = mainScreen.speedLeds;
                let activeSegments = Math.floor((mainScreen.currentSpeed / mainScreen.maxSpeed) * totalSegments);
                let segmentAngle = Math.PI / totalSegments;

                for (let i = 0; i < totalSegments; i++) {
                    let startAngle = Math.PI + i * segmentAngle;
                    let endAngle = startAngle + segmentAngle * 0.8;

                    // Tentukan panjang LED berdasarkan apakah kelipatan 5
                    let lineWidth = i % 5 === 0 ? 70 : 50; // LED pada kelipatan 5 lebih panjang

                    ctx.beginPath();
                    ctx.arc(centerX, centerY, radius, startAngle, endAngle);
                    ctx.strokeStyle = i < activeSegments ? "#00BFFF" : "#555555";
                    ctx.lineWidth = lineWidth;
                    ctx.stroke();
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
                    let newFuels = 80;
                    mainScreen.updateFuels(newFuels);
                }
            }

        }
