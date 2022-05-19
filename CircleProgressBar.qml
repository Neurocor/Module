import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: root

    property real minimumValue: 0
    property real maximumValue: minimumValue
    property real currentValue: minimumValue

    property real nextValue: minimumValue

    property bool isNext: false

    property color backgroundColor: "#9f9f9f"
    property color foregroundColor: "#ff4b00"
    property color nextBorderColor: "white"

    property font font
    property int titleFontSize: font.pixelSize
    property int valueFontSize: titleFontSize * 4
    property int dimensionFontSize: titleFontSize * 2

    property string titleText
    property color titleColor: "white"
    property string dimensionText
    property color dimensionColor: titleColor
    property color nextColor: foregroundColor

    onCurrentValueChanged: {
        mainCont.valueText = root.currentValue.toFixed(1)
        canvas.requestPaint()
    }

    onNextValueChanged: {

        nextCont.valueText = root.nextValue.toFixed(1)
        canvas.requestPaint()
    }

    Canvas {
        id: canvas
        width: Math.min(parent.width, parent.height)
        height: width
        anchors.centerIn: parent
        antialiasing: true

        readonly property point center: Qt.point(width / 2, height / 2)

        readonly property real radiusSphere: Math.min(width, height) / 20
        readonly property real radius: (Math.min(width,
                                                 height) - radiusSphere * 2) / 2

        //        property real angle: (currentValue - minimumValue)
        //                             / (maximumValue - minimumValue) * 2 * Math.PI
        property real angle: calcAngle(currentValue)
        property real nextAngle: calcAngle(nextValue)

        readonly property real angleOffset: -Math.PI / 2

        function calcAngle(val) {
            return (val - minimumValue) / (maximumValue - minimumValue) * 2 * Math.PI
        }

        onPaint: {
            var ctx = getContext("2d")
            ctx.save()

            ctx.reset()

            ctx.beginPath()
            ctx.lineWidth = 1
            ctx.strokeStyle = root.backgroundColor
            ctx.arc(canvas.center.x, canvas.center.y, canvas.radius, 0,
                    Math.PI * 2)
            ctx.stroke()

            ctx.beginPath()
            ctx.lineWidth = radiusSphere * 2 / 2.75
            ctx.strokeStyle = root.foregroundColor
            ctx.arc(canvas.center.x, canvas.center.y, canvas.radius,
                    angleOffset, angleOffset + angle)
            ctx.stroke()

            ctx.beginPath()
            ctx.fillStyle = root.foregroundColor

            ctx.arc(Math.cos(angleOffset + angle) * radius + center.x, Math.sin(
                        angleOffset + angle) * radius + center.y,
                    radiusSphere, 0, Math.PI * 2)
            ctx.fill()

            if (isNext) {

                ctx.beginPath()
                ctx.fillStyle = nextBorderColor
                ctx.arc(Math.cos(angleOffset + nextAngle) * radius + center.x, Math.sin(
                            angleOffset + nextAngle) * radius + center.y,
                        radiusSphere, 0, Math.PI * 2)
                ctx.fill()

                ctx.beginPath()
                ctx.fillStyle = foregroundColor
                ctx.arc(Math.cos(angleOffset + nextAngle) * radius + center.x, Math.sin(
                            angleOffset + nextAngle) * radius + center.y,
                        radiusSphere * 8 / 10, 0, Math.PI * 2)
                ctx.fill()
            }

            ctx.restore()
        }
        CustomTextBlock {

            anchors.centerIn: parent

            id: mainCont

            titleText: root.titleText

            valueText: root.currentValue.toFixed(1)
            dimensionText: root.dimensionText

            font.family: root.font
            titleFontSize: root.titleFontSize
            valueFontSize: root.valueFontSize
            dimensionFontSize: root.dimensionFontSize

            //            titleFont: root.titleFont
            //            valueFont: root.valueFont
            //            dimensionFont: root.dimensionFont
        }
        CustomTextBlock {
            id: nextCont
            anchors.top: mainCont.bottom
            anchors.horizontalCenter: mainCont.horizontalCenter

            titleText: qsTr("NEXT")
            visible: root.isNext
            titleColor: root.nextColor

            valueText: root.nextValue.toFixed(1)

            font.family: root.font

            //            titleFont: root.titleFont
            //            valueFont: root.valueFont
            //            dimensionFont: root.dimensionFont
        }
    }
}
