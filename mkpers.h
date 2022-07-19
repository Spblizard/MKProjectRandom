#ifndef MKPERS_H
#define MKPERS_H

#include <QObject>
#include <QRandomGenerator>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QFile>
#include <QDebug>

#include "persmodel.h"

class MKPers : public QObject
{
    Q_OBJECT
private:
    QString mStr[8];
	QString mDefaultPers[8][16] = {
        {"Sub-Zero", "Scorpion", "Reptile", "Ermac", "Rain", "Tremor", "Smoke\nhuman", "Noob-Saibot", "Chameleon", "Cyrax\nhuman", "Sektor\nhuman", "Kitana", "Tanya", "Jade", "Skarlet", "Mileena"},
        {"Khameleon", "Cyber\nSub-Zero", "Cyrax", "Sektor", "Smoke", "TriBorg", "Liu Kang", "Kung Lao", "Raiden", "Fujin", "Johnny\nCage", "Sonya", "Jax", "Stryker", "Sub-Zero\nunmask", "Nightwolf"},
		{"Kabal", "Kano", "Baraka", "Sheeva", "Shang\nTsung", "Sindel", "Oniro", "Ruby", "Komodai", "Frost", "Khrome", "Bi-Han", "Hydro", "Sang", "Hornbukle", "Flame"},
        {"Cyber\nHydro", "Acid", "Propagator", "Sheborg", "Mikro", "Monnitor", "Leviathan", "Magnectro", "Saphira", "Shewolf", "Cyber\nReptile", "Cyber\nRain", "Reiko", "Cyber", "Ninja Flame", "Sareena"},
		{"Kenshi", "Jarek", "Quian-Chi", "Shinnok", "Li-Mei", "Drahmin", "Hotaru", "Sub-Zero\nMK2", "Scorpion\nMK2", "Reptile\nMK2", "Ermac\nMK2", "Rain\nMK2", "Smoke\nMK2", "Noob-Saibot\nMK2", "Chameleon\nMK2", "Kitana\nMK2"},
		{"Mileena\nMK2", "Jade\nMK2", "Lui Kang\nMK2", "Kung Lao\nMK2", "Johnny\nCage\nMK2", "Jax\nMK2", "Shang\nTsung\nMK2", "Hornbukle\nMK2", "Aqua", "Sub-Zero\nMK1", "Scorpion\nMK1", "Reptile\nMK1", "Ermac\nMK1", "Rain\nMK1", "Smoke\nMK1", "Noob-Saibot\nMK1"},
		{"Chameleon\nMK1", "Lui Kang\nMK1", "Raiden\nMK1", "Johnny\nCage\nMK1", "Sonya\nMK1", "Kano\nMK1", "Shang\nTsung\nMK1", "Cassie\nCage", "Alien", "Cyber\nFlame", "Cyber\nErmac", "Cyber\nTremor", "Cyber\nNoob-Saibot", "Kai", "Flame\nMK2", "Magnectro\nMK2"},
		{"Smoke\nMKA", "Ermac\nMKA", "Ruby\nMK2", "Tremor\nNew", "Smoke\nMK9", "Kotal Kahn", "Scorpion\nMK9", "Sub-Zero\nMK9", "Sektor\nMK9", "Cyrax\nMK9", "Fujin\nMKM", "Reptile\nMK9", "Kenshi\nMKDA", "Freddy", "Jason", "Sub-Zero\nMKDA"}
	};
	QString mPers[8][16];
	QString mSavePers[8][16];
	PersModel *mWinsModel;
	PersModel *mChampModel;
	PersModel *mGrndChampModel;
	PersModel *mUltChampModel;

public:
	explicit MKPers(QObject *parent = nullptr);
	~MKPers();

signals:

public slots:
	QString mkPers(int);
	PersModel *winsModel();
	PersModel *champModel();
	PersModel *grndChampModel();
	PersModel *ultChampModel();
	void defaultPers();
	void randomPers();
    void generateNewPers(QString);
    void save();
    void load();
    void stateSave(QString,QString, int);
    void varSave(QString, bool);
    bool varLoad(QString);
    QString stateLoad(QString, int);
    void stateCountListSave(QString, int);
	int stateCountListLoad(QString);
	void stateStringListSave(QString, QString);
	QString stateStringListLoad(QString);

};

#endif // MKPERS_H
