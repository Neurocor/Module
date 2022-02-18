import QtQuick 2.0

Text {

    id: root

    property bool ckeckNumber: false
    property int decimal: 1
    property string demensionText

    color: "white"
    font.family: currentFont.name

    verticalAlignment: CustomText.AlignVCenter
    horizontalAlignment: CustomText.AlignHCenter

    onTextChanged: {


        let num=parseInt(text,10);
        let num2=parseFloat(text);
        let isNan=isNaN();

        root.text=ckeckNumber?num:text;

    }

}
