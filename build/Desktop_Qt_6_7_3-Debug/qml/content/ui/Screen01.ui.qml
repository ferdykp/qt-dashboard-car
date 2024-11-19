

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
    property alias fuelText: fuelText
    property alias ledRow: ledRow
    property alias ledArc: ledArc
    property alias progressText: progressText
    property alias batteryText: batteryText
    property alias timeText: timeText
    property alias dayText: dayText
    property alias dateText: dateText

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
        id: frame
        width: 1280
        source: "../assets/frame.png"
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
            y: 151
            anchors.centerIn: parent
            anchors.horizontalCenter: parent.horizontalCenter
            // anchors.top: speedText.bottom
            z: 0
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 2
            anchors.topMargin: -107
            width: 460
            height: 250

            Text {
                id: speedText
                x: 219
                y: 156
                anchors.centerIn: parent
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: ledArc.bottom
                anchors.topMargin: 24
                text: "0"
                font.pixelSize: 30
                horizontalAlignment: Text.AlignHCenter
                anchors.verticalCenterOffset: 41
                anchors.horizontalCenterOffset: 1
                color: "#FFFFFF"
            }
        }

        Rectangle {
            id: status
            x: 405
            y: 531
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
            x: 359
            y: 599
            anchors.centerIn: parent
            width: 98
            height: 94
            radius: 47
            color: "#444"
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
                        radius: 10

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
            x: 130
            y: 380
            width: 150
            height: 87
            // anchors.top: ledArc.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#333333"
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
                       > 20 ? "#00FF00" : "#FF0000" // Hijau jika >20%, merah jika <=20%
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
        }

        Rectangle {
            id: indikator
            x: 390
            y: 60
            width: 500
            height: 80
            color: "#313237"
            radius: 20

            Rectangle {
                id: rectLamp1
                x: 160
                y: 11
                width: 70
                height: 55
                color: "#ffffff"
                radius: 15

                Image {
                    id: lamp1
                    x: 5
                    y: 8
                    width: 60
                    height: 40
                    source: "../assets/lamp1.png"
                    fillMode: Image.PreserveAspectFit
                }
            }

            Rectangle {
                id: rectLamp2
                x: 274
                y: 11
                width: 70
                height: 55
                color: "#ffffff"
                radius: 15

                Image {
                    id: lamp2
                    x: 5
                    y: 8
                    width: 60
                    height: 40
                    source: "../assets/lamp2.png"
                    fillMode: Image.PreserveAspectFit
                }
            }

            Rectangle {
                id: rectRight
                x: 398
                y: 11
                width: 70
                height: 55
                color: "#ffffff"
                radius: 15

                Image {
                    id: right1
                    x: 5
                    y: 8
                    width: 60
                    height: 40
                    source: "../assets/right.png"
                    fillMode: Image.PreserveAspectFit
                }
            }

            Rectangle {
                id: rectLeft
                x: 36
                y: 11
                width: 70
                height: 55
                color: "#ffffff"
                radius: 15

                Image {
                    id: left1
                    x: 5
                    y: 8
                    width: 60
                    height: 40
                    source: "../assets/left.png"
                    fillMode: Image.PreserveAspectFit
                }
            }
        }

        Rectangle {
            id: dateTimeContainer
            width: 500
            height: 57
            anchors.top: parent.top
            anchors.horizontalCenterOffset: 15
            anchors.topMargin: 159
            anchors.horizontalCenter: parent.horizontalCenter
            color: "transparent"

            Row {
                anchors.centerIn: parent
                spacing: 20

                // Waktu
                Text {
                    id: timeText
                    color: "#FFFFFF"
                    font.pixelSize: 20
                    text: Qt.formatTime(new Date(), "hh:mm:ss A")
                }

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
