#ifndef MKPERS_H
#define MKPERS_H

#include <QObject>
#include <QTime>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QFile>
#include <QDebug>

class MKPers : public QObject
{
    Q_OBJECT
private:
    QString str[8];
    QString winPers[8];
    QString subPers[8];
    QString grandPers[2];
    QString pers[4][16] = {
        {"Sheeva", "Baraka", "Sindel", "Nightwolf", "Jhonny Cage", "Liu Kang", "Shang Tsung", "Sonya", "Stryker", "Kabal", "Jax", "Kung Lao", "Kano", "Cyrax Cyborg", "Sektor", "Smoke Cyborg"},
        {"Mileena", "Sub-Zero MKIII", "Kitana", "Jade UMKIII", "Sub-Zero UMKIII", "Ermac UMKIII", "Reptile UMKIII", "Rain UMKIII", "Scorpion UMKIII", "Tremor UMKIII", "Noob-Saibot UMKIII", "Raiden", "Hornbuckle", "Leviathan", "Flame", "Snake"},
        {"Ruby", "Hydro", "Cyrax MKP", "Chameleon MKT", "Noob Smoke", "Magnectro", "Tanya", "Nightmare", "Khameleon", "Smoke Women", "Smoke MKT", "Dark", "Toxic", "Tremor Cyborg", "LK-52", "Hydro Cyborg"},
        {"Reptile Cyborg", "Chameleon Cyborg", "Classic Blaze", "Super Sub-Zero", "Nightspirits", "Water God", "Reiko", "Reptile MKI", "Smoke MKII", "Rain MKII", "Avanger", "Ermac MKD", "Ermac MKI", "Sub-Zero MKI", "Scorpion MKI", "Jade MKII"}
    };
public:
    explicit MKPers(QObject *parent = nullptr);

signals:

public slots:
    QString mkPers(int);
    void randomPers();
    void save();
    void load();
    void stateSave(QString, int);
    QString stateLoad(int);
};

#endif // MKPERS_H
