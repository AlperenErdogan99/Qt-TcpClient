import QtQuick 2.15
import QtQuick.Window 2.15
import TcpClient 1.0
import QtQuick.Controls 2.15

Window {

    minimumHeight: 200
    maximumHeight: 200
    minimumWidth: 400
    maximumWidth: 400

    visible: true
    title: qsTr("Tcp Client")

    TcpClient {
        id: tcpClient
        Component.onCompleted: tcpClient.initialize();
        onConnectedToServer: connectionState.text = "Connected"
        onDisconnectedFromServer: connectionState.text = "Not Connected"
    }


    Button {
        id: connectServerBtn
        width: 70
        height: 30
        text: "Connect"
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -70
        onClicked: {
            tcpClient.setServerAddress(serverAddressText.text)
            tcpClient.setServerPort(parseInt(serverPortText.text))
            tcpClient.connectToServer();

        }
    }

    Text{
        id: connectionState
        width: 50
        height: 30
        text: "Not Connected"
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -25
        color: "red"
    }

    Rectangle{
        id: serverAddressRec
        anchors.centerIn: parent
        width: 110
        height: 30
        radius: 40
        anchors.verticalCenterOffset: -70
        anchors.horizontalCenterOffset: -140
        color: "#E4D6D3"

        Label {
            id: serverAddressLbl
            text: "Server Address"
            width: 70
            height: 30
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: -10
            anchors.verticalCenterOffset: 5
        }

        TextArea {
            id: serverAddressText
            text: "127.0.0.1"
            width: 90
            height: 30
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: -10
            anchors.verticalCenterOffset: 35
        }


    }

    Rectangle{
        id: serverPortRec
        anchors.centerIn: parent
        width: 110
        height: 30
        radius: 40
        anchors.verticalCenterOffset: -70
        anchors.horizontalCenterOffset: 140
        color: "#E4D6D3"

        Label {
            id: serverPortLbl
            text: "Server Port"
            width: 70
            height: 30
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: 0
            anchors.verticalCenterOffset: 5
        }

        TextArea {
            id: serverPortText
            text: "1240"
            width: 90
            height: 30
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: -10
            anchors.verticalCenterOffset: 35
        }
    }

    Rectangle{
        id: divider
        width: 350
        height: 5
        radius: 50
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 20
        color: "grey"
    }

    Rectangle{
        id: messageRec
        anchors.centerIn: parent
        width: 110
        height: 30
        radius: 40
        anchors.verticalCenterOffset: 50
        anchors.horizontalCenterOffset: -80
        color: "#E4D6D3"

        Label {
            id: messageLbl
            text: "Message"
            width: 70
            height: 30
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: 5
            anchors.verticalCenterOffset: 5
        }

        TextArea {
            id: messageText
            text: "Hello World !"
            width: 90
            height: 30
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: -5
            anchors.verticalCenterOffset: 35
        }

        Button {
            id: messageBtn
            width: 70
            height: 30
            text: "Send"
            anchors.centerIn: parent
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 150

            onClicked: tcpClient.sendMessage(messageText.text);
        }
    }
}
