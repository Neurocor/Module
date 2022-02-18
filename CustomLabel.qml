import QtQuick 2.15
import QtQuick.Controls 2.15

Label {

    property string fontFamily : currentFont.name
    color: "white"
    font.family: fontFamily
}
