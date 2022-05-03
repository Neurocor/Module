import QtQuick 2.15

Item {
    id: root

    required property real maxHeight

    property var values: []
    property real padding: 5
    property int activeHist: -1 // -1: All enabled; 0: All Active; val: Active val Hist
    property color enableColor: "#aeafb1"
    property color activeColor: "#ff4b00"

    property string title
    property color titleColor: "white"

    property font font

    //    visible: values.length
    Canvas {

        id: graph

        width: parent.width
        height: parent.height * 60 / 100

        //        function max(v1, v2) {
        //            return (v1 > v2) ? v1 : v2
        //        }
        function findMaxHeight(values) {
            if (!values.length || !values[0].length)
                return 0

            let tmpMax = values[0][1]
            //            for (let val in values) {
            //                tmpMax = Math.max(tmpMax, val[1])
            //            }
            for (var i = 0; i < values.length; ++i) {
                tmpMax = Math.max(tmpMax, values[i][1])
            }
            return tmpMax
        }

        function calcWidth(values) {
            let tmpW = 0
            //            for (let val in values) {
            //                tmpW += val[0]
            //            }
            for (var i = 0; i < values.length; ++i) {
                tmpW += values[i][0]
            }

            return tmpW
        }

        function drawRects(ctx, values) {
            ctx.reset()
            ctx.save()

            let currentPos = 0

            //            let maxH = findMaxHeight(values)
            let maxH = maxHeight

            let genW = calcWidth(values)

            //            for (let val in values) {
            for (var curIndex = 0; curIndex < values.length; ++curIndex) {

                const val = values[curIndex]

                ctx.beginPath()

                if (root.activeHist >= 0 && root.activeHist < values.length
                        && curIndex === root.activeHist) {
                    ctx.fillStyle = root.activeColor
                } else if (root.activeHist === values.length) {
                    ctx.fillStyle = root.activeColor
                } else {
                    ctx.fillStyle = root.enableColor
                }
                let currentWidth = width * val[0]
                    * (100 - root.padding * (values.length + 1)) / genW / 100

                let currentHeight = 0

                if (maxH) {
                    currentHeight = val[1] * height / maxH * 90 / 100 + height * 5 / 100
                } else {
                    currentHeight = height * 95 / 100
                }

                ctx.rect((curIndex + 1) * width * padding / 100 + currentPos,
                         height - currentHeight, currentWidth, currentHeight)
                ctx.fill()
                ctx.closePath()
                currentPos += currentWidth
            }
            ctx.restore()
        }

        onPaint: {

            drawRects(getContext("2d"), root.values)
        }
    }

    CustomText {

        id: text

        width: parent.width
        height: parent.height * 40 / 100

        anchors.top: graph.bottom

        text: title
        color: titleColor

        font.family: root.font.family
        font.pixelSize: root.font ? root.font.pixelSize : height * 4 / 10
    }

    onActiveHistChanged: {
        graph.requestPaint()
    }

    onPaddingChanged: {
        graph.requestPaint()
    }
    onValuesChanged: {
        graph.requestPaint()

        //        activeHist = values.length
    }
}
