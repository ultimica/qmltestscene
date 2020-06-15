import QtQuick 2.15
import QtQuick.Controls 1.4

Item{
    id:item
    signal enterNewProject()
    focus: true
    Rectangle{
        color:"#515151"
        anchors.fill:parent
        
         Button{
            id:filesec
            x:50
            y:50
            width:100
            height:30
            text:"New Project"
            onClicked:{
                item.enterNewProject();
            }
        }

        Rectangle{
            anchors.left:filesec.right
            anchors.leftMargin:10
            anchors.top:filesec.top
            width:250
            height:30
            TextBlock{
            anchors.fill:parent
            disptext:"D:/HMI/Project/untitled.fpj"
            }
        }

        Rectangle{
            id:filerecent

            anchors.top:filesec.bottom
            anchors.topMargin:50
            anchors.left:filesec.left

            width:500
            height:400
            TextBlock{
            anchors.fill:parent
            disptext:"Recentlist\nD:/Project1.fpj\nD:/Project2.fpj\nD:/Project3.fpj\nD:/Project4.fpj"
            }

        }
    }
    
}
