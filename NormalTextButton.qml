import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Window 2.10

Item{
    id:root 
    property string displstr :"TEST"
    property bool ishover : false
    width: 100
    height: 30
    Rectangle{
        anchors.fill : parent
        color: "#404040" 
        border.width:2
        border.color: ishover ?"#EF862F" : "#FFFFFF"
        Text{
            anchors.fill : parent
            anchors.margins : 4
            text:root.displstr
            color:"#FFFFFF"
            horizontalAlignment :  Text.AlignHCenter
            verticalAlignment : Text.AlignVCenter
            font.family: "Helvetica"
            font.pixelSize: 20
        }
        MouseArea{
            anchors.fill : parent
            hoverEnabled:true
            onEntered:{
                root.ishover=true;
            }
            onExited:{
                root.ishover=false;
            }                    
            onClicked:{
                // root.clicking_tab(root);
            }
        }
    }
}