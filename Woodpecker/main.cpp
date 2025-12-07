#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <playgroundcpp.h>

int main(int argc, char *argv[])
{
    auto playground = new PlaygroundCpp();
    playground->Main();

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("Woodpecker", "Main");

    return app.exec();
}
