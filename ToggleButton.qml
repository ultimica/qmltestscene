import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Window 2.10

Item{
    id:root 
    property string displstr :""
    property bool isToggle : false
    width: 100
    height: 40
    Rectangle{
        anchors.fill : parent
        color: isToggle ? "#FF5A23" : "#6A9496" 
        Text{
            anchors.fill : parent
            anchors.margins : 4
            text:root.displstr
        }
        MouseArea{
            anchors.fill : parent
            onClicked:{
                isToggle=!isToggle;
            }
        }
    }
}