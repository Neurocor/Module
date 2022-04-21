import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: root

    property alias table: tableView
    property alias model: tableView.model
    property int currentIndex

    signal cellClicked(int row, int col)

    function updateData(row, val) {
        //        tableView.model.display = val
        tableView.model.speed = val
    }

    HorizontalHeaderView {
        //        width: parent.width
        id: horizontalHeader
        syncView: tableView
        anchors.right: tableView.right
    }

    VerticalHeaderView {
        //        height: parent.height
        id: verticalHeader
        syncView: tableView
        anchors.top: tableView.top
    }

    TableView {
        id: tableView

        clip: true

        width: parent.width - verticalHeader.width
        height: parent.height - horizontalHeader.height

        anchors.top: horizontalHeader.bottom
        anchors.left: verticalHeader.right

        delegate: ItemDelegate {

            implicitHeight: tableView.height / 4
            implicitWidth: tableView.width / tableView.model.columnCount()
            contentItem: CustomText {
                anchors.centerIn: parent
                text: model.value
                textSize: 24

                onTextChanged: text => model.value = parseFloat(text)
            }

            background: Rectangle {
                visible: model.index % tableView.model.rowCount(
                             ) == currentIndex
                color: "#aeafb1"
            }

            onClicked: {
                let curRow = parseInt(model.index % tableView.model.rowCount())
                let curCol = parseInt(model.index / tableView.model.rowCount())
                cellClicked(curRow, curCol)
            }
        }
    }
}
