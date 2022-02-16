import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12

import "components"

Window {
    id: userRootPage
    width: 2*Screen.width/5.8
    height: 2*Screen.height/3.1
    visible: true
    title: qsTr("Hello User")
    color: primaryDarkColor

    signal gotInfoResult(var res, var resInfos)
    property var infos: undefined

    onClosing: {
        splashScreen.visible = true
    }
    Component.onCompleted: {
        backend.infoResults.connect(gotInfoResult)
    }
    onGotInfoResult:{
        infos = resInfos
        setValues()
    }
    function setValues(){
        console.log("setting Values...")
        firstName.text = infos[0]
        lastName.text = infos[1]
        phoneNumber.text = infos[2]
        address.text = infos[3]
        covidResult.text = infos[5]+""
        if(infos[5]){
            deviceID.text = infos[8]
        }
        email.text = infos[7]+""
        gender.text = infos[6]+""
    }

    RoundButton{
        id: refresh
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 20
        icon.source: "icons/synchronize_60px.png"
        radius:10
        width: 50
        height: 50
        icon.width: 60
        icon.height: 60
        icon.color: foregroundColor
        flat: true
        onClicked:{
            backend.getUserInfos(infos[0], infos[1])
        }
    }

    RoundButton{
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 20
        icon.source: "icons/iust.png"
        radius:10
        width: 50
        height: 50
        icon.width: 60
        icon.height: 60
        icon.color: foregroundColor
        flat: true
    }

    RoundButton{
        anchors.top: refresh.bottom
        anchors.right: parent.right
        anchors.margins: 20
        icon.color: accentColor
        icon.source: "icons/europe_60px.png"
        radius:10
        width: 50
        height: 50
        icon.width: 60
        icon.height: 60
        flat: true
    }

    Rectangle{
        id: profilePic
        width:140
        height: 140
        color: primaryColor
        radius: 140
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 60

        RoundButton{
            id: proBtn
            anchors.centerIn: parent
            icon.source: "icons/user_male_128px.png"
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
        id: seperator
        width: 2/3*parent.width
        height:2
        color: primaryColor
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: profilePic.bottom
        anchors.topMargin: 55
    }

    GridLayout{
        columns:2
        anchors.top: seperator.bottom
        anchors.topMargin: 55
        anchors.left: seperator.left
        anchors.right: seperator.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        columnSpacing: 8
        rowSpacing: -10

        Label {
            opacity: 1
            color: "#ffffff"
            text: qsTr("First name: ")
            font.family: "Segoe UI"
            font.pointSize: 10
        }
        CustomTextField {
            id: firstName
            opacity: 1
            Layout.fillWidth: true
            placeholderText: "first name will load here!"
        }
        Label {
            opacity: 1
            color: "#ffffff"
            text: qsTr("Last name: ")
            font.family: "Segoe UI"
            font.pointSize: 10
        }
        CustomTextField {
            id: lastName
            opacity: 1
            Layout.fillWidth: true
            placeholderText: "last name will load here!"
        }
        Label {
            opacity: 1
            color: "#ffffff"
            text: qsTr("Phone number: ")
            font.family: "Segoe UI"
            font.pointSize: 10
        }
        CustomTextField {
            id: phoneNumber
            opacity: 1
            Layout.fillWidth: true
            placeholderText: "phone# will load here!"
        }
        Label {
            opacity: 1
            color: "#ffffff"
            text: qsTr("Address: ")
            font.family: "Segoe UI"
            font.pointSize: 10
        }
        CustomTextField {
            id: address
            opacity: 1
            Layout.fillWidth: true
            placeholderText: "Address will load here!"
        }
        Label {
            opacity: 1
            color: "#ffffff"
            text: qsTr("Email: ")
            font.family: "Segoe UI"
            font.pointSize: 10
        }
        CustomTextField {
            id: email
            opacity: 1
            Layout.fillWidth: true
            placeholderText: "email will load here!"
        }
        Label {
            opacity: 1
            color: "#ffffff"
            text: qsTr("Covid result: ")
            font.family: "Segoe UI"
            font.pointSize: 10
        }
        CustomTextField {
            id: covidResult
            opacity: 1
            Layout.fillWidth: true
            placeholderText: "covid result will load here!"
        }
        Label {
            opacity: 1
            color: "#ffffff"
            text: qsTr("Device Id: ")
            font.family: "Segoe UI"
            font.pointSize: 10
        }
        CustomTextField {
            id: deviceID
            opacity: 1
            Layout.fillWidth: true
            placeholderText: "Device Id will load here!"
        }
        Label {
            opacity: 1
            color: "#ffffff"
            text: qsTr("Gender: ")
            font.family: "Segoe UI"
            font.pointSize: 10
        }
        CustomTextField {
            id: gender
            opacity: 1
            Layout.fillWidth: true
            placeholderText: "Gender will load here!"
        }
    }
}