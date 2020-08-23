import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import "engine.js" as Engine

Page {
    id: page
    width: 1000
    height: 800
    title: qsTr("ПС Курдюм")
    Component.onCompleted: { forceActiveFocus() }

    Keys.onSpacePressed: {}
        Keys.onReleased: {
            if (event.key === Qt.Key_Space) {
                tumblerControl.switched=true;
                tumblerControl1.switched=false;
                control1.setCurrentSensorValue(Engine.getRandomInt(50));
                circleControl.setCurrentSensorValue(Engine.getRandomInt(100));
                event.accepted = true;
            }
        }

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


    Rectangle {
        id: rectangle
        x: 14
        y: 82
        width: 905
        height: 382
        color: "#ffffff"
        radius: 0
        border.width: 1

        CircleControl {
            id: control1
            anchors.top: parent.top
            sensorValueStep: 1
            anchors.leftMargin: 15
            description: "Сила тока в цепи АФ-34"
            anchors.topMargin: 15
            anchors.left: parent.left
            maximumSensorValue: 50
            minimumSensorValue: 0
            caption: "Амперметр"
            Component.onCompleted: { setCurrentSensorValue(97); }
        }

        TumblerControl {
            id: tumblerControl
            x: 304
            y: 221
            width: 294
            height: 111
            description: "Разрыв в цепи ВР-4"
        }

        TumblerControl {
            id: tumblerControl1
            x: 304
            y: 104
            height: 111
            switched: true
            description: "Назначаемый мониторингом тумблер"
        }

        CircleControl {
            id: circleControl
            x: 614
            y: 15
            sensorValueStep: 1
            description: "Определение машинного обучения"
            maximumSensorValue: 100
            minimumSensorValue: 0
            caption: "Уверенность (%)"
            Component.onCompleted: { setCurrentSensorValue(97); }
        }

        Text {
            id: element
            x: 299
            y: 15
            width: 299
            height: 70
            text: qsTr("Модуль мониторинга переключателя ТФ-23")
            wrapMode: Text.WordWrap
            font.bold: true
            font.family: "Times New Roman"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 29
        }
    }

    Rectangle {
        id: rectangle1
        x: 963
        y: 82
        width: 874
        height: 382
        color: "#b7fcf9"
        radius: 0
        border.color: "#afe2f3"
        CircleControl {
            id: control2
            color: "#b7fcf9"
            anchors.top: parent.top
            sensorValueStep: 1
            anchors.leftMargin: 15
            description: "Подключаемый датчик"
            anchors.topMargin: 15
            anchors.left: parent.left
            maximumSensorValue: 50
            minimumSensorValue: 0
            caption: "Датчик"
        }

        TumblerControl {
            id: tumblerControl2
            x: 304
            y: 221
            width: 256
            height: 111
            color: "#b7fcf9"
            border.color: "#b7fcf9"
            description: "Датчик, получаемый с машинного обучения"
        }

        TumblerControl {
            id: tumblerControl3
            x: 304
            y: 125
            width: 294
            height: 90
            color: "#b7fcf9"
            switched: true
            description: "Назначаемый мониторингом тумблер"
        }

        CircleControl {
            id: circleControl1
            x: 588
            y: 15
            color: "#b7fcf9"
            sensorValueStep: 1
            description: "Определение машинного обучения"
            maximumSensorValue: 100
            minimumSensorValue: 0
            caption: "Уверенность (%)"
        }

        Text {
            id: element1
            x: 299
            y: 15
            width: 261
            height: 104
            color: "#158888"
            text: qsTr("Другой подключаемый плагином модуль")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 29
            wrapMode: Text.WordWrap
            font.bold: true
            font.family: "Times New Roman"
        }
        border.width: 1
    }

    Rectangle {
        id: rectangle2
        x: 14
        y: 489
        width: 905
        height: 382
        color: "#b7fcf9"
        radius: 0
        CircleControl {
            id: control3
            color: "#b7fcf9"
            anchors.top: parent.top
            anchors.leftMargin: 15
            sensorValueStep: 1
            description: "Подключаемый датчик"
            anchors.topMargin: 15
            anchors.left: parent.left
            maximumSensorValue: 50
            minimumSensorValue: 0
            caption: "Датчик"
        }

        TumblerControl {
            id: tumblerControl4
            x: 304
            y: 221
            width: 256
            height: 111
            color: "#b7fcf9"
            description: "Датчик, получаемый с машинного обучения"
            border.color: "#b7fcf9"
        }

        TumblerControl {
            id: tumblerControl5
            x: 304
            y: 125
            width: 294
            height: 90
            color: "#b7fcf9"
            switched: true
            description: "Назначаемый мониторингом тумблер"
        }

        CircleControl {
            id: circleControl2
            x: 613
            y: 15
            color: "#b7fcf9"
            sensorValueStep: 1
            description: "Определение машинного обучения"
            maximumSensorValue: 100
            minimumSensorValue: 0
            caption: "Уверенность (%)"
        }

        Text {
            id: element2
            x: 299
            y: 15
            width: 261
            height: 104
            color: "#158888"
            text: qsTr("Другой подключаемый плагином модуль")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 29
            wrapMode: Text.WordWrap
            font.bold: true
            font.family: "Times New Roman"
        }
        border.width: 1
        border.color: "#afe2f3"
    }

    Rectangle {
        id: rectangle3
        x: 963
        y: 489
        width: 874
        height: 382
        color: "#b7fcf9"
        radius: 0
        CircleControl {
            id: control4
            color: "#b7fcf9"
            anchors.top: parent.top
            sensorValueStep: 1
            anchors.leftMargin: 15
            description: "Подключаемый датчик"
            anchors.topMargin: 15
            anchors.left: parent.left
            maximumSensorValue: 50
            minimumSensorValue: 0
            caption: "Датчик"
        }

        TumblerControl {
            id: tumblerControl6
            x: 304
            y: 221
            width: 256
            height: 111
            color: "#b7fcf9"
            description: "Датчик, получаемый с машинного обучения"
            border.color: "#b7fcf9"
        }

        TumblerControl {
            id: tumblerControl7
            x: 304
            y: 125
            width: 294
            height: 90
            color: "#b7fcf9"
            switched: true
            description: "Назначаемый мониторингом тумблер"
        }

        CircleControl {
            id: circleControl3
            x: 588
            y: 15
            color: "#b7fcf9"
            sensorValueStep: 1
            description: "Определение машинного обучения"
            maximumSensorValue: 100
            minimumSensorValue: 0
            caption: "Уверенность (%)"
        }

        Text {
            id: element3
            x: 299
            y: 15
            width: 261
            height: 104
            color: "#158888"
            text: qsTr("Другой подключаемый плагином модуль")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 29
            wrapMode: Text.WordWrap
            font.bold: true
            font.family: "Times New Roman"
        }
        border.width: 1
        border.color: "#afe2f3"
    }
}
