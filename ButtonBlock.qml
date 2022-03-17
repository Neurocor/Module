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
            //            width: Math.min(parent.width * root.scaleVal,
            //                            parent.height * root.scaleVal)
            //            height: Math.min(parent.width * root.scaleVal,
            //                             parent.height * root.scaleVal)
            width: Math.min(parent.width, parent.height) * root.scaleVal
            height: width
            anchors.centerIn: parent
            title: index * step
            currentType: root.currentType
            currentChangeMode: root.currentChangeMode
            enabled: root.enabled
            manager: root.manager
        }
    }
}
