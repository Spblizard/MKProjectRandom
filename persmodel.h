#ifndef PERSMODEL_H
#define PERSMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include <QSortFilterProxyModel>
#include <QModelIndex>
#include <QVariant>
#include <QList>

#include "persdata.h"

class PersModel;

class PersModel : public QAbstractListModel
{
	Q_OBJECT
public:
	explicit PersModel(QObject *parent = nullptr);

	virtual int rowCount(const QModelIndex &parent) const;
	virtual QVariant data(const QModelIndex &index, int role) const;
	virtual QHash<int, QByteArray> roleNames() const;
	QString checkName(const QString &name);

	QSortFilterProxyModel *getItem();

signals:

public slots:
	void addPers(const QString &name);
	QVariantMap persData();
	void setPersData(const QVariantMap &map);

private:
	PersData mData;
	QSortFilterProxyModel *mProxy;
};

#endif // PERSMODEL_H
