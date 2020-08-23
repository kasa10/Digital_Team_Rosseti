import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Extras.Private 1.0
import QtGraphicalEffects 1.0


Rectangle {
    id: rectangle
    property int currentValue: 0
    property int maximumSensorValue: 100
    property int minimumSensorValue: 0
    property int sensorValueStep: 10

    property string caption: ""
    property string description: ""

    width: 272
    height: 346
    color: "#c8f7d6"
    radius: 10
    border.color: "#1791b9"
    border.width: 1
    function setCurrentSensorValue(m_value){
        currentValue = m_value;
        gauge.accelerating = true;
    }
    function setNullSensorValue(){
        gauge.accelerating = false;
    }

    CircularGauge {
        id: gauge
        width: 224
        height: 219
        minimumValue: minimumSensorValue
        maximumValue: maximumSensorValue
        stepSize: sensorValueStep
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 11
        style: CircularGaugeStyle {
            labelStepSize: 10
            labelInset: outerRadius / 2.2
            tickmarkInset: outerRadius / 4.2
            minorTickmarkInset: outerRadius / 4.2
            minimumValueAngle: -144
            maximumValueAngle: 144

            background: Rectangle {
                implicitHeight: gauge.height
                implicitWidth: gauge.width
                color: "black"
                anchors.centerIn: parent
                radius: 360

                Image {
                    anchors.fill: parent
                    source: "qrc:/img/background.svg"
                    asynchronous: true
                    sourceSize {
                        width: width
                    }
                }

                Canvas {
                    property int value: gauge.value

                    anchors.fill: parent
                    onValueChanged: requestPaint()

                    function degreesToRadians(degrees) {
                      return degrees * (Math.PI / 180);
                    }

                    onPaint: {
                        var ctx = getContext("2d");
                        ctx.reset();
                        ctx.beginPath();
                        ctx.strokeStyle = "black"
                        ctx.lineWidth = outerRadius
                        ctx.arc(outerRadius,
                              outerRadius,
                              outerRadius - ctx.lineWidth / 2,
                              degreesToRadians(valueToAngle(gauge.value) - 90),
                              degreesToRadians(valueToAngle(gauge.maximumValue + 1) - 90));
                        ctx.stroke();
                    }
                }
            }

            needle: Item {
                y: -outerRadius * 0.78
                height: outerRadius * 0.27
                Image {
                    id: needle
                    source: "qrc:/img/needle.svg"
                    height: parent.height
                    width: height * 0.1
                    asynchronous: true
                    antialiasing: true
                }

                Glow {
                  anchors.fill: needle
                  radius: 5
                  samples: 10
                  color: "white"
                  source: needle
              }
            }

            foreground: Item {
                Text {
                    id: speedLabel
                    anchors.centerIn: parent
                    text: gauge.value.toFixed(0)
                    font.pixelSize: outerRadius * 0.3
                    color: "white"
                    antialiasing: true
                }
            }

            tickmarkLabel:  Text {
                font.pixelSize: Math.max(6, outerRadius * 0.05)
                text: styleData.value
                color: styleData.value <= gauge.value ? "white" : "#777776"
                antialiasing: true
            }

            tickmark: Image {
                source: "qrc:/img/tickmark.svg"
                width: outerRadius * 0.018
                height: outerRadius * 0.15
                antialiasing: true
                asynchronous: true
            }

            minorTickmark: Rectangle {
                implicitWidth: outerRadius * 0.01
                implicitHeight: outerRadius * 0.03

                antialiasing: true
                smooth: true
                color: styleData.value <= gauge.value ? "white" : "darkGray"
            }
        }
        value: accelerating ? currentValue : 0

        property bool accelerating: false

        Behavior on value {
                NumberAnimation {
                    duration: 1000
                }
            }
    }



    Text {
        id: element
        x: 8
        width: 256
        height: 27
        color: "#06258f"
        text: caption
        anchors.top: gauge.top
        anchors.topMargin: 234
        font.pixelSize: 20
        fontSizeMode: Text.FixedSize
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        font.family: "Verdana"
    }

    Text {
        id: element1
        x: 8
        width: 256
        height: 60
        text: description
        anchors.top: element.bottom
        anchors.topMargin: 6
        font.pixelSize: 12
    }
}

