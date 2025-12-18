import QtQuick 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")



    Rectangle {
        id: head
        width: 70
        height: 70
        color: "orange"
        radius: width / 2
        anchors.centerIn: parent
    }


}
