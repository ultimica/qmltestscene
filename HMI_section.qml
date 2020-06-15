import QtQuick 2.15
import QtQuick.Controls 1.4

Item{
    id:item

    property alias tableItemDelegate: tableView.itemDelegate
    property alias tableHeaderDelegate: tableView.headerDelegate
    property alias tableRowDelegate: tableView.rowDelegate
    property alias tableModel : tableView.model
    property bool isVScrollVisible : tableView.__verticalScrollBar.visible
    focus: true
    Rectangle{
        id: leftpane
        color:"#515151"
        anchors.left:parent.left
        anchors.top:parent.top
        anchors.bottom:parent.bottom
        width:parent.width*2/3
    }
    Rectangle{
        id: rightpane
        color:"#515151"
        anchors.left:leftpane.right
        anchors.top:parent.top
        anchors.bottom:parent.bottom        
        anchors.right:parent.right
    }


    Column{
        id:lefcol
        anchors.fill : leftpane
        Rectangle{
            height:35
            anchors.left: parent.left
            anchors.right: parent.right
            color:"#212121"
            border.color:"#000000"
            border.width:3
            Row{
                anchors.fill :parent
                anchors.margins:5
                Text{
                anchors.top:parent.top
                anchors.bottom:parent.bottom
                width:200
                text:"Module Select"
                font.family: "Helvetica"
                font.pixelSize: 20
                color:"#FF966D"
                }
            }
            
        }
        Rectangle{
            id:optionrect
            anchors.left: parent.left
            anchors.right: parent.right
            height: 90
            color:"#00000000"
            border.color :"#000000"
            border.width:2
            Rectangle{
                id:searchbar
                anchors.left: parent.left
                anchors.leftMargin:2
                anchors.bottom: parent.bottom
                anchors.bottomMargin:2
                height:30
                width:150
                color:"#FFFFFF"
                border.color:"#878787"
                border.width:2
                Text{
                    anchors.fill :parent
                    anchors.margins:2
                    text:"Search Field"
                }
            }
            Rectangle{
                id: filtersection
                anchors.left:searchbar.right
                anchors.leftMargin:5
                anchors.top:parent.top
                anchors.right:parent.right
                anchors.bottom:parent.bottom
                color :"#00000000"
                Grid {
                    anchors.fill: parent
                    anchors.margins:5
                    columns: 3
                    spacing: 2
                    ToggleButton{displstr:"Ethernet"}
                    ToggleButton{displstr:"Bluetooth"}
                    ToggleButton{displstr:"COM(4)"}
                    ToggleButton{displstr:"PLCEmbedded"}
                }
                
            }
        }
        
        Rectangle{
            height:parent.height
            anchors.left: parent.left
            anchors.right: parent.right
            color:"#212121"
            border.color:"#000000"
            border.width:3

            TableView {
                id: tableView
                anchors.fill : parent
                anchors.margins : parent.border.width
                anchors.topMargin : 3
                model:dymmymodel
                headerDelegate:TableHeader{
                    height:20
                    isShow:(styleData.column==0 || styleData.column==1 || styleData.column==2)
                }
                rowDelegate: Item{
                    height:25//  (styleData.row %2 ==0) ?60 :100
                    Rectangle{
                        anchors.fill:parent
                        color : (styleData.row%2==0)?"#EDF9FF":"#FFFFFF";
                    }          
                } 
                property int rightmargin : isVScrollVisible ? 20 : 0 
                property int column1 : tableView.width*3/8
                property int column2 : tableView.width*2/8
                property int column3 : tableView.width-column1-column2-rightmargin
            
                TableViewColumn {
                    role: "model_name"
                    title: "Model"
                    width:tableView.column1
                    movable: false
                    resizable: false
                }

                TableViewColumn {
                    role: "screen_size"
                    title: "Screen Size"
                    width: tableView.column2
                    movable: false
                    resizable: false
                }
                TableViewColumn {
                    role: "resolution"
                    title: "Resolution"
                    width: tableView.column3
                    movable: false
                    resizable: false
                }

            }
        }
        
    }
//////////////////////////////////////////////  Right Part
//////////////////////////////////////////////
    Rectangle{
        anchors.fill: rightpane
        // anchors.bottomMargin:55
        color:"#00000000"
        border.color:"#000000"
        border.width:3
        
        Column{
            anchors.fill:parent
            Rectangle{
                width:1
                height:50
                color:"#00000000"
            }
            Rectangle{
                id: iconrect
                anchors.horizontalCenter : parent.horizontalCenter 
                width:220
                height:150
                // border.color:"green"
                color:"#00000000"
                Image{
                    id:himimg
                    source:"hmi-icon-6.jpg"
                    anchors.fill:parent
                }
            }

            Rectangle{
                id: desciption
                anchors.left:parent.left
                anchors.right:parent.right
                border.width:2
                border.color:"#FFFFFF"

            }
        }
        

    }

    // Rectangle{
    //     id: bottonToolPane
    //     color:"#515151"
    //     anchors.left: parent.left
    //     anchors.right:parent.right
    //     anchors.bottom:parent.bottom
    //     height : 55

    //     Button {
    //         text:"Finish"
    //         height:30
    //         width:80
    //         anchors.right:parent.right
    //         anchors.rightMargin:10
    //         anchors.bottom:parent.bottom
    //         anchors.bottomMargin:5
    //     }
    // }
/////////////////////////////////////////////// Model Data
///////////////////////////////////////////////    
    ListModel{
        id:dymmymodel
        ListElement {
            model_name: "P5_1"
            screen_size: 7
            resolution: "800x600"
        }
        ListElement {
            model_name: "P5_2"
            screen_size: 7.5
            resolution: "800x600"
        }
        ListElement {
            model_name: "P5_144"
            screen_size: 15
            resolution: "1024x768"
        }
    }
    Component.onCompleted:{
        for(var i=0;i<1000;i++)
        {
            var modelname="P5_"+(i+1);
            var screen=7+i;
            dymmymodel.append({"model_name": modelname, "screen_size":screen, "resolution":"800x600"})
        }
        
    }
}
