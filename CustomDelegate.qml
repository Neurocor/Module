import QtQuick 2.0
import QtQuick.Controls 2.15

ItemDelegate {
    id: root

    property ButtonGroup btnGroup

    signal delegateEnabled
    signal delegateDisabled

    contentItem: Row {
        spacing: 30
        Item {
            width: parent.width / 10
            height: parent.height

            CustomButton {
                id: btn
                width: Math.min(parent.width, parent.height)
                height: width
                scale: 0.8

                anchors.centerIn: parent
                checkable: true
                ButtonGroup.group: btnGroup
                onCheckedChanged: {
                    if (checked)
                        delegateEnabled()
                    else
                        delegateDisabled()
                }
            }
            Item {
                width: parent.width / 10 * 9
                height: parent.height

                CustomText {
                    id: contItem
                    text: qsTr(root.text)
                    font.pixelSize: parent.height / 2
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
    }
    background: Rectangle {
        visible: root.down
        color: "#aeafb1"
    }
    onClicked: {
        btn.checked = true
    }
}
