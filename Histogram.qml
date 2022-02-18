import QtQuick 2.15

Item {
    id: root

    property var values: []
    property real padding: 0
    property int activeHist: -1 // -1: All enabled; 0: All Active; val: Active val Hist
    property color enableColor: "#aeafb1"
    property color activeColor: "#ff4b00"

    property string title: ""
    property string titleFontName: currentFont.name
    property color titleColor: "white"
    property real titleSize: height/3

//    visible: values.length

    Canvas{

        id: graph

        width: parent.width
        height: parent.height *60/100

        function max(v1,v2){
            return (v1>v2) ? v1 : v2;
        }

        function findMaxHeight(values){
            if(!values.length|| !values[0].length)
                return 0;

            let tmpMax=values[0][1];
            for(let val of values){
                tmpMax=max(tmpMax,val[1]);
            }
            return tmpMax;
        }

        function calcWidth(values){
            let tmpW=0;
            for(let val of values){
                tmpW+=val[0];
            }
            return tmpW;
        }



        function drawRects(ctx,values)
        {
            let currentPos = 0

            let maxH=findMaxHeight(values)

            let genW=calcWidth(values)

            for(let val of values){

                let curIndex = values.indexOf(val);

                ctx.beginPath()
                if (root.activeHist > 0 && root.activeHist <= values.length
                        && curIndex + 1 == root.activeHist) {
                    ctx.fillStyle = root.activeColor
                } else if (root.activeHist == 0) {
                    ctx.fillStyle = root.activeColor
                } else {
                    ctx.fillStyle = root.enableColor
                }

                let currentWidth = width * val[0]
                    * (100 - root.padding * (values.length + 1)) / genW / 100

                let currentHeight = 0

                if(maxH){
                    currentHeight=val[1] * height / maxH * 90 / 100 + height * 5 / 100
                }else{
                    currentHeight=height*95/100
                }


                ctx.rect((curIndex + 1) * width * padding / 100 + currentPos,
                         height - currentHeight, currentWidth, currentHeight)
                ctx.fill()
                ctx.closePath()
                currentPos += currentWidth

            }
        }

        onPaint: {
            let ctx = getContext("2d")
            ctx.reset()
            ctx.save()

            drawRects(ctx, root.values)
            ctx.restore()
        }
    }

    CustomText{

        id:text

        width: parent.width
        height: parent.height*40/100

        anchors.top: graph.bottom

        text: title
        color: titleColor
        font.pixelSize: height*4/10

    }

    onActiveHistChanged: {
        graph.requestPaint()
    }

    onPaddingChanged: {
        graph.requestPaint()
    }
    onValuesChanged: {
         graph.requestPaint()
    }
}
