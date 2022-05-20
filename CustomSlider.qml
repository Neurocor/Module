import QtQuick 2.0
import QtQuick.Controls 2.15

Slider {
    id: root

    property color handleColor: "#ff4b00"
    property color disableColor: "#2f2f2f"
    property color borderDisabledColor: "#5f5f5f"
    property color fillColor: handleColor
    property color railColor: "#9f9f9f"

    property real handleRadius: 55
    property real fillWidth: 30
    property real railWidth: 1
    snapMode: Slider.SnapAlways

    background: Rectangle {

        x: root.leftPadding
        y: root.topPadding + (root.availableHeight - height) / 2

        implicitWidth: 200
        implicitHeight: 1

        width: root.availableWidth
        height: root.railWidth

        radius: height / 2
        color: root.railColor

        Rectangle {

            width: root.visualPosition * parent.width
            height: root.fillWidth

            anchors.verticalCenter: parent.verticalCenter
            color: root.fillColor
            radius: height / 2
            border.color: "white"
        }
    }

    handle: Rectangle {
        x: root.leftPadding + root.visualPosition * (root.availableWidth - width)
        y: root.topPadding + (root.availableHeight - height) / 2
        implicitWidth: root.handleRadius * 2
        implicitHeight: implicitWidth
        radius: height / 2
        color: enabled ? root.handleColor : root.disableColor
        border.color: enabled ? "white" : root.borderDisabledColor
    }
}
