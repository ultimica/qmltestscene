import QtQuick 2.15
import QtQuick.Controls 1.4

Item{
    id:item

    property alias tableItemDelegate: tableView.itemDelegate
    property alias tableHeaderDelegate: tableView.headerDelegate
    property alias tableRowDelegate: tableView.rowDelegate
    property alias tableModel : tableView.model
    property bool isVScrollVisible : tableView.__verticalScrollBar.visible

    Rectangle{
        id: leftpane
        anchors.left:parent.left
        anchors.top:parent.top
        anchors.bottom:parent.bottom
        width:parent.width*2/3
    }
    Rectangle{
        id: rightpane
        anchors.left:leftpane.right
        anchors.top:parent.top
        anchors.bottom:parent.bottom        
        anchors.right:parent.right
    }

    TableView {
        id: tableView
        anchors.fill : leftpane
        model:dymmymodel
     //   verticalScrollBarPolicy:Qt.ScrollBarAlwaysOn

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
    ListModel{
        id:dymmymodel
        ListElement {
        model_name: "P5_1"
        screen_size: "7"
        resolution: "800x600"
        }
        ListElement {
        model_name: "P5_2"
        screen_size: "7.5"
        resolution: "800x600"
        }
        ListElement {
         model_name: "P5_144"
        screen_size: "15"
        resolution: "1024x768"
        }
    }
}
