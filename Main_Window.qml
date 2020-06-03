import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Window 2.10


Rectangle {
    id:root
    width: 1024
    height: 768

    property int borderwidth: 5

    property var activetab 

    Rectangle {
        id: rectb
        color: "#00000000"
        border.color: "#000000"
        border.width: borderwidth
        anchors.fill: parent

        Rectangle {
            id: leftpane
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: 216
            color:  "#212121"
            anchors.leftMargin: borderwidth
            anchors.topMargin: borderwidth
            anchors.bottomMargin: borderwidth
        }

        Rectangle {
            id: rightpane
            color: "#7F7F7F"
            anchors.leftMargin: 0
            anchors.left: column.right
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: borderwidth
            anchors.topMargin: borderwidth
            anchors.bottomMargin: borderwidth
        }

        Column {
            id: column
            anchors.fill: leftpane

            width: 216

            Rectangle {
                id: rectangle1
                width: column.width
                height: 120
                color: "#000000"
                Text {
                    color:  "#FF8F07"
                    anchors.margins: 2
                    anchors.topMargin:30
                    anchors.leftMargin:5
                    text: qsTr("FvDesigner")
                    anchors.fill: parent
                    font.family: "Helvetica"
                    font.weight: Font.ExtraBold
                    font.pixelSize: 35

                }
            }

            LeftTabButton{
                id:hmi
                displstr:qsTr("HMI")
            }            
            LeftTabButton{
                id:plc
                displstr:qsTr("PLC")
            }         
            LeftTabButton{
                id:loc
                displstr:qsTr("LOC")
            }         
        }
    }

    Component.onCompleted:{
        hmi.clicking_tab.connect(root.on_clicking_tab);
        plc.clicking_tab.connect(root.on_clicking_tab);
        loc.clicking_tab.connect(root.on_clicking_tab);
    }
    function on_clicking_tab(sender)
    {
        hmi.isActive=false;
        plc.isActive=false;
        loc.isActive=false;
        sender.isActive=true;

    }
}
