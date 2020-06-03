import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Window 2.10

Rectangle {
    width: 1024
    height: 768

    property int borderwidth: 10

    property var activetab 

    Rectangle {
        id: rectb
        color: "#00000000"
        border.color: "#47342a"
        border.width: borderwidth
        anchors.fill: parent

        Rectangle {
            id: leftpane
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: 216
            color:  "#0a0808"
            anchors.leftMargin: borderwidth
            anchors.topMargin: borderwidth
            anchors.bottomMargin: borderwidth
        }

        Rectangle {
            id: rightpane
            color: "#83786a"
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
                color: "#00000000"
                Text {
                    color:  "#ffe5e5"
                    anchors.margins: 2
                    text: qsTr("FvDesigner")
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 9
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalBottom
                    font.family: "Courier"

                    font.pixelSize: 80
                }
            }

            Rectangle {
                id: recthmi
                width: column.width
                height: 80
                border.color: "#f47a3d"
                color: (activetab == recthmi ) ? "#83786a" : "#00000000"
                Text {
                    color:  "#ffe5e5" 
                    anchors.margins: 2
                    text: qsTr("HMI")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.family: "Courier"

                    font.pixelSize: 80
                }
                MouseArea{
                    anchors.fill : parent
                    onClicked:{
                        activetab=parent
                    }
                }
            }

            Rectangle {
                id: rectplc
                width: column.width
                height: 80
                border.color: "#f47a3d"
                color: (activetab == rectplc ) ? "#83786a" : "#00000000"
                Text {
                    color:  "#ffe5e5" 
                    anchors.fill: parent
                    anchors.margins: 2
                    text: qsTr("PLC")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.family: "Courier"

                    font.pixelSize: 80
                }
                MouseArea{
                    anchors.fill : parent
                    onClicked:{
                        activetab=parent
                    }
                }
            }
            Rectangle {
                id :rectloc
                width: column.width
                height: 80
                border.color: "#f47a3d"
                color: (activetab == rectloc ) ? "#83786a" : "#00000000"
                Text {
                    color:  "#ffe5e5" 
                    anchors.fill: parent
                    anchors.margins: 2
                    text: qsTr("Location")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.family: "Courier"
                    font.pixelSize: 80
                }

                MouseArea{
                    anchors.fill : parent
                    onClicked:{
                        activetab=parent
                    }
                }
            }
        }
    }
}
