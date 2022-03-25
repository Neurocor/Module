import QtQuick 2.15

Text {

    id: root

    color: "white"

    property alias textSize: root.font.pixelSize

    verticalAlignment: CustomText.AlignVCenter
    horizontalAlignment: CustomText.AlignHCenter
}
