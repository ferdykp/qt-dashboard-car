

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
    id: screen01
    width: Constants.width
    height: Constants.height
    color: "#1d1b1b"

    property alias switchScreenButton: switchScreenButton
    property alias buttonSwitch: buttonSwitch
    property alias parking: parking
    property alias reverse: reverse
    property alias netral: netral
    property alias push: push
    property alias rectLeft: rectLeft
    property alias rectLamp1: rectLamp1
    property alias rectLamp2: rectLamp2
    property alias rectRight: rectRight
    property alias rectMode: rectMode
    property alias textEco: textEco
    property alias speedText: speedText
    property alias ledArc: ledArc
    property alias rpmText: rpmText
    property alias rpmArc: rpmArc
    property alias healthText: healthText
    property alias healthArc: healthArc
    property alias circleText: circleText
    property alias circleArc: circleArc
    property alias tempText: tempText
    property alias tempArc: tempArc
    property alias chargeText: chargeText
    property alias chargeArc: chargeArc
    // property alias rectIndicator: rectIndicator
    // property alias textIndicator: textIndicator
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

    Image {
        id: framehole
        x: 0
        y: 0
        width: 1280
        height: 800
        source: "../assets/framehole.png"
        fillMode: Image.PreserveAspectFit

        Button {
            id: buttonSwitch
            x: 95
            y: 587

            text: qsTr("Switch Mode")
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
            anchors.verticalCenterOffset: -191
            anchors.horizontalCenterOffset: -296
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
                font.pixelSize: 15
                horizontalAlignment: Text.AlignHCenter
                font.family: "Arial"
                anchors.verticalCenterOffset: 1
                anchors.horizontalCenterOffset: 0
                color: "#FFFFFF"
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
            anchors.verticalCenterOffset: -191
            anchors.horizontalCenterOffset: 311
            anchors.topMargin: -107
            width: 120
            height: 120

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

        Canvas {
            id: healthArc
            x: 412
            y: 275
            anchors.centerIn: parent
            anchors.horizontalCenter: parent.horizontalCenter
            // anchors.top: speedText.bottom
            z: 0
            anchors.verticalCenterOffset: 312
            anchors.horizontalCenterOffset: 250
            anchors.topMargin: -107
            width: 120
            height: 120

            Text {
                id: healthText
                x: 219
                y: 156
                anchors.centerIn: parent
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: healthArc.center
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

        Canvas {
            id: chargeArc
            x: 412
            y: 275
            anchors.centerIn: parent
            anchors.horizontalCenter: parent.horizontalCenter
            z: 0
            anchors.verticalCenterOffset: 312
            anchors.horizontalCenterOffset: -253
            anchors.topMargin: -107
            width: 120
            height: 120

            Text {
                id: chargeText
                x: 219
                y: 156
                anchors.centerIn: parent
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: chargeArc.center
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
            id: batteryIndicator
            x: 129
            y: 659
            width: 220
            height: 87
            // anchors.top: ledArc.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#1C3E4B"
            radius: 8
            // border.color: "#FFFFFF"
            // border.width: 1
            anchors.horizontalCenterOffset: 15

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

                // color: mainScreen.batteryLevel > 20 ? "#44e6f8" : "#1c3e4b"
                gradient: Gradient {
                    GradientStop {
                        position: 0.0
                        color: mainScreen.batteryLevel > 20 ? "#264653" // (jika > 20%)
                                                            : "#ea441d" // (jika <= 20%)
                    }
                    GradientStop {
                        position: 1.0
                        color: mainScreen.batteryLevel > 20 ? "#3299c2" // Warna gelap transparan
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
                font.pixelSize: 25
                font.bold: true
            }

            Text {
                id: energyText
                width: 150
                height: 51
                anchors.centerIn: parent
                color: "#FFFFFF"
                // text: mainScreen.batteryLevel + " %"
                text: "Battery Energy"
                font.pixelSize: 18
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WrapAnywhere
                anchors.verticalCenterOffset: 64
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

        Rectangle {
            id: rectMode
            x: 171
            y: 344
            width: 165
            height: 159
            color: "#000000"
            radius: 68
            border.color: "#00FF7F"
            border.width: 10

            Text {
                id: textEco
                x: 51
                y: 56
                width: 64
                height: 48
                color: "#ffffff"
                text: mainScreen.currentMode // Referensi ke properti/variabel
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }

    Button {
        id: switchScreenButton
        x: 96
        y: 676
        text: "Go to Screen 02"
    }
}
