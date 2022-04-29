import QtQuick 2.15

Item {

    id: root

    property string titleText
    property string valueText
    property string dimensionText

    implicitHeight: titleCont.implicitHeight + row.implicitHeight

    implicitWidth: Math.max(titleCont.implicitWidth, row.implicitWidth)

    CustomText {
        id: titleCont
        text: root.titleText
    }
    Item {

        id: row

        anchors.top: titleCont.bottom

        implicitHeight: Math.max(valueCont.imimplicitHeight,
                                 dimenCont.imimplicitHeight)

        implicitWidth: valueCont.implicitWidth + dimenCont.implicitWidth

        CustomText {

            id: valueCont
            text: root.valueText
        }
        CustomText {
            id: dimenCont
            text: root.dimensionText
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

