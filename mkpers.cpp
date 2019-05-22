#include "mkpers.h"

MKPers::MKPers(QObject *parent) : QObject(parent)
{
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 16; j++)
            mSavePers[i][j] = mPers[i][j];
    }
    randomPers();
}

QString MKPers::mkPers(int i)
{
    return mStr[i];
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
        mStr[j] = mPers[a[j]][b[j]];
        mPers[a[j]][b[j]] = "NULL";
    }
    for (int j = 0; j < 8; j++) {
        while (mStr[j] == "NULL") {
            a[j] = qrand() % 4;
            b[j] = qrand() % 16;
            mStr[j] = mPers[a[j]][b[j]];
            mPers[a[j]][b[j]] = "NULL";
        }
    }

}

void MKPers::generateNewPers(QString grandMaster)
{
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 16; j++) {
            if (mSavePers[i][j] == grandMaster) {
                mSavePers[i][j] = "None";
            }
            mPers[i][j] = mSavePers[i][j];
        }
    }
}

void MKPers::save()
{
    QJsonObject json;
    QStringList persList[4];
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 16; j++)
           persList[i] << mPers[i][j];
    }
    QJsonArray persArr[4];
    QString inti[5];
    for (int i = 0; i < 4; i++) {
        persArr[i] = QJsonArray::fromStringList(persList[i]);
        inti[i] = "pers" + QString::number(i);
        json[inti[i]] = persArr[i];
    }
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 16; j++)
           persList[i] << mSavePers[i][j];
    }
    for (int i = 0; i < 4; i++) {
        persArr[i] = QJsonArray::fromStringList(persList[i]);
        inti[i] = "savePers" + QString::number(i);
        json[inti[i]] = persArr[i];
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
    QJsonArray saveArr1 = json["savePers0"].toArray();
    QJsonArray saveArr2 = json["savePers1"].toArray();
    QJsonArray saveArr3 = json["savePers2"].toArray();
    QJsonArray saveArr4 = json["savePers3"].toArray();
    for (int i = 0; i < 16; i++) {
        mPers[0][i] = persArr1[i].toString();
        mPers[1][i] = persArr2[i].toString();
        mPers[2][i] = persArr3[i].toString();
        mPers[3][i] = persArr4[i].toString();
        mSavePers[0][i] = saveArr1[i].toString();
        mSavePers[1][i] = saveArr2[i].toString();
        mSavePers[2][i] = saveArr3[i].toString();
        mSavePers[3][i] = saveArr4[i].toString();
    }
}

void MKPers::stateSave(QString list, QString pers, int i)
{
    QFile file("data.json");
    file.open(QIODevice::ReadOnly);
    QJsonObject json;
    QJsonDocument jsonDoc(QJsonDocument::fromJson (file.readAll()));
    json = jsonDoc.object();
    QString tmp = list + QString::number(i);
    json[tmp] = pers;
    QJsonDocument jsonDoc1(json);
    QFile file1("data.json");
    file1.open(QIODevice::WriteOnly);
    file1.write(jsonDoc1.toJson());
}

void MKPers::varSave(QString var, bool par)
{
    QFile file("data.json");
    file.open(QIODevice::ReadOnly);
    QJsonObject json;
    QJsonDocument jsonDoc(QJsonDocument::fromJson (file.readAll()));
    json = jsonDoc.object();
    json[var] = par;
    QJsonDocument jsonDoc1(json);
    QFile file1("data.json");
    file1.open(QIODevice::WriteOnly);
    file1.write(jsonDoc1.toJson());
}

bool MKPers::varLoad(QString var)
{
    QJsonObject json;
    QFile loadFile("data.json");
    loadFile.open(QIODevice::ReadOnly);
    QJsonDocument jsonDoc(QJsonDocument::fromJson(loadFile.readAll()));
    json = jsonDoc.object();
    return json[var].toBool();

}

QString MKPers::stateLoad(QString list, int i)
{
    QJsonObject json;
    QFile loadFile("data.json");
    loadFile.open(QIODevice::ReadOnly);
    QJsonDocument jsonDoc(QJsonDocument::fromJson(loadFile.readAll()));
    json = jsonDoc.object();
    QString tmp = list + QString::number(i);
    return json[tmp].toString();
}

void MKPers::stateCountListSave(QString list, int count)
{
    QFile file("data.json");
    file.open(QIODevice::ReadOnly);
    QJsonObject json;
    QJsonDocument jsonDoc(QJsonDocument::fromJson (file.readAll()));
    json = jsonDoc.object();
    QString tmp = list + "Count";
    json[tmp] = count;
    QJsonDocument jsonDoc1(json);
    QFile file1("data.json");
    file1.open(QIODevice::WriteOnly);
    file1.write(jsonDoc1.toJson());
}

int MKPers::stateCountListLoad(QString list)
{
    QJsonObject json;
    QFile loadFile("data.json");
    loadFile.open(QIODevice::ReadOnly);
    QJsonDocument jsonDoc(QJsonDocument::fromJson(loadFile.readAll()));
    json = jsonDoc.object();
    QString tmp = list + "Count";
    return json[tmp].toInt();
}
