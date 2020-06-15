import QtQuick 2.15
import QtQuick.Controls 1.4

Item{
    id:item
    anchors.fill : parent
    Rectangle{
        color:"#515151"
        anchors.fill:parent

        Image{
            id:imgrect
            anchors.top:parent.top
            anchors.left:parent.left
            anchors.topMargin:100
            anchors.leftMargin:30
            width:616
            height:460
            source: "plcsel.jpg"
        } 
    }
   
}
