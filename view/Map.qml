import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtWebEngine 1.0

import "components"

Rectangle{
    anchors.fill: parent
    color: primaryDarkColor
    signal gotLoadingMapResult(var res)

    Component.onCompleted: {
        backend.mapSaved.connect(gotLoadingMapResult)
    }

    onGotLoadingMapResult:{
        if(res)
            web.url = "map.html"
    }
    Rectangle{
        id: profilePic
        width:140
        height: 140
        color: primaryColor
        radius: 140
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 25

        RoundButton{
            id: proBtn
            anchors.centerIn: parent
            icon.source: "icons/europe_60px.png"
            radius:10
            width: parent.width-20
            height: parent.height-20
            icon.width: parent.width-10
            icon.height: parent.width-10
            icon.color: foregroundColor
            flat: true
        }
    }

    Rectangle{
        color: "transparent"
        anchors.top: profilePic.bottom
        anchors.bottom:btnMap.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 75
        anchors.rightMargin: 75
        anchors.topMargin: 25
        anchors.bottomMargin: 25

        WebEngineView {
            id: web
            anchors.fill: parent
        }

    }

    CustomButton {
        id: btnMap
        width: 180
        height:50
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 25
        anchors.horizontalCenter: parent.horizontalCenter
        opacity: 1
        text: "load Map"
        font.pointSize: 10
        font.family: "Segoe UI"
        colorPressed: "#558b1f"
        colorMouseOver: "#7ece2d"
        colorDefault: "#67aa25"
        onClicked:{
            backend.saveNewMap()

        }
    }
}
