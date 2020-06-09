import QtQuick 2.10
import QtQuick.Controls 2.3


Item {
    id:root
    property bool isActive : false
    property bool ishovering : false
    signal clicking_btn(var sender)

    Rectangle{
        width: 20
        height: 20
        radius : 10

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
