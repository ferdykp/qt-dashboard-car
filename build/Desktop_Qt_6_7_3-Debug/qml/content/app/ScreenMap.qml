import "../ui"
import QtQuick
import QtQuick.Controls
import QtLocation
import QtPositioning
import QtMultimedia


Screen02 {
    // Properti yang mewakili data untuk antarmuka
        property int tempLeds : 100
        property int currentTemp : 0
        property int maxTemp : 100
        property int batteryLevel: 90 // Level baterai default
        property int currScreenNumber: 2


    // Properti lokasi awal dan tujuan
    property var startLocation: QtPositioning.coordinate(-7.5010847, 112.4722475)
    property var destinationLocation: QtPositioning.coordinate(-7.4974349, 112.4612324)




    switchScreenButton.onClicked: {
        console.log("back")
        switchScreen(1); // Pindah ke Screen02
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
        width: 1200
        height: 660
        border.color: "white"
        border.width: 2
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 57
        anchors.horizontalCenterOffset: 0
        radius: 10
        clip: true

        Map {
            id: mapView
            anchors.fill: mapContainer
            plugin: osmPlugin
            center: startLocation  // Start with the center of the map at the start location
            zoomLevel: 14

            // Marker for the starting location
            MapQuickItem {
                coordinate: startLocation
                anchorPoint.x: imageMarker.width / 2
                anchorPoint.y: imageMarker.height
                sourceItem: Image {
                    id: imageMarker
                    source: "../assets/marker.png"
                    width: 32
                    height: 32
                }
            }

            // Marker for the destination location
            MapQuickItem {
                coordinate: destinationLocation
                anchorPoint.x: destinationMarker.width / 2
                anchorPoint.y: destinationMarker.height
                sourceItem: Image {
                    id: destinationMarker
                    source: "../assets/marker.png"
                    width: 32
                    height: 32
                }
            }

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

            // Route path between start and destination
            MapPolyline {
                id: routePolyline
                line.width: 4
                line.color: "blue"
                path: []  // Will be updated with the route geometry
            }
        }

        // Fungsi untuk mendapatkan rute
        function getRoute(start, destination) {
            var url = "https://api.openrouteservice.org/v2/directions/driving-car";
            var key = "5b3ce3597851110001cf62483805d98b7a1947ea80bcab8c705fe68c";  // Ganti dengan API Key Anda
            var request = new XMLHttpRequest();
            request.open("POST", url, true);
            request.setRequestHeader("Authorization", key);
            request.setRequestHeader("Content-Type", "application/json");

            var data = JSON.stringify({
                "coordinates": [
                    [start.longitude, start.latitude],  // Koordinat awal
                    [destination.longitude, destination.latitude]  // Koordinat tujuan
                ]
            });

            request.onreadystatechange = function() {
                if (request.readyState == 4) {
                    // console.log("Status Code: ", request.status);
                    // console.log("Response Text: ", request.responseText);
                    if (request.status == 200) {
                        var response = JSON.parse(request.responseText);
                        // console.log("Response JSON: ", JSON.stringify(response, null, 2));
                        if (response.routes && response.routes.length > 0) {
                            var encodedGeometry = response.routes[0].geometry;
                            if (encodedGeometry) {
                                var decodedPath = decodePolyline(encodedGeometry);
                                // console.log("Response JSON: ", JSON.stringify(decodedPath, null, 2));
                                updateRoute(decodedPath);
                            } else {
                                console.error("No geometry found in response!");
                            }
                        } else {
                            console.error("No routes found in response!");
                        }
                    } else {
                        console.error("Failed to fetch route: " + request.statusText);
                    }
                }
            };

            request.send(data);
        }

        // Fungsi untuk mendekode polyline
        function decodePolyline(encoded) {
            let points = [];
            let index = 0, len = encoded.length;
            let lat = 0, lng = 0;

            while (index < len) {
                let b, shift = 0, result = 0;
                do {
                    b = encoded.charCodeAt(index++) - 63;
                    result |= (b & 0x1f) << shift;
                    shift += 5;
                } while (b >= 0x20);
                let dlat = (result & 1) ? ~(result >> 1) : (result >> 1);
                lat += dlat;

                shift = 0;
                result = 0;
                do {
                    b = encoded.charCodeAt(index++) - 63;
                    result |= (b & 0x1f) << shift;
                    shift += 5;
                } while (b >= 0x20);
                let dlng = (result & 1) ? ~(result >> 1) : (result >> 1);
                lng += dlng;

                points.push([lat / 1E5, lng / 1E5]);
            }

            return points;
        }

        // Fungsi untuk memperbarui rute pada peta
        function updateRoute(decodedPath) {
            if (!decodedPath || decodedPath.length === 0) {
                console.error("Invalid decoded path!");
                return;
            }

            var path = [];
            for (var i = 0; i < decodedPath.length; i++) {
                var coord = decodedPath[i];
                var lat = coord[0];  // Latitude
                var lon = coord[1];  // Longitude
                path.push(QtPositioning.coordinate(lat, lon));  // Buat koordinat
            }
            routePolyline.path = path;  // Tetapkan path ke polyline
        }

        // Panggil API saat aplikasi dimulai
        Component.onCompleted: {
            getRoute(startLocation, destinationLocation);
        }
    }

    // OpenStreetMap plugin configuration
    Plugin {
        id: osmPlugin
        name: "osm"
        PluginParameter {
            name: "osm.mapping.providersrepository.address"
            value: "https://openstreetmap.org/"
        }
        PluginParameter {
            name: "osm.mapping.highdpi_tiles"
            value: true
        }
    }


    Rectangle {
        id: cameraContainer
        width: 400
        height: 220
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -160
        anchors.horizontalCenterOffset: 0
        border.color: "white"
        border.width: 2
        radius: 10 // Sudut melengkung
        clip: true // Membatasi tampilan video pada Rectangle
        color: "black" // Warna latar belakang jika kamera belum aktif


        // VideoOutput untuk menampilkan kamera
        VideoOutput {
            id: videoOutput
            anchors.fill: parent
            visible: videoCamera.status === Camera.ActiveStatus // Tampil hanya jika kamera aktif
            fillMode: VideoOutput.Stretch // Memaksa video mengisi penuh Rectangle
        }

        // CaptureSession untuk streaming kamera
        CaptureSession {
            id: captureSession
            camera: videoCamera
            videoOutput: videoOutput
        }

        // Kamera
        Camera {
            id: videoCamera
            Component.onCompleted: {
                console.log("Starting camera automatically...");
                start(); // Memulai kamera otomatis
            }
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
