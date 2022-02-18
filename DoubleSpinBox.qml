import QtQuick 2.15
import QtQuick.Controls 2.15

SpinBox {

    id:dspinbox

    property int decimals: 0
    property real minVal : 0
    property real maxVal : 99
    property real step : 1
    readonly property real scale: Math.pow(10,decimals)
    readonly property real realVal: value/Math.pow(10,decimals)
    value: minVal

    from:minVal
    to:maxVal*scale
    stepSize: Math.max(step*scale,1)

    textFromValue: function(value, locale) {
        return Number(value / dspinbox.scale).toLocaleString(locale, 'f', dspinbox.decimals)
    }

    valueFromText: function(text, locale) {
        return Number.fromLocaleString(locale, text) * dspinbox.scale
    }

}
