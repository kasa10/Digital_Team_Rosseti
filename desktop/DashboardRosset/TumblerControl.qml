import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {
    property bool switched: false
    property string description: ""
    id: rectangle
    width: 294
    height: 173
    color: (switched===true) ? "#e8fdf0" : "#ff0000"
    radius: 5

    Text {
        id: element
        text: description
        anchors.top: element1.bottom
        anchors.topMargin: 17
        anchors.right: parent.right
        anchors.rightMargin: 8
        anchors.left: parent.left
        anchors.leftMargin: 8
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        font.pixelSize: 12
        font.bold: (!switched)
        color: (switched) ? "#000" : "#fff"
    }

    Switch {
        id: element1
        text: (switched===false) ? "Разрыв" : "Соединено"
        checked: false
        anchors.right: parent.right
        anchors.rightMargin: 13
        anchors.left: parent.left
        anchors.leftMargin: 8
        anchors.top: parent.top
        anchors.topMargin: 8
        font.bold: (!switched)
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.5}D{i:1;anchors_height:146;anchors_width:104;anchors_x:8;anchors_y:65}
D{i:2;anchors_x:8;anchors_y:8}
}
##^##*/
