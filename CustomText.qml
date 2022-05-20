import QtQuick 2.15
import QtQuick.Controls 2.15

Item {

    id: root

    implicitHeight: txt.implicitHeight
    implicitWidth: txt.implicitWidth

    property color color: "white"
    property color enabledColor: color
    property color disabledColor: "#5f5f5f"
    property string text
    property font font
    property alias leftPadding: txt.leftPadding
    property alias elide: txt.elide

    Text {
        id: txt

        anchors.centerIn: parent

        text: root.text
        color: enabled ? root.enabledColor : root.disabledColor

        font: root.font

        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/

