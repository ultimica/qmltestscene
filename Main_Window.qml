import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Window 2.10


Window {
    id:root
    visible: true
    title: qsTr("FvDesigner")
    width: 1024
    height: 768

        FvWizard{
            anchors.fill : parent
            visible:pid.visible==false
        }

        Pass{
            id:pid
            anchors.fill : parent
            visible:isPass==false
        }

}   
