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

        // Properti yang merepresentasikan jumlah LED
            property int numLeds: 15
            property int numLeds1: 5
            property int currentSpeed: 0
            property int percent: 0


        // Aksi ketika tombol Home diklik
        buttonHome.onClicked: {
            mainScreen.color = "blue"
            console.log("Changed")
        }
    }

    // Fungsi untuk memperbarui kecepatan dan LED Progress Bar
        function updateSpeed(newSpeed, newPercent) {
            mainScreen.speed = newSpeed.toString();
            mainScreen.currentSpeed = newSpeed;
            mainScreen.percent = newPercent;
        }

    // Timer untuk memperbarui kecepatan setiap detik
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            // Menghasilkan nilai kecepatan acak antara 0 dan 180
            let newSpeed = Math.floor(Math.random() * 180);
            let newPercent = Math.floor(Math.random() * 100);
            updateSpeed(newSpeed, newPercent);
        }
    }
}
