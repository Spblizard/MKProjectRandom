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
        {"Sheeva", "Baraka", "Sindel", "Nightwolf", "Jhonny\nCage", "Liu Kang", "Shang\nTsung", "Sonya", "Stryker", "Kabal", "Jax", "Kung Lao", "Kano", "Cyrax\nCyborg", "Sektor", "Smoke\nCyborg"},
        {"Mileena", "Sub-Zero\nMKIII", "Kitana", "Jade\nUMKIII", "Sub-Zero\nUMKIII", "Ermac\nUMKIII", "Reptile\nUMKIII", "Rain\nUMKIII", "Scorpion\nUMKIII", "Tremor\nUMKIII", "Noob-Saibot\nUMKIII", "Raiden", "Hornbuckle", "Leviathan", "Flame", "Snake"},
        {"Ruby", "Hydro", "Cyrax\nMKP", "Chameleon\nMKT", "Noob Smoke", "Magnectro", "Tanya", "Nightmare", "Khameleon", "Smoke\nWomen", "Smoke MKT", "Dark", "Toxic", "Tremor\nCyborg", "LK-52", "Hydro\nCyborg"},
        {"Reptile\nCyborg", "Chameleon\nCyborg", "Classic\nBlaze", "Super\nSub-Zero", "Nightspirits", "Water God", "Reiko", "Reptile\nMKI", "Smoke\nMKII", "Rain\nMKII", "Avanger", "Ermac\nMKD", "Ermac\nMKI", "Sub-Zero\nMKI", "Scorpion\nMKI", "Jade\nMKII"}
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
