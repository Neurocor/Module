import QtQuick 2.15

Item {

    id: root

    property string titleText
    property string valueText
    property string dimensionText

    property color titleColor: "white"
    property color valueColor: titleColor
    property color dimensionColor: titleColor

    implicitHeight: titleCont.implicitHeight + row.implicitHeight

    implicitWidth: Math.max(titleCont.implicitWidth, row.implicitWidth)

    CustomText {
        id: titleCont
        text: root.titleText

        font.pixelSize: 36

        color: root.titleColor

        width: parent.width
        height: parent.height / 2
    }
    Item {

        id: row

        anchors.top: titleCont.bottom

        implicitHeight: Math.max(valueCont.imimplicitHeight,
                                 dimenCont.imimplicitHeight)

        implicitWidth: valueCont.implicitWidth + dimenCont.implicitWidth

        width: parent.width
        height: parent.height / 2

        CustomText {

            id: valueCont
            text: root.valueText

            font.pixelSize: 36

            color: root.valueColor

            width: parent.width / 2
            height: parent.height
        }
        CustomText {
            id: dimenCont
            text: root.dimensionText

            font.pixelSize: 36

            color: root.dimensionColor

            width: parent.width / 2
            height: parent.height

            anchors.left: valueCont.right
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

