import QtQuick 2.15
import QtQuick.Controls 2.15

GridView {
    id: root

    required property int startValue
    required property int endValue
    required property int colsCount
    required property int rowsCount

    readonly property int elmsCount: colsCount * rowsCount
    readonly property int step: (endValue - startValue) / (elmsCount - 1)
    property real scaleVal: 1
    property int currentIndex: -1

    property font font

    property real currentValue: startValue

    signal buttonClicked(int value)

    cellWidth: width / colsCount
    cellHeight: height / rowsCount
    model: elmsCount
    delegate: Item {
        width: root.cellWidth
        height: root.cellHeight
        CustomButton {
            id: btn

            width: Math.min(parent.width, parent.height) * root.scaleVal
            height: width
            anchors.centerIn: parent
            text: index * root.step
            enabled: root.enabled && (parseFloat(text) !== currentValue)

            font.family: root.font.family
            font.pixelSize: root.font.pixelSize

            onClicked: {
                currentIndex = model.index

                root.buttonClicked(parseFloat(text))
            }
        }
    }
}
