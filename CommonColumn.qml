import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root

    property real minValue
    property real maxValue
    property real value

    property bool hasNextValue
    property real nextValue

    property string title
    property string dimension

    property alias topContainer: topCont
    property alias midContainer: midCont
    property alias botContainer: botCont

    property alias minusBtn: mnsBtn
    property alias plusBtn: plsBtn

    property font font

    Column {
        id: lcCont
        anchors.fill: parent
        scale: 0.8

        Control {
            id: topCont
            width: parent.width
            height: parent.height * 0.3
        }
        Control {
            id: midCont
            width: parent.width
            height: parent.height * 0.5

            contentItem: CircleProgressBar {
                minimumValue: root.minValue
                maximumValue: root.maxValue
                currentValue: root.value

                isNext: root.hasNextValue
                nextValue: root.nextValue

                titleText: root.title
                dimensionText: root.dimension

                font.family: root.font
                font.pixelSize: 24
            }
        }

        Control {
            id: botCont
            width: parent.width
            height: parent.height * 0.2

            contentItem: Row {

                id: btnsRow

                CustomButton {
                    id: mnsBtn
                    width: parent.width / 2
                    height: parent.height
                    ratioHtoW: 0.65

                    font.family: root.font

                    font.pixelSize: 48
                    enabled: root.value > root.minValue

                    autoRepeat: true

                    text: "-"
                }
                CustomButton {
                    id: plsBtn
                    width: parent.width / 2
                    height: parent.height
                    ratioHtoW: 0.65

                    font.family: root.font

                    font.pixelSize: 48

                    enabled: root.value < root.maxValue

                    autoRepeat: true

                    text: "+"
                }
            }
        }
    }
}
