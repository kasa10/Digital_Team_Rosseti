import QtQuick 2.12
import QtLocation 5.12
import QtPositioning 5.12

MapQuickItem
{
    property double longitude: 0
    property double latitude: 0

    property string stationName: "NoName"
    property string stationSubName: "value"
    property int anomalesCount: 0
    property bool isOnControl: true

    id:connection1
    coordinate: QtPositioning.coordinate(longitude, latitude)
    anchorPoint.x: 0
    anchorPoint.y: 0
    sourceItem:  Rectangle {
        width: 300
        height: 120
        color: "#fff"
        border.color: "#000"
        Text {
            id: txt1
            text: stationName
            horizontalAlignment: Text.AlignHCenter
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            font.pointSize: 17
            font.bold: true;
        }

        Text {
            id: txt2
            text: stationSubName
            horizontalAlignment: Text.AlignLeft
            anchors.top: txt1.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            font.pointSize: 13
        }

        Text {
            id: txt3
            text: qsTr("Количество выявленных аномалий: ")+anomalesCount
            horizontalAlignment: Text.AlignLeft
            anchors.top: txt2.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            font.pointSize: 10
        }

        Text {
            id: txt4
            text: {(isOnControl===true) ? ("Статус: на контроле") : ("Не взята на контроль")}
            horizontalAlignment: Text.AlignLeft
            anchors.top: txt3.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            font.pointSize: 10
        }

    }
}
