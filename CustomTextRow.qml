import QtQuick 2.15
import QtQuick.Layouts 1.15

Item {

    id: root

    implicitHeight: rowCont.implicitHeight
    implicitWidth: rowCont.implicitWidth

    property string valueText
    property string dimensionText

    property color valueColor: "white"
    property color dimensionColor: "#aeafb1"

    property font font
    property int valueFontSize: font.pixelSize
    property int dimensionFontSize: valueFontSize / 2

    RowLayout {

        id: rowCont

        CustomText {

            Layout.alignment: Qt.AlignVCenter

            font.family: root.font.family
            font.pixelSize: root.valueFontSize

            text: root.valueText

            color: root.valueColor
        }
        CustomText {

            Layout.alignment: Qt.AlignVCenter

            font.family: root.font.family
            font.pixelSize: root.dimensionFontSize

            text: root.dimensionText

            color: root.dimensionColor
        }
    }
}
