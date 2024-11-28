// App.qml
import QtQuick 6.5
// import Dashboard1
import "../ui"
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtLocation 5.15
import QtPositioning 5.15


Screen02 {
    // Properti yang mewakili data untuk antarmuka
        property int tempLeds : 100
        property int currentTemp : 0
        property int maxTemp : 100
        property int batteryLevel: 90 // Level baterai default


    Loader {
        id: pageLoader
        anchors.fill: parent
    }

    function switchScreen() {
            pageLoader.source = "qrc:/content/app/App.qml";
        }

    switchScreenButton.onClicked: {
        console.log("Main Screen ")
        switchScreen();
    }


        function updateBatteryLevel(newLevel) {
            batteryText.text = newLevel + " %";
            batteryLevel = Math.min(100, Math.max(0, newLevel));
        }

        function updateTemp(newTemp) {
            currentTemp = newTemp;
            tempText.text = newTemp + "°C \nTemp";
            tempArc.requestPaint();
        }


    function tempCanvas() {
            let ctx = tempArc.getContext("2d");
            ctx.clearRect(0, 0, tempArc.width, tempArc.height);

            let centerX = tempArc.width / 2;
            let centerY = tempArc.height / 2;
            let radius = 50;

            let totalSegments = tempLeds;
            let activeSegments = Math.floor((currentTemp / maxTemp) * totalSegments);
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

    Rectangle {
        id: mapContainer
        width: 500
        anchors.centerIn: parent
        // 80% dari lebar layar
        height: parent.height * 0.8 // 80% dari tinggi layar
        border.color: "white"
        border.width: 2
        anchors.verticalCenterOffset: 54
        anchors.horizontalCenterOffset: 366
        radius: 10 // Sudut melengkung
        clip: true // Memastikan peta tidak melebihi Rectangle


        Map {
            id: mapView
            anchors.fill: parent
            plugin: osmPlugin
            center: QtPositioning.coordinate(-7.5010847, 112.4722475) // Koordinat default
            zoomLevel: 12

            // Area Mouse untuk panning dan zoom
            MouseArea {
                id: dragArea
                anchors.fill: parent
                property real startLat
                property real startLon
                property real startX
                property real startY

                // Zoom menggunakan roda scroll mouse
                onWheel: function(wheel) {
                    if (wheel.angleDelta.y > 0) {
                        mapView.zoomLevel += 1; // Zoom in
                    } else {
                        mapView.zoomLevel -= 1; // Zoom out
                    }
                }

                // Simpan posisi awal saat mouse ditekan
                onPressed: function(mouse) {
                    startLat = mapView.center.latitude
                    startLon = mapView.center.longitude
                    startX = mouse.x
                    startY = mouse.y
                }

                // Panning menggunakan drag
                onPositionChanged: function(mouse) {
                    if (mouse.buttons & Qt.LeftButton) {  // Jika mouse ditahan
                        let dx = (mouse.x - startX) / 10000;
                        let dy = (mouse.y - startY) / 10000;

                        mapView.center.latitude = startLat - dy;
                        mapView.center.longitude = startLon - dx;
                    }
                }
            }

            // Marker pada peta
            MapQuickItem {
                coordinate: QtPositioning.coordinate(-7.5010847, 112.4722475)
                anchorPoint.x: imageMarker.width / 2
                anchorPoint.y: imageMarker.height
                sourceItem: Image {
                    id: imageMarker
                    source: "../assets/marker.png" // Marker gambar
                    width: 32
                    height: 32
                }
            }
        }
    }

    Plugin {
        id: osmPlugin
        name: "osm"
        PluginParameter {
            name: "osm.mapping.providersrepository.address"
            value: "https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/"
        }
        PluginParameter {
            name: "osm.mapping.highdpi_tiles"
            value: true
        }
    }


    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
                let newTemp = Math.floor(0.22 * maxTemp);
                updateTemp(newTemp);
                tempCanvas();

            }
        }


    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
                let newLevel = Math.max(0, batteryLevel - Math.floor(Math.random() * 5));
                updateBatteryLevel(newLevel);
            }
        }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            timeText.text = Qt.formatTime(new Date(), "\thh:mm");
            dayText.text = Qt.formatDate(new Date(), "dddd |");
            dateText.text = Qt.formatDate(new Date(), "MMMM d, yyyy");
        }
    }
}
