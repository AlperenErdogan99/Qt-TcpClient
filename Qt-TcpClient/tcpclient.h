#ifndef TCPCLIENT_H
#define TCPCLIENT_H

#include <QObject>
#include <QDebug>
#include <QTcpSocket>

class TcpClient : public QObject
{
    Q_OBJECT


private:
    QSharedPointer<QTcpSocket> m_socket;
    QString m_serverAddress;
    int m_port;


public:
    explicit TcpClient(QObject *parent = nullptr);

public slots:
    void initialize();
    QString serverAddress();
    void setServerAddress(QString address);
    int port();
    void setServerPort(int port);
    void connectToServer();
    void disconnectFromServer();
    bool sendMessage(QString message);

signals:

    void connectedToServer();
    void disconnectedFromServer();

};

#endif // TCPCLIENT_H
