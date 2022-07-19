#ifndef PERSDATA_H
#define PERSDATA_H

#include <QList>
#include <QMapIterator>
#include <QVariant>

enum Roles {
	NameRole = Qt::UserRole + 1,
	ScoreRole
};

class PersData
{
	QStringList mName;
	QList<int> mScore;
public:
	PersData() {};
	QStringList name() const { return mName; }
	bool contains(const QString &name) { return mName.contains(name); }
	int indexOf(const QString &name) { return mName.indexOf(name); }
	QList<int> score() const { return mScore; }
	void appendData(const QString &name);
	void setData(const QString &name, const int score);
	void changeData(const QString &name);
	void delData(const int index);
	void clearData();
	int size() const { return mName.size(); }
};

#endif // PERSDATA_H
