import QtQuick 2.15
import QtQuick.Controls 2.15

Item {

    id: root

    property alias text: btn.text
    property color textColor: "white"

    property real ratioHtoW: 1
    property bool isRounded: true

    property int borderWidth: 1
    property color borderColor: "#8f8f8f"

    property color enabledColor: "#0085b8"
    //    property color disabledColor: "#2f2f2f"
    property color disabledColor: "transparent"
    property color clickedColor: "#00729D"
    //    property color clickedColor: "#ff4b00"
    property color checkedColor: enabledColor

    signal checkedChanged
    signal clicked

    property font font
    property alias checkable: btn.checkable
    property alias autoRepeat: btn.autoRepeat

    implicitHeight: btn.implicitHeight
    implicitWidth: btn.implicitWidth

    AbstractButton {

        id: btn

        hoverEnabled: false

        anchors.centerIn: parent

        font: root.font
        padding: 5

        width: Math.min(
                   root.width - leftPadding - rightPadding,
                   (root.height - topPadding - bottomPadding) / root.ratioHtoW)
        height: Math.min(
                    root.height - topPadding - bottomPadding,
                    (root.width - leftPadding - rightPadding) * root.ratioHtoW)

        contentItem: CustomText {
            text: btn.text
            color: root.textColor
            font: btn.font
        }

        background: Rectangle {

            implicitWidth: 100
            implicitHeight: 40

            color: if (btn.enabled) {
                       if (btn.checkable) {
                           if (btn.checked) {
                               root.checkedColor
                           } else {
                               root.disabledColor
                           }
                       } else if (btn.down) {
                           root.clickedColor
                       } else {
                           root.enabledColor
                       }
                   } else {
                       root.disabledColor
                   }
            radius: root.isRounded ? Math.min(height, width) / 2 : 0
            border.width: root.borderWidth
            border.color: root.borderColor
        }

        onClicked: root.clicked()
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

