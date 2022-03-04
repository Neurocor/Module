import QtQuick
import QtQuick.Controls

Button {

    id: root

    enum Type {
        NoType,
        Incline,
        Speed,
        Other
    }
    enum ChangeMode {
        NoChangeMode,
        Increase,
        Decrease,
        Value
    }

    property var currentType: Button.NoType
    property var currentChangeMode: Button.NoChangeMode

    property string title
    property string titleFontName: currentFont.name
    property color titleColor: "white"
    property real titleSize: height / 2

    property bool disableWhenClicked: false

    property int borderWidth: 1
    property color borderColor: "#8f8f8f"

    property color enabledColor: "#0085b8"
    property color disabledColor: "#2f2f2f"
    property color clickedColor: "#00729D"
    //    property color clickedColor: "#ff4b00"
    property color checkedColor: enabledColor

    property var manager: null

    hoverEnabled: false

    contentItem: CustomText {
        id: btnText
        text: title
        color: titleColor
        font.pixelSize: titleSize
    }

    background: Rectangle {
        color: if (enabled) {
                   if (checkable) {
                       if (checked) {
                           checkedColor
                       } else {
                           disabledColor
                       }
                   } else {
                       if (down) {
                           clickedColor
                       } else {
                           enabledColor
                       }
                   }
               } else {
                   disabledColor
               }
        radius: width
        border.width: borderWidth
        border.color: borderColor
    }

    Timer {
        id: longPressTimer
        repeat: true
        onTriggered: {
            changeValue(currentType, currentChangeMode)
            if (interval > 100)
                interval -= 50
        }
    }

    onPressedChanged: {
        longPressTimer.running = pressed
        longPressTimer.interval = 200
    }

    onClicked: {

        if (!manager)
            return

        changeValue(currentType, currentChangeMode)
        //        if(disableWhenClicked)
        //            enabled = false;
    }

    function changeSpeed(manager, changeMode) {

        switch (changeMode) {
        case CustomButton.Increase:
            manager.speed += 0.2
            break
        case CustomButton.Decrease:
            manager.speed -= 0.2
            break
        case CustomButton.Value:
            manager.speed = parseFloat(btnText.text)
            break
        default:
            break
        }
    }

    function changeIncline(manager, changeMode) {
        switch (changeMode) {
        case CustomButton.Increase:
            ++manager.incline
            break
        case CustomButton.Decrease:
            --manager.incline
            break
        case CustomButton.Value:
            manager.incline = parseFloat(btnText.text)
            break
        default:
            break
        }
    }

    function changeValue(type, changeMode) {

        switch (type) {
        case CustomButton.Incline:
            changeIncline(manager, changeMode)
            break
        case CustomButton.Speed:
            changeSpeed(manager, changeMode)
            break
        default:
            break
        }
    }
}
