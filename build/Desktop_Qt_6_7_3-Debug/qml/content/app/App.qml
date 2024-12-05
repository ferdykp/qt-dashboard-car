import QtQuick 6.5
// import Dashboard1
import "../ui"

Window {
    id: windowScreen
    width: 1280
    height: 800
    visible: true
    title: "Inno"

    property int currScreenNumber: 0 // Layar awal adalah Screen01
    property bool isX86_64: dash.isX86_64()

    Item {
        id: contentContainer
        width: parent.width
        height: parent.height

        // Transformasi hanya diterapkan jika bukan x86_64
        transform: !isX86_64 ? [rotate, translate] : []

        Rotation {
            id: rotate
            angle: 90
            origin.x: 1280 / 2
            origin.y: 800 / 2
        }
        Translate {
            id: translate
            x: -240
            y: 240
        }

        Loader {
            id: pageLoader
            width: 1280
            height: 800
        }

    }

    // Fungsi untuk mengganti layar
    function switchScreen(screenNumber, text = "") {
        currScreenNumber = screenNumber;
        if (screenNumber === 1) {
            pageLoader.source = "qrc:/content/app/ScreenMain.qml";
        } else if (screenNumber === 2) {
            pageLoader.source = "qrc:/content/app/ScreenMap.qml";
        } else {
            console.log("Invalid screen number");
        }
    }


    Component.onCompleted: {
        switchScreen(1);
    }
}
