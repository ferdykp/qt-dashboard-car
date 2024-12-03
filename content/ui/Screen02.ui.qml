

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.5
import QtQuick.Controls 6.5
import QtQuick.Shapes 1.15
import QtQuick.Layouts 1.15
import Dashboard1

Rectangle {
    id: screen02
    width: Constants.width
    height: Constants.height
    color: "red"

    property alias rectLeft: rectLeft
    property alias rectLamp1: rectLamp1
    property alias rectLamp2: rectLamp2
    property alias rectRight: rectRight
    property alias tempText: tempText
    property alias tempArc: tempArc
    property alias batteryLevel: batteryLevel
    property alias batteryText: batteryText
    property alias switchScreenButton: switchScreenButton
    property alias timeText: timeText
    property alias dayText: dayText
    property alias dateText: dateText

    Rectangle {
        id: rectLamp2
        x: 671
        y: 30
        width: 70
        height: 55
        color: "#302e2e"
        radius: 15
    }

    Rectangle {
        id: rectLamp1
        x: 534
        y: 30
        width: 70
        height: 55
        color: "#302e2e"
        radius: 15
    }

    Rectangle {
        id: rectLeft
        x: 384
        y: 30
        width: 70
        height: 55
        color: "#302e2e"
        radius: 15
    }
    Rectangle {
        id: rectRight
        x: 824
        y: 30
        width: 70
        height: 55
        color: "#302e2e"
        radius: 15
    }
    Image {
        id: framemaps
        x: 0
        y: 0
        width: 1280
        height: 800
        source: "../assets/framemaps.png"
        fillMode: Image.PreserveAspectFit

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
        }

        Rectangle {
            id: rectCam
            width: 400
            height: 200
            anchors.centerIn: parent
            // 80% dari lebar layar
            // 80% dari tinggi layar
            border.color: "white"
            border.width: 2
            anchors.verticalCenterOffset: -169
            anchors.horizontalCenterOffset: 0
            radius: 10 // Sudut melengkung
            clip: true // Memastikan peta tidak melebihi Rectangle
        }

        Rectangle {
            id: dateTimeContainer
            x: 405
            y: 159
            width: 295
            height: 100
            anchors.top: parent.top
            anchors.horizontalCenterOffset: -484
            anchors.topMargin: 8
            anchors.horizontalCenter: parent.horizontalCenter
            color: "transparent"

            Column {
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 1
                anchors.centerIn: parent
                spacing: 5 // Jarak antara elemen di dalam kolom

                // Waktu
                Text {
                    id: timeText
                    color: "#FFFFFF"
                    text: "03:48:00 PM"
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter // Ukuran font lebih besar untuk waktu
                }

                Row {
                    anchors.horizontalCenter: parent.horizontalCenter // Pusatkan Row di kolom
                    spacing: 10 // Jarak antara hari dan tanggal

                    // Hari
                    Text {
                        id: dayText
                        color: "#FFFFFF"
                        font.pixelSize: 20
                        text: Qt.formatDate(new Date(), "dddd")
                    }

                    // Tanggal
                    Text {
                        id: dateText
                        color: "#FFFFFF"
                        font.pixelSize: 20
                        text: Qt.formatDate(new Date(), "MMMM d, yyyy")
                    }
                }
            }
        }

        Canvas {
            id: tempArc
            x: 412
            y: 275
            anchors.centerIn: parent
            anchors.horizontalCenter: parent.horizontalCenter
            // anchors.top: speedText.bottom
            z: 0
            anchors.verticalCenterOffset: -342
            anchors.horizontalCenterOffset: 426
            anchors.topMargin: -107
            width: 57
            height: 58

            Text {
                id: tempText
                x: 219
                y: 156
                anchors.centerIn: parent
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: tempArc.center
                anchors.topMargin: 37
                text: "0"
                font.pixelSize: 15
                horizontalAlignment: Text.AlignHCenter
                font.family: "Arial"
                anchors.verticalCenterOffset: 1
                anchors.horizontalCenterOffset: 0
                color: "#FFFFFF"
            }
        }

        Rectangle {
            id: batteryIndicator
            x: 129
            y: 41
            width: 89
            height: 34
            // anchors.top: ledArc.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#1C3E4B"
            radius: 8
            // border.color: "#FFFFFF"
            // border.width: 1
            anchors.horizontalCenterOffset: 572

            // Level baterai
            Rectangle {
                id: batteryLevel
                width: Math.max(0, batteryIndicator.width * batteryLevel / 100)
                height: parent.height - 10
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 5
                radius: 5

                // color: mainScreen.batteryLevel > 20 ? "#44e6f8" : "#1c3e4b"
                gradient: Gradient {
                    GradientStop {
                        position: 0.0
                        color: batteryLevel > 20 ? "#264653" // (jika > 20%)
                                                 : "#ea441d" // (jika <= 20%)
                    }
                    GradientStop {
                        position: 1.0
                        color: batteryLevel > 20 ? "#3299c2" // Warna gelap transparan
                                                 : "#170804" // Merah gelap transparan
                    }
                }
            }

            // Persentase baterai
            Text {
                id: batteryText
                anchors.centerIn: parent
                color: "#FFFFFF"
                // text: mainScreen.batteryLevel + " %"
                text: "0"
                font.pixelSize: 15
                anchors.verticalCenterOffset: 1
                anchors.horizontalCenterOffset: -64
                font.bold: true
            }

            // Memuat ScreenMaps.qml untuk menampilkan peta
        }

        Button {
            id: switchScreenButton
            y: 81
            text: "Go to Screen 02"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.horizontalCenterOffset: 341
            anchors.bottomMargin: 679
        }

        // Container Rectangle untuk peta
    }
}
