import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12

import "components"

Rectangle{
    anchors.fill: parent
    color: primaryDarkColor

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

    GridLayout{
        columns:2
        anchors.top: profilePic.bottom
        anchors.topMargin: 55
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.leftMargin: 75
        anchors.rightMargin: 75
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
            placeholderText: "Enter first name "
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
            placeholderText: "Enter last name "
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
            placeholderText: "Enter phone# "
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
            placeholderText: "Enter Address "
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
            placeholderText: "Enter email "
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
            placeholderText: "Enter covid result "
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
            placeholderText: "Enter Device Id "
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
            placeholderText: "Enter Gender "
        }
        Label {
            opacity: 1
            color: "#ffffff"
            text: qsTr("National Id: ")
            font.family: "Segoe UI"
            font.pointSize: 10
        }
        CustomTextField {
            id: natId
            opacity: 1
            Layout.fillWidth: true
            placeholderText: "Enter natId "
        }
        Label {
            opacity: 1
            color: "#ffffff"
            text: qsTr("Lat: ")
            font.family: "Segoe UI"
            font.pointSize: 10
        }
        CustomTextField {
            id: lat
            opacity: 1
            Layout.fillWidth: true
            placeholderText: "Enter lat "
        }
        Label {
            opacity: 1
            color: "#ffffff"
            text: qsTr("Lon: ")
            font.family: "Segoe UI"
            font.pointSize: 10
        }
        CustomTextField {
            id: lon
            opacity: 1
            Layout.fillWidth: true
            placeholderText: "Enter lon "
        }
        CustomButton {
            id: btnLogin
            Layout.fillWidth: true
            Layout.minimumHeight:50
            opacity: 1
            text: "Save"
            font.pointSize: 10
            font.family: "Segoe UI"
            colorPressed: "#558b1f"
            colorMouseOver: "#7ece2d"
            colorDefault: "#67aa25"
            anchors.bottomMargin: 50
            Layout.columnSpan: 2
            onClicked:{
                backend.saveUser(firstName.text, lastName.text, email.text,
                phoneNumber.text, address.text, gender.text, deviceID.text,
                covidResult.text, natId.text, lat.text, lon.text)
            }
        }
    }
}
