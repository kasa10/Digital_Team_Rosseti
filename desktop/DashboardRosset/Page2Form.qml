import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 600
    height: 400

    title: qsTr("Станция не контролируется сервером!")

    Text {
        id: element
        text: qsTr("Станция не контролируется")
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 35
    }
}
