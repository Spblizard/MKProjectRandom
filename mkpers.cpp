#include "mkpers.h"

MKPers::MKPers(QObject *parent) : QObject(parent)
{
    randomPers();
}

QString MKPers::mkPers(int i)
{
    return str[i];
}

void MKPers::randomPers()
{
    QTime midnight(0, 0, 0);
    qsrand(midnight.secsTo (QTime::currentTime()));
    int a[8], b[8];
    for (int j = 0; j < 8; j++) {
        a[j] = qrand() % 4;
        b[j] = qrand() % 16;
    }
    for (int j = 0; j < 8; j++) {
        str[j] = pers[a[j]][b[j]];
        pers[a[j]][b[j]] = "NULL";
    }
    for (int j = 0; j < 8; j++) {
        while (str[j] == "NULL") {
            a[j] = qrand() % 4;
            b[j] = qrand() % 16;
            str[j] = pers[a[j]][b[j]];
            pers[a[j]][b[j]] = "NULL";
        }
    }

}

void MKPers::save()
{
    QJsonObject json;
    QStringList persList[5], strList, winPersList, subPersList, grandPersList;
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 13; j++) {
           persList[i] << pers[i][j];
           if (j < 8 && i < 1) {
               strList << str[j];
               winPersList << winPers[j];
               subPersList << subPers[j];
           }
           if (j < 2 && i < 1)
               grandPersList << grandPers[j];
        }
    }
    QJsonArray persArr[5], strArr, winPersArr, subPersArr, grandPersArr;
    QString inti[5];
    for (int i = 0; i < 5; i++) {
        persArr[i] = QJsonArray::fromStringList(persList[i]);
        inti[i] = "pers" + QString::number(i);
        json[inti[i]] = persArr[i];
        if (i < 1) {
            strArr = QJsonArray::fromStringList(strList);
            winPersArr = QJsonArray::fromStringList(winPersList);
            subPersArr = QJsonArray::fromStringList(subPersList);
            grandPersArr = QJsonArray::fromStringList(grandPersList);
            json["str"] = strArr;
            json["winPers"] = winPersArr;
            json["subPers"] = subPersArr;
            json["grandPers"] = grandPersArr;
        }
    }
    QFile saveFile("data.json");
    saveFile.open(QIODevice::WriteOnly);
    QJsonDocument jsonDoc(json);
    saveFile.write(jsonDoc.toJson());
}

void MKPers::load()
{
    QJsonObject json;
    QFile loadFile("data.json");
    loadFile.open(QIODevice::ReadOnly);
    QJsonDocument jsonDoc(QJsonDocument::fromJson (loadFile.readAll()));
    json = jsonDoc.object();
    QJsonArray persArr1 = json["pers0"].toArray();
    QJsonArray persArr2 = json["pers1"].toArray();
    QJsonArray persArr3 = json["pers2"].toArray();
    QJsonArray persArr4 = json["pers3"].toArray();
    QJsonArray persArr5 = json["pers4"].toArray();
    QJsonArray strArr = json["str"].toArray();
    QJsonArray subPersArr = json["subPers"].toArray();
    QJsonArray winPersArr = json["winPers"].toArray();
    QJsonArray grandPersArr = json["grandPers"].toArray();
    for (int i = 0; i < 13; i++) {
        pers[0][i] = persArr1[i].toString();
        pers[1][i] = persArr2[i].toString();
        pers[2][i] = persArr3[i].toString();
        pers[3][i] = persArr4[i].toString();
        pers[4][i] = persArr5[i].toString();
        if (i < 8) {
            str[i] = strArr[i].toString();
            subPers[i] = subPersArr[i].toString();
            winPers[i] = winPersArr[i].toString();
        }
        if (i < 2)
            grandPers[i] = grandPersArr[i].toString();
    }
}

void MKPers::stateSave(QString s, int i)
{
    QFile file("data.json");
    file.open(QIODevice::ReadOnly);
    QJsonObject json;
    QJsonDocument jsonDoc(QJsonDocument::fromJson (file.readAll()));
    json = jsonDoc.object();
    QString tmp = "tmpPers" + QString::number(i);
    json[tmp] = s;
    QJsonDocument jsonDoc1(json);
    QFile file1("data.json");
    file1.open(QIODevice::WriteOnly);
    file1.write(jsonDoc1.toJson());
}

QString MKPers::stateLoad(int i)
{
    QJsonObject json;
    QFile loadFile("data.json");
    loadFile.open(QIODevice::ReadOnly);
    QJsonDocument jsonDoc(QJsonDocument::fromJson(loadFile.readAll()));
    json = jsonDoc.object();
    if (i == 1)
        return json["tmpPers1"].toString();
    if (i == 2)
        return json["tmpPers2"].toString();
    if (i == 3)
        return json["tmpPers3"].toString();
    if (i == 4)
        return json["tmpPers4"].toString();
    if (i == 5)
        return json["tmpPers5"].toString();
    if (i == 6)
        return json["tmpPers6"].toString();
    if (i == 7)
        return json["tmpPers7"].toString();
    if (i == 8)
        return json["tmpPers8"].toString();
    if (i == 9)
        return json["tmpPers9"].toString();
    if (i == 10)
        return json["tmpPers10"].toString();
    if (i == 11)
        return json["tmpPers11"].toString();
    if (i == 12)
        return json["tmpPers12"].toString();
    if (i == 13)
        return json["tmpPers13"].toString();
    if (i == 14)
        return json["tmpPers14"].toString();
    if (i == 15)
        return json["tmpPers15"].toString();
}
