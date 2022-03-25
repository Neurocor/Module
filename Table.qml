import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Item {
    id: root

    property alias model: tableView.model
    property int currentIndex

    signal cellClicked(int row, int col)

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
                id: txt
                anchors.centerIn: parent
                text: model.display
                textSize: 24
            }

            background: Rectangle {
                visible: model.index % tableView.model.rowCount(
                             ) == currentIndex
                color: "#aeafb1"
            }

            onClicked: {
                let curRow = model.index % tableView.model.rowCount()
                cellClicked(curRow, -1)
            }
        }
    }
}
