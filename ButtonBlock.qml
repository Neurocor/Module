import QtQuick 2.15


GridView {
    id:grid

    required property int startValue
    required property int endValue
    required property int colsCount
    required property int rowsCount
    readonly property int elmsCount: colsCount * rowsCount
    readonly property int step: (endValue - startValue) / (elmsCount - 1)
    property real scaleVal: 1
    property var currentType: CustomButton.NoType
    readonly property var currentChangeMode: CustomButton.Value

//    property bool disableWhenClicked: false

    cellWidth: width/colsCount
    cellHeight: height/rowsCount
    model: elmsCount
    delegate:Item{
        width: grid.cellWidth
        height: grid.cellHeight
        CustomButton{
            width: Math.min(parent.width*grid.scaleVal,parent.height*grid.scaleVal)
            height: Math.min(parent.width*grid.scaleVal,parent.height*grid.scaleVal)
            anchors.centerIn: parent
            title: index*step
            currentType:grid.currentType
            currentChangeMode:grid.currentChangeMode
            enabled: grid.enabled
        }
    }
}

