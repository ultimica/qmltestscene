import QtQuick 2.10
import QtQuick.Controls 2.3


Item {
    id:root
    property bool isPass : false
    
    property int totalcount : 0

   // signal welcome()

    CircleBtn{  
        id:c2
        
        x:200
        y:100
    }

    CircleBtn{  
        id:c3
        x:300
        y:100
    }

    CircleBtn{  
        id:c4
        x:100
        y:200
    }

    CircleBtn{  
        id:c5
        x:200
        y:200
    }

    CircleBtn{  
        id:c6
        x:300
        y:200
    }

    CircleBtn{  
        id:c7
        x:100
        y:300
    }

    CircleBtn{  
        id:c8
        x:200
        y:300
    }

    CircleBtn{  
        id:c9
        x:300
        y:300
    }


    MouseArea{
        id: mmctrl
        anchors.fill : parent

        onClicked:{
            root.clicking_null();
        }
    }
    
    
    CircleBtn{  
        id:c1
        x:100
        y:100
    }


    Component.onCompleted:{
        c1.clicking_btn.connect(root.on_clicking_cir);
    }


    function clicking_null()
    {
        totalcount=0;
    }
    function on_clicking_cir(sender)
    {
        totalcount=totalcount+1;
        if(totalcount>=3)
            root.isPass=true;
       // console.log(totalcount);
    }
}
