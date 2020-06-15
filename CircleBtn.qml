import QtQuick 2.10
import QtQuick.Controls 2.3


Item {
    id:root
    property bool isActive : false
    property bool ishovering : false
    signal clicking_btn(var sender)

    property int availablelen:150
    property int radius : availablelen/5
    width:availablelen
    height:availablelen
    Rectangle{
        
        anchors.horizontalCenter: root.horizontalCenter
        anchors.verticalCenter: root.verticalCenter
        
        width:root.radius
        height:root.radius
        radius : root.radius/2

        color: ishovering ? "red": "green"
        MouseArea{
            anchors.fill : parent
            hoverEnabled:true
            onEntered:{
                root.ishovering=true;
            }
            onExited:{
                root.ishovering=false;
            }                    
            onClicked:{
                root.clicking_btn(root);
            }
        }
    }
}
