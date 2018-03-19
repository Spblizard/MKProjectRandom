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
    int numb = 0;
    QString str[8];
    QString winPers[8];
    QString subPers[8];
    QString grandPers[2];
    QString pers[5][13] = {
        {"Scorpion", "Bi-han", "Magnectro", "Oniro", "Aqua", "Chamilion", "Ermac", "Cyrax Ninja", "Sektor Ninja", "Smoke Ninja", "Reptile", "Khrome", "Sub-zero"},
        {"Komodai", "Nightmare", "Noob-Saibot", "Rain", "Snake", "Tremor", "Shewolf", "Frost", "Jade", "Khamilion", "Kitana", "Mileena", "Saphira"},
        {"Ruby", "Skarlet", "Tanya", "Hydro", "Acid", "Cyber", "Leviathan", "Propogator", "Sheborg", "Smoke", "Cyrax", "Sektor", "Flame"},
        {"Sub-zero unmask", "Raiden", "Fujin", "Cage", "Hornbuckle", "Jax", "Kabal", "Kai", "Kung-Lao", "Liu-Kang", "Nightwolf", "Sonya", "Stryker"},
        {"Baraka", "Kano", "Hotaru", "Kobra", "Quan-Chi", "Reiko", "Shang Tsung", "Sheeva", "Sindel", "Mikro", "Shinnok", "Sang", "Li Mei"}
                       };
public:
    explicit MKPers(QObject *parent = nullptr);

signals:

public slots:
    void subMaster();
    Q_INVOKABLE QString mkPers(int);
    Q_INVOKABLE void randomPers();
    Q_INVOKABLE void numbPlus();
    Q_INVOKABLE void winners(QString);
    Q_INVOKABLE QString numbToStr();
    Q_INVOKABLE int outInt();
    Q_INVOKABLE void takeGrandPers(QString);
    Q_INVOKABLE QString gPers(int);
    Q_INVOKABLE void subLose(QString, int);
    Q_INVOKABLE void save();
    Q_INVOKABLE void load();
    Q_INVOKABLE void stateSave(QString, int);
    Q_INVOKABLE QString stateLoad(int);
};

#endif // MKPERS_H
