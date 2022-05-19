import QtQuick 2.15
import QtQuick.Layouts 1.15

Column {

    id: root

    property string titleText
    property string valueText
    property string dimensionText

    property color titleColor: "white"
    property color valueColor: titleColor
    property color dimensionColor: titleColor

    property font font
    property int titleFontSize: font.pixelSize
    property int valueFontSize: titleFontSize * 4
    property int dimensionFontSize: titleFontSize * 2

    signal clicked

    CustomText {

        id: titleCont

        width: parent.width
        height: parent.height / 4

        font.family: root.font.family
        font.pixelSize: root.titleFontSize

        color: root.titleColor

        text: root.titleText
    }

    CustomTextRow {
        id: valCont

        anchors.horizontalCenter: titleCont.horizontalCenter

        font.family: root.font.family

        valueFontSize: root.valueFontSize
        dimensionFontSize: root.dimensionFontSize

        valueColor: root.valueColor
        dimensionColor: root.dimensionColor

        valueText: root.valueText
        dimensionText: root.dimensionText
    }

    //    RowLayout {

    //        id: rowCont

    //        anchors.horizontalCenter: titleCont.horizontalCenter

    //        CustomText {

    //            Layout.alignment: Qt.AlignVCenter

    //            font.family: root.valueFont.family
    //            font.pixelSize: root.valueFont.pixelSize

    //            text: root.valueText

    //            color: root.valueColor
    //        }
    //        CustomText {

    //            Layout.alignment: Qt.AlignVCenter

    //            font.family: root.dimensionFont.family
    //            font.pixelSize: root.dimensionFont.pixelSize

    //            text: root.dimensionText

    //            color: root.dimensionColor
    //        }
    //    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

