import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Window 2.10

Item{
    id:root 
    property string displstr :""
    property bool isActive : false    
    width: parent.width
    height: 80
    signal clicking_tab(var sender)
    Rectangle {
        id: rectplc
        property bool ishovering :false
        property bool isActiveColor:  ( root.isActive || rectplc.ishovering)
        anchors.fill: parent
        border.color: "#f47a3d"
        color: isActiveColor ? "#7F7F7F" : "#00000000"
        Text {
            color:  "#ffe5e5" 
            anchors.margins: 2
            text: root.displstr
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.family: "Helvetica"
            font.pixelSize: 30
        }
        MouseArea{
            anchors.fill : parent
            hoverEnabled:true
            onEntered:{
                rectplc.ishovering=true;
            }
            onExited:{
                rectplc.ishovering=false;
            }                    
            onClicked:{
                root.clicking_tab(root);
            }
        }
    }
}