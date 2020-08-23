import QtQuick 2.12
import QtQuick.Controls 2.12
import QtLocation 5.12
import QtPositioning 5.12

Page {
    id: page
    title: qsTr("Основные показатели");

    Image {
        id: image
        width: 159
        height: 42
        anchors.top: parent.top
        anchors.topMargin: 16
        anchors.left: parent.left
        anchors.leftMargin: 15
        source: "images/logo.png"
    }

    Text {
        id: element
        y: 22
        width: 561
        height: 30
        text: qsTr("Контроллер линий")
        font.bold: true
        anchors.left: image.right
        anchors.leftMargin: 36
        font.family: "Verdana"
        font.pixelSize: 20
    }

    Frame {
        id: frame
        width: 316
        height: 95
        anchors.top: frame2.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 15

        Text {
            id: element2
            x: 0
            width: 292
            height: 24
            text: qsTr("Датчиков мониторинга на связи:")
            anchors.top: parent.top
            anchors.topMargin: 0
            font.pixelSize: 17
        }

        Text {
            id: element3
            x: 151
            width: 141
            height: 40
            color: "#143abc"
            text: qsTr("3")
            anchors.top: element2.bottom
            anchors.topMargin: 6
            anchors.right: parent.right
            anchors.rightMargin: 0
            font.family: "Verdana"
            font.bold: true
            horizontalAlignment: Text.AlignRight
            font.pixelSize: 28
        }
    }

    Text {
        id: element1
        x: 767
        y: 576
        text: qsTr("Оператор: Киреев Константин Дмитриевич")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        font.pixelSize: 12
    }

    Frame {
        id: frame1
        width: 316
        height: 95
        anchors.top: frame.bottom
        anchors.topMargin: 21
        anchors.leftMargin: 15
        Text {
            id: element4
            width: 292
            height: 24
            text: qsTr("Выявленные аномалии")
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            font.pixelSize: 17
        }

        Text {
            id: element5
            x: 151
            width: 141
            height: 40
            color: "#143abc"
            text: qsTr("0")
            anchors.top: element4.bottom
            anchors.topMargin: 9
            horizontalAlignment: Text.AlignRight
            font.pixelSize: 28
            anchors.right: parent.right
            font.bold: true
            anchors.rightMargin: 0
            font.family: "Verdana"
        }
        anchors.left: parent.left
    }

    Frame {
        id: frame2
        y: 112
        width: 316
        height: 95
        anchors.top: image.bottom
        anchors.leftMargin: 15
        Text {
            id: element6
            x: 0
            width: 292
            height: 24
            text: qsTr("Объектов на контроле:")
            anchors.top: parent.top
            font.pixelSize: 17
            anchors.topMargin: 0
        }

        Text {
            id: element7
            x: 151
            y: 31
            width: 141
            height: 40
            color: "#143abc"
            text: qsTr("1")
            anchors.top: element6.bottom
            horizontalAlignment: Text.AlignRight
            font.pixelSize: 28
            anchors.topMargin: 6
            anchors.right: parent.right
            font.bold: true
            anchors.rightMargin: 0
            font.family: "Verdana"
        }
        anchors.topMargin: 38
        anchors.left: parent.left
    }

    Plugin {
            id: mapPlugin
            name: "osm"
        }

    //ПАО ФСК Эс

    Rectangle {
        id: rectangle
        color: "#cef2fe"
        anchors.top: image.bottom
        anchors.topMargin: 38
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.bottom: element1.top
        anchors.bottomMargin: 34
        anchors.left: frame.right
        anchors.leftMargin: 19
        Map {
            anchors.fill: parent
            plugin: mapPlugin
            center: QtPositioning.coordinate(51.659009, 45.786808)
            zoomLevel: 18
            MapStationItem{
                longitude: 51.659009
                latitude: 45.786808
                stationName: "ПС Курдюм"
                stationSubName: "500/220/110 кВ"
                isOnControl: true
            }

            MapStationItem{
                longitude: 51.6005038
                latitude: 45.8737693
                stationName: "ПС Жасминная"
                stationSubName: "110 кВ"
                isOnControl: false
            }

            MapStationItem{
                longitude: 51.5968984
                latitude: 45.9122968
                stationName: "ПС Елшанка 2"
                stationSubName: "110 кВ"
                isOnControl: false
            }

            MapStationItem{
                longitude: 51.619024
                latitude: 45.965261
                stationName: "ПС Саратовская"
                stationSubName: "220/110/35 кВ"
                isOnControl: false
            }

            MapStationItem{
                longitude: 51.619024
                latitude: 45.965261
                stationName: "ПС Трофимовская"
                stationSubName: "110 кВ"
                isOnControl: false
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1;anchors_x:15;anchors_y:16}D{i:2;anchors_x:210}
D{i:4;anchors_y:0}D{i:5;anchors_y:30}D{i:3;anchors_x:15;anchors_y:90}D{i:8;anchors_x:0;anchors_y:0}
D{i:9;anchors_y:33}D{i:7;anchors_x:15;anchors_y:206}D{i:11;anchors_y:0}D{i:12;anchors_y:30}
D{i:10;anchors_x:15;anchors_y:90}D{i:13;anchors_height:326;anchors_width:280;anchors_x:350;anchors_y:96}
}
##^##*/
