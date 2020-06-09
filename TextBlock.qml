import QtQuick 2.15
import QtQuick.Controls 1.4

Item{
    id:item

    property string disptext :"BBXXCSDA"
    property int fontsize:12
    property string color : "#FFFFFF"
    property string bordercolor : "#000000"
        
    TextMetrics {
        id: textMetrics
        font.family: "Helvetica"
        // elide: Text.ElideMiddle
        // elideWidth: 100
        font.pixelSize: item.fontsize
        text: item.disptext
    }

    width:textMetrics.boundingRect.width+10
    height:textMetrics.boundingRect.height+10

    Rectangle{
        anchors.fill :parent
        border.color : item.bordercolor
        border.width : 2
        color : item.color




        Text{
            anchors.fill : parent
            anchors.margins : 4
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.family: "Helvetica"
            
            text:textMetrics.elidedText
        }
    }
   
}
