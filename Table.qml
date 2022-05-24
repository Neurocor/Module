import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: root

    property alias hHeader: horizontalHeader
    property alias vHeader: verticalHeader
    property alias table: tableView
    property alias model: tableView.model
    property int currentIndex: -1
    property var values
    property font font

    signal cellClicked(int row, int col)

    implicitWidth: Math.max(
                       horizontalHeader.implicitWidth,
                       tableView.implicitWidth) + verticalHeader.implicitWidth

    implicitHeight: Math.max(
                        verticalHeader.implicitHeight,
                        tableView.implicitHeight) + horizontalHeader.implicitHeight

    function rowByIndex(index, rowCount) {
        return parseInt(index % rowCount)
    }
    function colByIndex(index, rowCount) {
        return parseInt(index / rowCount)
    }

    HorizontalHeaderView {
        id: horizontalHeader
        syncView: tableView
        anchors.left: tableView.left

        implicitHeight: 40
        implicitWidth: 500

        width: parent.width - verticalHeader.width
        height: implicitHeight
    }

    VerticalHeaderView {
        //        height: parent.height
        id: verticalHeader
        syncView: tableView
        anchors.top: tableView.top

        implicitHeight: 500
        implicitWidth: 40

        height: parent.height - horizontalHeader.implicitHeight
        width: implicitWidth
    }

    TableView {
        id: tableView

        clip: true

        implicitHeight: 500
        implicitWidth: 500

        width: parent.width - verticalHeader.width
        height: parent.height - horizontalHeader.height
        anchors.top: horizontalHeader.bottom
        anchors.left: verticalHeader.right

        interactive: tableView.rows > 4

        delegate: CustomItemDelegate {

            inActiveRow: rowByIndex(model.index,
                                    tableView.rows) === root.currentIndex

            implicitHeight: tableView.height / 4
            implicitWidth: tableView.width / tableView.columns

            text: model.value

            font: root.font

            onClicked: {
                const curRow = rowByIndex(model.index, tableView.rows)
                const curCol = colByIndex(model.index, tableView.rows)
                cellClicked(curRow, curCol)

                //                root.values = []
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

