

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

    property alias buttonHome: buttonHome
    property alias buttonSwitch: buttonSwitch
    property alias parking: parking
    property alias reverse: reverse
    property alias rectangle3: rectangle3
    property alias speedText: speedText
    property alias ledArc: ledArc
    property alias car:car

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
        id: rectangle1
        x: 8
        y: 75
        width: 415
        height: 620
        color: "#4b4747"
        radius: 10
        border.width: 1
    }

    Rectangle {
        id: rectangle2
        x: 433
        y: 75
        width: 415
        height: 200
        color: "#4b4747"
        radius: 10
    }

    Rectangle {
        id: rectangle3
        x: 857
        y: 75
        width: 415
        height: 620
        color: "#484343"
        radius: 10
        enabled: false

        // Tampilan teks untuk nilai speed
        // Text {
        //     id: speedText
        //     anchors.horizontalCenter: parent.horizontalCenter
        //     anchors.top: parent.top
        //     anchors.topMargin: 427
        //     color: "#ffffff"
        //     text: "0"
        //     font.pixelSize: 40
        //     anchors.horizontalCenterOffset: -1
        // }

        // LED Progress Bar dengan Rectangle sebagai segmen LED
        // Row {
        //     id: ledRow
        //     anchors.horizontalCenter: parent.horizontalCenter
        //     anchors.top: speedText.bottom
        //     anchors.topMargin: 10
        //     spacing: 5

        //     Repeater {
        //         model: rectangle.numLeds
        //         Rectangle {
        //             width: 20
        //             height: 50
        //             radius: 50

        //             // Warna dan opasitas LED berubah sesuai nilai speed
        //             // color: Qt.rgba(1 - index / rectangle.numLeds, index / rectangle.numLeds, 0, 1)
        //             color: "#00BFFF"
        //             opacity: index < Math.floor(
        //                          (rectangle.currentSpeed / 180) * rectangle.numLeds) ? 1 : 0.3
        //         }
        //     }
        // }

        // Canvas for LED Arc (Only declaration, no logic here)
        Canvas {
            id: ledArc
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: speedText.bottom
            anchors.horizontalCenterOffset: -1
            anchors.topMargin: -41
            width: 300
            height: 150
        }

        // Speed Text Display
        Text {
            id: speedText
            y: 340
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: ledArc.bottom
            anchors.topMargin: 0
            // text: mainScreen.currentSpeed + " MpH"
            text: "0"
            font.pixelSize: 30
            anchors.horizontalCenterOffset: -1
            color: "#FFFFFF"
        }

        Rectangle {
            id: indikator
            x: 8
            y: 35
            width: 399
            height: 65
            color: "#313237"
            radius: 20

            Rectangle {
                id: parking
                x: 20
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
                x: 115
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
                x: 210
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
                x: 310
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

        Image {
            id: car
            x: 50
            y: 137
            width: 315
            height: 180
            source: "../assets/car.png"
            fillMode: Image.PreserveAspectFit
            rotation: 0 // Properti rotasi, mulai dari 0 derajat
        }
    }

    Rectangle {
        id: rectangle4
        x: 433
        y: 285
        width: 415
        height: 200
        color: "#4b4747"
        radius: 10
    }

    Rectangle {
        id: rectangle5
        x: 433
        y: 495
        width: 415
        height: 200
        color: "#4b4747"
        radius: 10
    }

    RoundButton {
        id: buttonHome
        x: 302
        y: 718
        width: 59
        height: 56
        background: Rectangle {
            color: "white"
            radius: 50
        }

        Image {
            id: _109588
            x: 0
            y: 6
            width: 59
            height: 42
            source: "../assets/home.png"
            fillMode: Image.PreserveAspectFit
        }
    }

    RoundButton {
        id: buttonMenu
        x: 470
        y: 718
        width: 59
        height: 56
        background: Rectangle {
            color: "#ffffff"
            radius: 28
        }

        Image {
            id: pngtreemenuiconpngimage_4419509removebgpreview
            x: 0
            y: 8
            width: 59
            height: 42
            source: "../assets/menu.png"
            fillMode: Image.PreserveAspectFit
        }
    }

    RoundButton {
        id: buttonNotif
        x: 636
        y: 718
        width: 59
        height: 56
        background: Rectangle {
            color: "#ffffff"
            radius: 28
        }

        Image {
            id: calliconvectortelephoneiconvectorphoneiconvectorcontactus2R2PT6Rremovebgpreview
            x: -6
            y: 1
            width: 70
            height: 55
            source: "../assets/notif.png"
            fillMode: Image.PreserveAspectFit
        }
    }

    RoundButton {
        id: buttonSetting
        x: 813
        y: 718
        width: 59
        height: 56
        background: Rectangle {
            color: "#ffffff"
            radius: 28
        }
    }

    Image {
        id: pngclipartsettingsgearicongearconfigurationthumbnailremovebgpreview
        x: 813
        y: 725
        width: 59
        height: 42
        source: "../assets/setting.png"
        fillMode: Image.PreserveAspectFit
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
