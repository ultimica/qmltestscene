import QtQuick 2.15
Item{
    id:root
    
    property bool isShow : false

    Rectangle{
        visible:isShow
        anchors.fill :parent
        border.color : "#515151"
        color :"#6B6B6B"

        Text{
            anchors.fill : parent
            anchors.leftMargin:5
            text:styleData.value
            verticalAlignment:Text.AlignVCenter
            font.pointSize:12
            font.bold : true
            color : "#FFFFFF"
        }  
    }
    
}