#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "tcpclient.h"
#include <QTimer>
#include <QThread>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // expose TcpClient class to Qml
    qmlRegisterType<TcpClient>("TcpClient",1,0,"TcpClient");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);


//    TcpClient example;
//    example.initialize();
//    example.setServerAddress("127.0.0.1");
//    example.setServerPort(1180);
//    example.connectToServer();
//    QThread::sleep(2);
//    example.sendMessage("alperen");

    return app.exec();
}
