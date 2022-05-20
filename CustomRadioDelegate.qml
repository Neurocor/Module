import QtQuick 2.15
import QtQuick.Controls 2.15

RadioDelegate {

    id: root

    property color textColor: "white"
    property color outerBorderColor: textColor
    property color outerBorderEnabledColor: outerBorderColor
    property color outerBorderDisabledColor: "#5f5f5f"
    property color checkedColor: "#0085b8"

    LayoutMirroring.enabled: true
    contentItem: CustomText {
        text: root.text
        font: root.font

        color: root.textColor

        elide: Text.ElideLeft

        leftPadding: root.indicator.width + root.spacing
    }

    indicator: Rectangle {

        implicitWidth: 48
        implicitHeight: 48

        x: root.leftPadding
        y: (root.height - height) / 2
        radius: height / 2
        color: "transparent"
        border.color: enabled ? root.outerBorderEnabledColor : root.outerBorderDisabledColor

        Rectangle {

            anchors.fill: parent
            anchors.centerIn: parent
            radius: height / 2
            color: root.checkedColor
            visible: root.checked
        }
    }

    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 40
        visible: root.down || root.highlighted
        color: "#515151"
    }

    onEnabledChanged: if (!enabled)
                          checked = false
}
