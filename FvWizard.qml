import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Window 2.10


Item {
    id:root
    visible: true
    // title: qsTr("FvDesigner")
    // width: 1024
    // height: 768

    property int borderwidth: 5

    property var activetab 
    property bool isNewmode : false

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
            anchors.bottomMargin: 80+borderwidth
        }

        Rectangle{
            id: btnleftpane
            color:  "#212121"
            anchors.top:leftpane.bottom
            anchors.topMargin:borderwidth
            anchors.left:parent.left
            anchors.right:leftpane.right
            anchors.bottom:parent.bottom
            Column{
                anchors.fill: parent   
                anchors.margins: borderwidth
                spacing:5            
                Button{
                    width: 80
                    height:30
                    text:"style"

                }

                Button{
                    width:80
                    height:30

                    text:"language"
                }

            }

        }
        Column{
            id:setting
            anchors.fill : leftpane
            visible :isNewmode
            Rectangle {
                id: recthead2
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
                property string qml_source : "HMI_section.qml"
                Text{
                    anchors.bottom:parent.bottom
                    anchors.left:parent.left
                    anchors.leftMargin:10
                    text:"Current Model: P5070N"
                    font.pixelSize:14
                    color:  "#FFFFFF"
                }
            }            
            LeftTabButton{
                id:plc
                displstr:qsTr("PLC")
                property string qml_source : "PLC_section.qml"
            }         
            // LeftTabButton{
            //     id:loc
            //     displstr:qsTr("Location")
            //     property string qml_source : "Location_section.qml"
            // }      
            Rectangle{
                anchors.left:parent.left
                anchors.right:parent.right
                height:100
                color:"#00000000"
                Image{
                    id:imgrect
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left:parent.left
                    anchors.leftMargin:25

                    width:50
                    height:50    
                    source: "Back_Arrow.svg.png"
                } 
                MouseArea{
                    anchors.fill:imgrect
                    onClicked:{
                        root.isNewmode=false;
                        on_clicking_tab(file);
                    }
                }

                Button{
                    text:"Finished"
                    anchors.right:parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin:20
                    width:100

                }
            } 
            
        }

        Column {
            id: column
            anchors.fill: leftpane
            visible: !isNewmode
            Rectangle {
                id: recthead
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
                id:file
                displstr:qsTr("File")
                property string qml_source : "File_section.qml"
            }     
  
        }

            
        Rectangle {
            id: rightpane
            color: "#7F7F7F"
            anchors.leftMargin: -2
            anchors.left: column.right
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: borderwidth
            anchors.topMargin: borderwidth
            anchors.bottomMargin: borderwidth


            Loader{
                id:lod
                anchors.fill : parent
                anchors.margins : 5
                focus:true
                onLoaded:{
                    console.log("Load Success =="+source);
                    if(lod.item.enterNewProject)
                    {
                        console.log("CONNN!!");
                        lod.item.enterNewProject.connect(on_entering_New);
                    }
                }
            }

        }
    }




    Component.onCompleted:{
        file.clicking_tab.connect(root.on_clicking_tab);
        hmi.clicking_tab.connect(root.on_clicking_tab);
        plc.clicking_tab.connect(root.on_clicking_tab);
        // loc.clicking_tab.connect(root.on_clicking_tab);
        on_clicking_tab(file)
    }
    function on_clicking_tab(sender)
    {
        file.isActive=false;
        hmi.isActive=false;
        plc.isActive=false;
        // loc.isActive=false;
        sender.isActive=true;
        console.log(sender.qml_source)
        lod.source=sender.qml_source;


    }

    function on_entering_New()
    {
        root.isNewmode=true;
        on_clicking_tab(hmi);
    }
}
