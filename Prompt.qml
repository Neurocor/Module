import QtQuick 2.15

Item {
    id: root

    enum Side {
        Left,
        Center,
        Right
    }
    property var currentSide

    property string titleText
    required property bool showArrow
    property real titleSize: height / 3

    property color titleColor: "white"
    property color promptColor: "#0085BA"

    onCurrentSideChanged: canvas.requestPaint()
    onPromptColorChanged: canvas.requestPaint()

    CustomText {
        id: textId
        text: titleText

        anchors.right: if (currentSide === Prompt.Right)
                           canvasCont.left
        anchors.left: if (currentSide === Prompt.Left)
                          canvasCont.right
        anchors.horizontalCenter: if (currentSide === Prompt.Center)
                                      parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        color: titleColor
        font.pixelSize: titleSize
    }
    Item {
        visible: showArrow
        id: canvasCont
        width: Math.min(parent.width, parent.height)
        height: Math.min(parent.width, parent.height)
        anchors.right: if (currentSide === Prompt.Right)
                           parent.right
        anchors.left: if (currentSide === Prompt.Left)
                          parent.left
        Canvas {
            id: canvas
            width: parent.width * 8 / 10
            height: parent.height * 8 / 10
            anchors.centerIn: parent
            property point center: Qt.point(width / 2, height / 2)
            antialiasing: true
            onPaint: {
                var ctx = getContext("2d")

                let startPos = 0
                let endPos = 0

                ctx.save()
                ctx.reset()
                ctx.strokeStyle = root.promptColor
                ctx.lineWidth = 5
                ctx.beginPath()
                startPos = width / 4
                if (currentSide === Prompt.Left) {
                    startPos *= 3
                    endPos = startPos / 3
                } else if (currentSide === Prompt.Right) {
                    endPos = startPos * 3
                }

                ctx.moveTo(startPos, 0)
                ctx.lineTo(endPos, height / 2)
                ctx.lineTo(startPos, height)
                ctx.stroke()

                ctx.restore()
            }
        }
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.6600000262260437;height:480;width:640}D{i:1;anchors_width:320}
}
##^##*/

