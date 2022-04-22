import QtQuick 2.15
import QtQuick.Controls 2.15

ItemDelegate {

    id: root

    font.pixelSize: 24

    property bool inActiveRow: false

    contentItem: Text {
        color: "white"
        text: root.text
        font: root.font

        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    background: Rectangle {
        visible: inActiveRow || down
        color: "#515151"
    }
}
