#include "tcpclient.h"

TcpClient::TcpClient(QObject *parent)
    : QObject{parent}
{

}


void TcpClient::initialize(){
    qDebug() << "initializing TcpClient";
    m_socket.reset(new QTcpSocket);
    connect(m_socket.data(), &QTcpSocket::connected, this, &TcpClient::connectedToServer);
    connect(m_socket.data(), &QTcpSocket::disconnected, this, &TcpClient::disconnectedFromServer);   
}

QString TcpClient::serverAddress(){
    return m_serverAddress;
}

void TcpClient::setServerAddress(QString address){
    qDebug() << "Setting server address to " << address;
    m_serverAddress = address;
}

int TcpClient::port(){
    return m_port;
}

void TcpClient::setServerPort(int port){
    qDebug() << "Setting server port to " << port;
    m_port = port;
}

void TcpClient::connectToServer(){
    qDebug() << "Connecting to Tcp server";
    m_socket->connectToHost(m_serverAddress, m_port);
}

void TcpClient::disconnectFromServer(){
    qDebug() << "Disconnecting from Tcp server";
    m_socket->disconnectFromHost();
}

bool TcpClient::sendMessage(QString message){
    m_socket->write((message + "\r\n\r\n\r\n\r\n").toUtf8());
    if (!m_socket->waitForBytesWritten(2000)) return false;
    return true;

}
