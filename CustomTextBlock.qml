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
    property font titleFont: font
    property font valueFont: font
    property font dimensionFont: font

    signal clicked

    CustomText {

        id: titleCont

        width: parent.width
        height: parent.height / 4

        font.family: root.titleFont.family
        font.pixelSize: 20

        color: root.titleColor

        text: root.titleText
    }

    RowLayout {

        id: rowCont

        anchors.horizontalCenter: titleCont.horizontalCenter

        CustomText {

            Layout.alignment: Qt.AlignVCenter

            font.family: root.valueFont.family
            font.pixelSize: titleCont.font.pixelSize * 4

            text: root.valueText

            color: root.valueColor
        }
        CustomText {

            Layout.alignment: Qt.AlignVCenter

            font.family: root.dimensionFont.family
            font.pixelSize: titleCont.font.pixelSize * 2

            text: root.dimensionText

            color: root.dimensionColor
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

