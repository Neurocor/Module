import QtQuick 2.0
import QtQuick.Controls 2.15

Slider {
    id: root

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitHandleWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitHandleHeight + topPadding + bottomPadding)

    property color handleColor: "#ff4b00"
    property color fillColor: handleColor
    property color railColor: "#9f9f9f"

    property real handleRadius: 25
    property real fillWidth: 20
    property real railWidth: 1

    background: Rectangle {

        x: root.leftPadding
        y: root.topPadding + (root.availableHeight - height) / 2

        implicitWidth: 200
        implicitHeight: 1

        width: root.availableWidth
        height: railWidth

        radius: height / 2
        color: railColor

        Rectangle {

            width: root.visualPosition * parent.width
            height: fillWidth

            anchors.verticalCenter: parent.verticalCenter
            color: fillColor
            radius: height / 2
        }
    }

    handle: Rectangle {
        x: root.leftPadding + root.visualPosition * (root.availableWidth - width)
        y: root.topPadding + (root.availableHeight - height) / 2
        implicitWidth: handleRadius * 2
        implicitHeight: implicitWidth
        radius: height / 2
        color: handleColor
    }
}
