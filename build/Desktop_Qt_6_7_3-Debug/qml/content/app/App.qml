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
        property int numLeds: 50
        property int currentSpeed: 0
        property int percent: 0
        property int maxSpeed: 180
        property real rotationSpeed: 0



        // Aksi untuk tombol Home
        buttonHome.onClicked: {
            mainScreen.color = "yellow"
            console.log("Changed Home Button")
        }

        // Aksi untuk tombol Switch
        buttonSwitch.onClicked: {
            mainScreen.parking.color = "maroon"
            mainScreen.reverse.color = "maroon"
            console.log("Changed Switch Button")
        }

        // Function to update speed and trigger repaint
                function updateSpeed(newSpeed) {
                    mainScreen.currentSpeed = newSpeed;
                    speedText.text = newSpeed + " MpH"; // Update speed text
                    ledArc.requestPaint();  // Trigger the repaint of the Canvas (LED)
                }
            }

            // Logic for Canvas Painting (JavaScript block)
            function updateCanvas() {
                let ctx = mainScreen.ledArc.getContext("2d");
                ctx.clearRect(0, 0, mainScreen.ledArc.width, mainScreen.ledArc.height);

                let centerX = mainScreen.ledArc.width / 2;
                let centerY = mainScreen.ledArc.height;
                let radius = 120;

                let totalSegments = mainScreen.numLeds;
                let activeSegments = Math.floor((mainScreen.currentSpeed / mainScreen.maxSpeed) * totalSegments);
                let segmentAngle = Math.PI / totalSegments;

                for (let i = 0; i < totalSegments; i++) {
                    let startAngle = Math.PI + i * segmentAngle;
                    let endAngle = startAngle + segmentAngle * 0.8;

                    ctx.beginPath();
                    ctx.arc(centerX, centerY, radius, startAngle, endAngle);
                    ctx.strokeStyle = i < activeSegments ? "#00BFFF" : "#555555";
                    ctx.lineWidth = 25;
                    ctx.stroke();
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
                    updateCanvas();  // Update the Canvas display
                }
            }

            Timer {
                interval: 100
                running: true
                repeat: true
                onTriggered: {
                    mainScreen.car.rotation += mainScreen.rotationSpeed / 10;
                }
            }
        }
