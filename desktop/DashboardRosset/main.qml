import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    id: window
    visible: true
    width: 1900
    height: 1000
    title: qsTr("[Россеть] - Администрирование контроллеров")

    header: ToolBar {
        contentHeight: toolButton.implicitHeight

        ToolButton {
            id: toolButton
            text: stackView.depth > 1 ? "\u25C0" : "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
        }

        Label {
            text: stackView.currentItem.title
            anchors.centerIn: parent
            font.pointSize: 18
            font.bold: true
        }
    }

    Drawer {
        id: drawer
        width: 300
        height: window.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("ПС Курдюм")
                width: parent.width
                onClicked: {
                    stackView.push("Page1Form.qml")
                    drawer.close()
                }
                icon.source: "qrc:/images/company.png"
                icon.width: 30
                icon.height: 30
                font.bold: true
                font.pointSize: 17
            }
            ItemDelegate {
                text: qsTr("ПС Жасминная")
                width: parent.width
                onClicked: {
                    stackView.push("Page2Form.qml")
                    drawer.close()
                }
                icon.source: "qrc:/images/company.png"
                icon.width: 30
                icon.height: 30
                font.pointSize: 17
            }
            ItemDelegate {
                text: qsTr("ПС Елшанка 2")
                width: parent.width
                onClicked: {
                    stackView.push("Page2Form.qml")
                    drawer.close()
                }
                icon.source: "qrc:/images/company.png"
                icon.width: 30
                icon.height: 30
                font.pointSize: 17
            }
            ItemDelegate {
                text: qsTr("ПС Саратовская")
                width: parent.width
                onClicked: {
                    stackView.push("Page2Form.qml")
                    drawer.close()
                }
                icon.source: "qrc:/images/company.png"
                icon.width: 30
                icon.height: 30
                font.pointSize: 17
            }
            ItemDelegate {
                text: qsTr("ПС Трофимовская")
                width: parent.width
                onClicked: {
                    stackView.push("Page2Form.qml")
                    drawer.close()
                }
                icon.source: "qrc:/images/company.png"
                icon.width: 30
                icon.height: 30
                font.pointSize: 17
            }
        }
    }

    StackView {
        id: stackView
        initialItem: "HomeForm.qml"
        anchors.fill: parent
    }
}
