

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
    property alias rectangle3: rectangle3
    property alias speedText: speedText
    property alias fuelText: fuelText
    property alias ledRow: ledRow
    property alias ledArc: ledArc
    property alias progressText: progressText

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

    Rectangle {
        id: rectangle3
        x: 39
        y: 67
        width: 1203
        height: 620
        color: "#484343"
        radius: 10
        enabled: false

        // Tampilan teks untuk nilai speed
        Text {
            id: fuelText
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 495
            color: "#ffffff"
            text: "0"
            font.pixelSize: 40
            anchors.horizontalCenterOffset: 75
        }

        // LED Progress Bar dengan Rectangle sebagai segmen LED
        Row {
            id: ledRow
            width: 291
            height: 63
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: speedText.bottom
            anchors.horizontalCenterOffset: -1
            anchors.topMargin: 202
            spacing: 5

            Repeater {
                model: rectangle.fuelLeds
                Rectangle {
                    width: 40
                    height: 50
                    radius: 10

                    // Warna dan opasitas LED berubah sesuai nilai speed
                    // color: Qt.rgba(1 - index / rectangle.numLeds, index / rectangle.numLeds, 0, 1)
                    color: "#00BFFF"
                    opacity: index < Math.floor(
                                 (rectangle.currentFuels / 180) * rectangle.fuelLeds) ? 1 : 0.3
                }
            }
        }

        // Canvas for LED Arc (Only declaration, no logic here)
        Canvas {
            id: ledArc
            y: 47
            anchors.centerIn: parent
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: speedText.bottom
            z: 0
            anchors.verticalCenterOffset: -35
            anchors.horizontalCenterOffset: 0
            anchors.topMargin: -41
            width: 455
            height: 250
        }

        // Speed Text Display
        Text {
            id: speedText
            y: 263
            anchors.centerIn: parent
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: ledArc.bottom
            anchors.topMargin: 0
            // text: mainScreen.currentSpeed + " MpH"
            text: "0"
            font.pixelSize: 30
            anchors.verticalCenterOffset: 17
            anchors.horizontalCenterOffset: 0
            color: "#FFFFFF"
        }

        Rectangle {
            id: indikator
            x: 371
            y: 413
            width: 460
            height: 65
            color: "#313237"
            radius: 20

            Rectangle {
                id: parking
                x: 34
                y: 8
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
                x: 142
                y: 8
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
                x: 250
                y: 8
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
                x: 358
                y: 8
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
            anchors.centerIn: parent
            width: 78
            height: 80
            radius: 20
            color: "#444"
            border.color: "#666"
            border.width: 2
            anchors.verticalCenterOffset: 262
            anchors.horizontalCenterOffset: -243

            // Teks untuk menampilkan persentase progres
            Text {
                id: progressText
                anchors.centerIn: parent
                // text: mainScreen.percentage + " %"
                text: "0"
                font.pixelSize: 24
                color: "#FFFFFF"
            }
        }
    }

    Button {
        id: buttonSwitch
        x: 972
        y: 727
        text: qsTr("Button")
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
