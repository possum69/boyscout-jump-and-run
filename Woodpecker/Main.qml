import QtQuick


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello Julian")


    Item {
        id: player
        width: 40
        height: 80

        property real vx: 0
        property real vy: 0

        anchors.centerIn: parent
    }
    Rectangle {
        id: kopf
        width: 20
        height: 20
        radius: 10
        color: "black"
        anchors.horizontalCenter: parent.horizontalCenter
        y: 0
    }
    Rectangle {
        id: körper
        width: 4
        height: 30
        color: "black"
        anchors.horizontalCenter: parent.horizontalCenter
        y: 20
    }

    Rectangle {
        width: 30
        height: 3
        color: "black"
        anchors.horizontalCenter: parent.horizontalCenter
        y: 30
    }


    Rectangle {
        width: 3
        height: 25
        color: "black"
        rotation: -20
        anchors.margins: parent.margins
        y: 45
        x: 323
    }

    Rectangle {
        width: 3
        height: 25
        color: "black"
        rotation: 20
        anchors.margins: parent.margins
        y: 45
        x: 313
    }





}



