import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4

Page {
    width: 600
    height: 400

    title: qsTr("ПС Айвазовский")
    CircularGauge {
        style: CircularGaugeStyle {
            needle: Rectangle {
                y: outerRadius * 0.15
                implicitWidth: outerRadius * 0.03
                implicitHeight: outerRadius * 0.9
                antialiasing: true
                color: Qt.rgba(0.66, 0.3, 0, 1)
            }
        }
    }
}
