import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15

Window {
    id: adminRootPage
    width: 2*Screen.width/5
    height: 2*Screen.height/2.5

    visible: true
    title: qsTr("Hello Admin")
    color: "#151515"
    property var infos: undefined

    onClosing: {
        splashScreen.visible = true
    }
    TabBar {
        id: bar
        width: parent.width
        TabButton {
            text: qsTr("insert user")
        }
        TabButton {
            text: qsTr("update test result")
        }
        TabButton {
            text: qsTr("dynamic queries")
        }
        TabButton {
            text: qsTr("map")
        }
    }

     StackLayout {
         id: layout
         anchors.top: bar.bottom
         anchors.right: parent.right
         anchors.left: parent.left
         anchors.bottom: parent.bottom
         currentIndex: bar.currentIndex
         Rectangle {
             color: 'transparent'
             InsertUser {
                 id: xxxx
             }
         }

         Rectangle {
             color: 'transparent'
             InsertTestResults {
                 id: xxxx2
             }
         }

         Rectangle {
             color: 'transparent'
             DynamicQueries {
                 id: xxxx3
             }
         }

         Rectangle {
             color: 'transparent'
             Map {
                 id: xxxx4
             }
         }
    }
}