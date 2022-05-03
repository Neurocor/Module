import QtQuick 2.15
import QtQuick.Controls 2.15

Item {

    id: root

    implicitHeight: txt.implicitHeight
    implicitWidth: txt.implicitWidth

    property color color: "white"
    property string text
    property font font
    property alias leftPadding: txt.leftPadding
    property alias elide: txt.elide

    Text {
        id: txt

        anchors.centerIn: parent

        text: root.text
        color: root.color

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

