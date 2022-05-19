import QtQuick 2.15

Flipable {

    id: root

    property bool flipped: false

    property font font

    property string titleText
    property string frontTitleText: titleText
    property string backTitleText: titleText

    property string valueText
    property string frontValueText: valueText
    property string backValueText: valueText

    property string dimensionText
    property string frontDimensionText: dimensionText
    property string backDimensionText: dimensionText

    property color titleColor: "white"
    property color frontTitleColor: titleColor
    property color backTitleColor: titleColor

    property color valueColor: titleColor
    property color frontValueColor: valueColor
    property color backValueColor: valueColor

    property color dimensionColor: titleColor
    property color frontDimensionColor: dimensionColor
    property color backDimensionColor: dimensionColor

    property int frontTitleFontSize: font.pixelSize
    property int backTitleFontSize: frontTitleFontSize

    property int frontValueFontSize: frontTitleFontSize * 4
    property int backValueFontSize: frontValueFontSize

    property int frontDimensionFontSize: frontTitleFontSize * 2
    property int backDimensionFontSize: frontDimensionFontSize

    front: CustomTextBlock {

        anchors.centerIn: parent
        titleText: root.frontTitleText

        valueText: root.frontValueText
        dimensionText: root.frontDimensionText

        font.family: root.font.family

        titleFontSize: root.backTitleFontSize
        valueFontSize: root.backValueFontSize
        dimensionFontSize: root.backDimensionFontSize
    }

    back: CustomTextBlock {

        anchors.centerIn: parent
        titleText: root.backTitleText

        valueText: root.backValueText
        dimensionText: root.backDimensionText

        font.family: root.font

        titleFontSize: root.frontTitleFontSize
        valueFontSize: root.frontValueFontSize
        dimensionFontSize: root.frontDimensionFontSize
    }

    transform: Rotation {
        id: rotation
        origin.x: root.width / 2
        origin.y: root.height / 2
        axis.x: 1
        axis.y: 0
        axis.z: 0 // set axis.y to 1 to rotate around y-axis
        angle: 0 // the default angle
    }

    states: State {
        name: "back"
        PropertyChanges {
            target: rotation
            angle: 180
        }
        when: root.flipped
    }

    transitions: Transition {
        NumberAnimation {
            target: rotation
            property: "angle"
            duration: 1500
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.flipped = !root.flipped
    }
}
