

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.5
import QtQuick.Controls 6.5
import QtQuick.Shapes 1.15
import Dashboard1

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height
    color: "#1d1b1b"

    property alias buttonSwitch: buttonSwitch
    property alias parking: parking
    property alias reverse: reverse
    property alias rectLeft: rectLeft
    property alias rectLamp1: rectLamp1
    property alias rectLamp2: rectLamp2
    property alias rectRight: rectRight
    property alias speedText: speedText
    property alias rpmText: rpmText
    property alias fuelText: fuelText
    property alias circleText: circleText
    property alias ledRow: ledRow
    property alias ledArc: ledArc
    property alias rpmArc: rpmArc
    property alias circleArc: circleArc
    property alias progressText: progressText
    property alias batteryText: batteryText
    property alias timeText: timeText
    property alias dayText: dayText
    property alias dateText: dateText

    Rectangle {
        id: rectRight
        x: 824
        y: 30
        width: 70
        height: 55
        color: "#302e2e"
        radius: 15
    }

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

    Text {
        id: label
        text: qsTr("Hello Dashboard")
        font.family: Constants.font.family
        anchors.topMargin: 45
        anchors.horizontalCenter: parent.horizontalCenter

        SequentialAnimation {
            id: animation

            ColorAnimation {
                id: colorAnimation1
                target: rectangle
                property: "color"
                to: "#2294c6"
                from: Constants.backgroundColor
            }

            ColorAnimation {
                id: colorAnimation2
                target: rectangle
                property: "color"
                to: Constants.backgroundColor
                from: "#2294c6"
            }
        }
    }

    Image {
        id: framehole
        x: 0
        y: 0
        width: 1280
        source: "../assets/framehole.png"
        fillMode: Image.PreserveAspectFit

        Button {
            id: buttonSwitch
            x: 972
            y: 727
            text: qsTr("Button")
        }

        Canvas {
            id: ledArc
            x: 412
            y: 275
            anchors.centerIn: parent
            anchors.horizontalCenter: parent.horizontalCenter
            // anchors.top: speedText.bottom
            z: 0
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.topMargin: -107
            width: 460
            height: 286

            Text {
                id: speedText
                x: 221.925
                y: 156
                width: 17.15
                anchors.centerIn: parent
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: ledArc.bottom
                anchors.topMargin: 56
                text: "0"
                font.pixelSize: 30
                horizontalAlignment: Text.AlignHCenter
                anchors.verticalCenterOffset: 73
                anchors.horizontalCenterOffset: 1
                color: "#FFFFFF"
            }

            Image {
                id: linecar
                x: 211
                y: 261
                width: 39
                height: 25
                source: "../assets/linecar.png"
                fillMode: Image.PreserveAspectFit
            }

            Image {
                id: dash180
                x: 0
                y: 21
                width: 460
                height: 300
                source: "../assets/dash180.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        Canvas {
            id: rpmArc
            x: 412
            y: 275
            anchors.centerIn: parent
            anchors.horizontalCenter: parent.horizontalCenter
            // anchors.top: speedText.bottom
            z: 0
            anchors.verticalCenterOffset: 24
            anchors.horizontalCenterOffset: 433
            anchors.topMargin: -107
            width: 363
            height: 225

            Text {
                id: rpmText
                x: 219
                y: 156
                anchors.centerIn: parent
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: rpmArc.bottom
                anchors.topMargin: 37
                text: "0"
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                font.family: "Arial"
                anchors.verticalCenterOffset: 54
                anchors.horizontalCenterOffset: -2
                color: "#FFFFFF"
            }

            Image {
                id: rpm180
                x: -12
                y: 78
                width: 386
                height: 150
                source: "../assets/rpm180.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        Canvas {
            id: circleArc
            x: 412
            y: 275
            anchors.centerIn: parent
            anchors.horizontalCenter: parent.horizontalCenter
            // anchors.top: speedText.bottom
            z: 0
            anchors.verticalCenterOffset: -150
            anchors.horizontalCenterOffset: -312
            anchors.topMargin: -107
            width: 120
            height: 120

            Text {
                id: circleText
                x: 219
                y: 156
                anchors.centerIn: parent
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: circleArc.center
                anchors.topMargin: 37
                text: "0"
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                font.family: "Arial"
                anchors.verticalCenterOffset: 3
                anchors.horizontalCenterOffset: 1
                color: "#FFFFFF"
            }
        }

        Rectangle {
            id: status
            x: 405
            y: 546
            width: 470
            height: 65
            color: "#313237"
            radius: 20

            Rectangle {
                id: parking
                x: 36
                y: 11
                width: 71
                height: 46
                color: "#313237"
                radius: 15

                Text {
                    id: indparking
                    x: 29
                    y: 9
                    color: "#ffffff"
                    text: qsTr("P")
                    font.pixelSize: 21
                }
            }

            Rectangle {
                id: reverse
                x: 149
                y: 11
                width: 71
                height: 46
                color: "#313237"
                radius: 15

                Text {
                    id: indreverse
                    x: 29
                    y: 9
                    color: "#ffffff"
                    text: qsTr("R")
                    font.pixelSize: 21
                }
            }

            Rectangle {
                id: netral
                x: 265
                y: 11
                width: 71
                height: 46
                color: "#313237"
                radius: 15

                Text {
                    id: indnetral
                    x: 28
                    y: 9
                    color: "#ffffff"
                    text: qsTr("N")
                    font.pixelSize: 21
                }
            }

            Rectangle {
                id: push
                x: 369
                y: 11
                width: 71
                height: 46
                color: "#313237"
                radius: 15

                Text {
                    id: indpush
                    x: 28
                    y: 9
                    color: "#ffffff"
                    text: qsTr("D")
                    font.pixelSize: 21
                }
            }
        }

        Rectangle {
            id: roundedRect
            x: 322
            y: 652
            anchors.centerIn: parent
            width: 98
            height: 94
            radius: 47
            color: "#111010"
            border.color: "#6ffff9"
            border.width: 2
            anchors.verticalCenterOffset: 299
            anchors.horizontalCenterOffset: -269

            Text {
                id: progressText
                anchors.centerIn: parent
                text: "0"
                font.pixelSize: 24
                color: "#FFFFFF"
            }
        }

        Rectangle {
            id: rectFuel
            x: 442
            y: 659
            width: 377
            height: 141
            color: "#111010"
            radius: 15
            border.color: "#111010"
            border.width: 2

            Text {
                id: fuelText
                x: 248
                y: -6
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 8
                color: "#ffffff"
                text: "0"
                font.pixelSize: 40
                anchors.horizontalCenterOffset: 91
            }

            Row {
                id: ledRow
                x: 37
                y: 72
                width: 291
                height: 63
                anchors.horizontalCenter: parent.horizontalCenter
                // anchors.top: speedText.bottom
                anchors.horizontalCenterOffset: 0
                anchors.topMargin: 202
                spacing: 5

                Repeater {
                    model: rectangle.fuelLeds
                    Rectangle {
                        width: 30
                        height: 50
                        radius: 5

                        // color: Qt.rgba(1 - index / rectangle.numLeds, index / rectangle.numLeds, 0, 1)
                        color: "#00BFFF"
                        opacity: index < Math.floor(
                                     (rectangle.currentFuels / 100) * rectangle.fuelLeds) ? 1 : 0.3
                    }
                }
            }

            Image {
                id: fuel
                x: 52
                y: 11
                source: "../assets/fuel.png"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: text1
                x: 117
                y: 7
                width: 112
                height: 57
                color: "#ffffff"
                text: qsTr("Remaining Fuel")
                elide: Text.ElideNone
                font.pixelSize: 20
                wrapMode: Text.WrapAnywhere
                textFormat: Text.RichText
                fontSizeMode: Text.Fit
                styleColor: "#ffffff"
            }
        }

        Rectangle {
            id: batteryIndicator
            x: 129
            y: 380
            width: 150
            height: 87
            // anchors.top: ledArc.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#111010"
            radius: 8
            border.color: "#FFFFFF"
            border.width: 2
            anchors.horizontalCenterOffset: -436

            // Level baterai
            Rectangle {
                id: batteryLevel
                width: Math.max(
                           0,
                           batteryIndicator.width * mainScreen.batteryLevel / 100)
                height: parent.height - 10
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 5
                radius: 5
                color: mainScreen.batteryLevel
                       > 20 ? "#44e6f8" : "#1c3e4b" // Hijau jika >20%, merah jika <=20%
            }

            // Persentase baterai
            Text {
                id: batteryText
                anchors.centerIn: parent
                color: "#FFFFFF"
                // text: mainScreen.batteryLevel + " %"
                text: "0"
                font.pixelSize: 25
                font.bold: true
            }

            Text {
                id: energyText
                anchors.centerIn: parent
                color: "#FFFFFF"
                // text: mainScreen.batteryLevel + " %"
                text: "Battery Energy"
                font.pixelSize: 15
                anchors.verticalCenterOffset: 63
                anchors.horizontalCenterOffset: 0
                font.bold: false
            }
        }

        Rectangle {
            id: dateTimeContainer
            x: 405
            y: 159
            width: 500
            height: 100
            anchors.top: parent.top
            anchors.horizontalCenterOffset: 15
            anchors.topMargin: 159
            anchors.horizontalCenter: parent.horizontalCenter
            color: "transparent"

            Column {
                anchors.centerIn: parent
                spacing: 5 // Jarak antara elemen di dalam kolom

                // Waktu
                Text {
                    id: timeText
                    color: "#FFFFFF"
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter // Ukuran font lebih besar untuk waktu
                    text: Qt.formatTime(new Date(), "hh:mm:ss A")
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
    }

    states: [
        State {
            name: "clicked"

            PropertyChanges {
                target: label
                text: qsTr("Button Checked")
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0}D{i:6;locked:true}
}
##^##*/

