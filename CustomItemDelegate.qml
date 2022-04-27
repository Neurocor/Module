import QtQuick 2.15
import QtQuick.Controls 2.15

ItemDelegate {

    id: root

    property bool inActiveRow: false
    property bool highlightOnDown: false

    contentItem: Text {
        color: "white"
        text: root.text
        font: root.font

        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    background: Rectangle {
        visible: inActiveRow ^ (highlightOnDown ? down : false)
        color: "#515151"
    }
}
