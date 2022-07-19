#include "mkpers.h"

MKPers::MKPers(QObject *parent) :
	QObject(parent),
	mWinsModel(new PersModel),
	mChampModel(new PersModel),
	mGrndChampModel(new PersModel),
	mUltChampModel(new PersModel)
{
	defaultPers();
}

MKPers::~MKPers()
{
	delete mWinsModel;
	delete mChampModel;
	delete mGrndChampModel;
	delete mUltChampModel;
}

QString MKPers::mkPers(int i)
{
    return mStr[i];
}

PersModel *MKPers::winsModel()
{
	return mWinsModel;
}

PersModel *MKPers::champModel()
{
	return mChampModel;
}

PersModel *MKPers::grndChampModel()
{
	return mGrndChampModel;
}
PersModel *MKPers::ultChampModel()
{
	return mUltChampModel;
}

void MKPers::defaultPers()
{
	for (int i = 0; i < 8; i++)
		for(int j = 0; j < 16; j++)
			mPers[i][j] = mDefaultPers[i][j];
	for (int i = 0; i < 8; i++) {
		for (int j = 0; j < 16; j++)
			mSavePers[i][j] = mPers[i][j];
	}
	randomPers();
}

void MKPers::randomPers()
{
    int a[8], b[8];
    for (int j = 0; j < 8; j++) {
		a[j] = QRandomGenerator::global()->bounded(0, 8);
		b[j] = QRandomGenerator::global()->bounded(0, 16);
    }
    for (int j = 0; j < 8; j++) {
        mStr[j] = mPers[a[j]][b[j]];
        mPers[a[j]][b[j]] = "NULL";
    }
    for (int j = 0; j < 8; j++) {
        while (mStr[j] == "NULL") {
			a[j] = QRandomGenerator::global()->bounded(0, 8);
			b[j] = QRandomGenerator::global()->bounded(0, 16);
            mStr[j] = mPers[a[j]][b[j]];
            mPers[a[j]][b[j]] = "NULL";
        }
    }

}

void MKPers::generateNewPers(QString grandMaster)
{
    for (int i = 0; i < 8; i++) {
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
    QStringList persList[8];
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 16; j++)
           persList[i] << mPers[i][j];
    }
    QJsonArray persArr[8];
	QString inti[9];
    for (int i = 0; i < 8; i++) {
        persArr[i] = QJsonArray::fromStringList(persList[i]);
        inti[i] = "pers" + QString::number(i);
        json[inti[i]] = persArr[i];
    }
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 16; j++)
           persList[i] << mSavePers[i][j];
    }
    for (int i = 0; i < 8; i++) {
        persArr[i] = QJsonArray::fromStringList(persList[i]);
        inti[i] = "savePers" + QString::number(i);
        json[inti[i]] = persArr[i];
	}
	QJsonObject winsObj = QJsonObject::fromVariantMap(mWinsModel->persData());
	QJsonObject champObj = QJsonObject::fromVariantMap(mChampModel->persData());
	QJsonObject grndChampObj = QJsonObject::fromVariantMap(mGrndChampModel->persData());
	QJsonObject ultChampObj = QJsonObject::fromVariantMap(mUltChampModel->persData());
	json["winsObj"] = winsObj;
	json["champObj"] = champObj;
	json["grndChampObj"] = grndChampObj;
	json["ultChampObj"] = ultChampObj;
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
    QJsonArray persArr6 = json["pers5"].toArray();
    QJsonArray persArr7 = json["pers6"].toArray();
    QJsonArray persArr8 = json["pers7"].toArray();

    QJsonArray saveArr1 = json["savePers0"].toArray();
    QJsonArray saveArr2 = json["savePers1"].toArray();
    QJsonArray saveArr3 = json["savePers2"].toArray();
    QJsonArray saveArr4 = json["savePers3"].toArray();
    QJsonArray saveArr5 = json["savePers4"].toArray();
    QJsonArray saveArr6 = json["savePers5"].toArray();
    QJsonArray saveArr7 = json["savePers6"].toArray();
    QJsonArray saveArr8 = json["savePers7"].toArray();

    for (int i = 0; i < 16; i++) {
        mPers[0][i] = persArr1[i].toString();
        mPers[1][i] = persArr2[i].toString();
        mPers[2][i] = persArr3[i].toString();
        mPers[3][i] = persArr4[i].toString();
        mPers[4][i] = persArr5[i].toString();
        mPers[5][i] = persArr6[i].toString();
        mPers[6][i] = persArr7[i].toString();
        mPers[7][i] = persArr8[i].toString();

        mSavePers[0][i] = saveArr1[i].toString();
        mSavePers[1][i] = saveArr2[i].toString();
        mSavePers[2][i] = saveArr3[i].toString();
        mSavePers[3][i] = saveArr4[i].toString();
        mSavePers[4][i] = saveArr5[i].toString();
        mSavePers[5][i] = saveArr6[i].toString();
        mSavePers[6][i] = saveArr7[i].toString();
        mSavePers[7][i] = saveArr8[i].toString();
    }
	QJsonObject winsObj = json["winsObj"].toObject();
	QJsonObject champObj = json["champObj"].toObject();
	QJsonObject grndChampObj = json["grndChampObj"].toObject();
	QJsonObject ultChampObj = json["ultChampObj"].toObject();
	mWinsModel->setPersData(winsObj.toVariantMap());
	mChampModel->setPersData(champObj.toVariantMap());
	mGrndChampModel->setPersData(grndChampObj.toVariantMap());
	mUltChampModel->setPersData(ultChampObj.toVariantMap());
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
	file.close();
    json = jsonDoc.object();
    QString tmp = list + "Count";
    json[tmp] = count;
    QJsonDocument jsonDoc1(json);
    QFile file1("data.json");
    file1.open(QIODevice::WriteOnly);
	file1.write(jsonDoc1.toJson());
	file1.close();
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

void MKPers::stateStringListSave(QString list, QString str)
{
	QFile file("data.json");
	file.open(QIODevice::ReadOnly);
	QJsonObject json;
	QJsonDocument jsonDoc(QJsonDocument::fromJson (file.readAll()));
	file.close();
	json = jsonDoc.object();
	QString tmp = list + "String";
	json[tmp] = str;
	QJsonDocument jsonDoc1(json);
	QFile file1("data.json");
	file1.open(QIODevice::WriteOnly);
	file1.write(jsonDoc1.toJson());
	file1.close();
}

QString MKPers::stateStringListLoad(QString list)
{
	QJsonObject json;
	QFile loadFile("data.json");
	loadFile.open(QIODevice::ReadOnly);
	QJsonDocument jsonDoc(QJsonDocument::fromJson(loadFile.readAll()));
	json = jsonDoc.object();
	QString tmp = list + "String";
	return json[tmp].toString();
}
