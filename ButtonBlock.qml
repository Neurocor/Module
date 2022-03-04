import QtQuick
import QtQuick.Controls

GridView {
    id: root

    required property int startValue
    required property int endValue
    required property int colsCount
    required property int rowsCount
    readonly property int elmsCount: colsCount * rowsCount
    readonly property int step: (endValue - startValue) / (elmsCount - 1)
    property real scaleVal: 1
    property var currentType: CustomButton.NoType
    readonly property var currentChangeMode: CustomButton.Value

    property var manager
    //    property bool disableWhenClicked: false
    cellWidth: width / colsCount
    cellHeight: height / rowsCount
    model: elmsCount
    delegate: Item {
        width: root.cellWidth
        height: root.cellHeight
        CustomButton {
            width: Math.min(parent.width * root.scaleVal,
                            parent.height * root.scaleVal)
            height: Math.min(parent.width * root.scaleVal,
                             parent.height * root.scaleVal)
            anchors.centerIn: parent
            title: index * step
            currentType: grid.currentType
            currentChangeMode: grid.currentChangeMode
            enabled: grid.enabled
            manager: root.manager
        }
    }
}
