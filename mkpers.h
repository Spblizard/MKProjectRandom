#ifndef MKPERS_H
#define MKPERS_H

#include <QObject>
#include <QRandomGenerator>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QFile>
#include <QDebug>

class MKPers : public QObject
{
    Q_OBJECT
private:
    QString mStr[8];
    QString mPers[4][16] = {
        {"Sub-Zero", "Scorpion", "Reptile", "Ermac", "Rain", "Tremor", "Smoke\nhuman", "Noob-Saibot", "Chameleon", "Cyrax\nhuman", "Sektor\nhuman", "Kitana", "Tanya", "Jade", "Skarlet", "Mileena"},
        {"Khameleon", "Cyber\nSub-Zero", "Cyrax", "Sektor", "Smoke", "TriBorg", "Liu Kang", "Kung Lao", "Raiden", "Fujin", "Johnny\nCage", "Sonya", "Jax", "Stryker", "Sub-Zero\nunmask", "Nightwolf"},
        {"Kabal", "Kano", "Baraka", "Sheeva", "Shang\nTsung", "Sindel", "Oniro", "Ruby", "Komodai", "Frost", "Khrome", "Bi-Han", "Hydro", "Sang", "Hornbuckle", "Flame"},
        {"Cyber\nHydro", "Acid", "Propagator", "Sheborg", "Mikro", "Monnitor", "Leviathan", "Magnectro", "Saphira", "Shewolf", "Cyber\nReptile", "Cyber\nRain", "Reiko", "Cyber", "Ninja Flame", "Sareena"}
    };
    QString mSavePers[4][16];

public:
    explicit MKPers(QObject *parent = nullptr);

signals:

public slots:
    QString mkPers(int);
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
};

#endif // MKPERS_H
