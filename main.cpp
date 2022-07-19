#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQmlEngine>
#include "mkpers.h"

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    MKPers mkp;
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

	engine.rootContext()->setContextProperty("mkp", &mkp);
	engine.rootContext()->setContextProperty("WinsModel", mkp.winsModel());
	engine.rootContext()->setContextProperty("WinsModelView", mkp.winsModel()->getItem());
	engine.rootContext()->setContextProperty("ChampModel", mkp.champModel());
	engine.rootContext()->setContextProperty("ChampModelView", mkp.champModel()->getItem());
	engine.rootContext()->setContextProperty("GrndChampModel", mkp.grndChampModel());
	engine.rootContext()->setContextProperty("GrndChampModelView", mkp.grndChampModel()->getItem());
	engine.rootContext()->setContextProperty("UltChampModel", mkp.ultChampModel());
	engine.rootContext()->setContextProperty("UltChampModelView", mkp.ultChampModel()->getItem());


	const QUrl url(u"qrc:/qml/main.qml"_qs);
	QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
					 &app, [url](QObject *obj, const QUrl &objUrl) {
		if (!obj && url == objUrl)
			QCoreApplication::exit(-1);
	}, Qt::QueuedConnection);
	engine.load(url);

    return app.exec();
}
