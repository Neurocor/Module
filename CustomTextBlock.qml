import QtQuick 2.15

Item {

    id: root

    property string titleText
    property real value
    property string valueText
    property bool isNumber: true
    property string dimensionText

    property int titleSize: 12
    readonly property int valueSize: titleSize * 4
    readonly property int dimensionSize: titleSize * 2
    property int padding: 5

    property color titleColor: "white"
    property color valueColor: titleColor
    property color dimensionColor: "#afafaf"

    property color disabledColor: "#494949"

    property bool titleBold: false
    property bool valueBold: false
    property bool dimensionBold: false

    property bool isEnabled: true

    height: (titleContain.height + valuesContain.height)
            + (titleContain.height + valuesContain.height) * padding / 50

    onValueChanged: {

        valueID.text = root.value.toFixed(1)
    }

    Item {
        id: titleContain
        height: titleSize
        width: parent.width

        CustomText {

            id: titleId
            text: titleText
            font.bold: titleBold
            font.pixelSize: titleSize
            anchors.centerIn: parent
            color: isEnabled ? titleColor : disabledColor
        }
    }
    Row {
        id: valuesContain
        height: Math.max(valueSize, dimensionSize)
        anchors.top: titleContain.bottom
        anchors.horizontalCenter: titleContain.horizontalCenter

        CustomText {

            id: valueID
            text: isNumber ? value : valueText
            font.bold: valueBold
            font.pixelSize: valueSize
            color: isEnabled ? valueColor : disabledColor
        }

        CustomText {

            id: dimensionID
            text: dimensionText
            anchors.verticalCenter: valueID.verticalCenter
            font.bold: dimensionBold
            font.pixelSize: dimensionSize
            color: isEnabled ? dimensionColor : disabledColor
        }
    }
}
