#include "persmodel.h"

PersModel::PersModel(QObject *parent)
	: QAbstractListModel{parent},
	  mProxy(new QSortFilterProxyModel)
{
	mProxy->setSourceModel(qobject_cast<QAbstractItemModel*>(this));
	mProxy->setSortRole(ScoreRole);
	mProxy->setDynamicSortFilter(true);
	mProxy->sort(0, Qt::DescendingOrder);
}

int PersModel::rowCount(const QModelIndex &parent) const
{
	if (parent.isValid()) {
		return 0;
	}

	return mData.size();
}

QVariant PersModel::data(const QModelIndex &index, int role) const
{
	if (!index.isValid()) {
		return QVariant();
	}

	switch (role) {
		case NameRole:
			return mData.name().at(index.row());
		case ScoreRole:
			return mData.score().at(index.row());
		default:
			return QVariant();
	}
}

QHash<int, QByteArray> PersModel::roleNames() const
{
	QHash<int, QByteArray> roles = QAbstractItemModel::roleNames();
	roles[NameRole] = "name";
	roles[ScoreRole] = "score";

	return roles;
}

QString PersModel::checkName(const QString &name)
{
	if (name.contains("\n")) {
		QStringList tmpList = name.split("\n");
		QString tmp = tmpList.join(" ");
		return tmp;
	} else
		return name;
}

QSortFilterProxyModel *PersModel::getItem()
{
	return mProxy;
}

void PersModel::addPers(const QString &name)
{
	QString n = checkName(name);
	if (mData.contains(n)) {
		int index = mData.indexOf(n);
		QModelIndex i = mProxy->index(index, 0);
		mData.changeData(n);
		emit dataChanged(i, i);
	} else {
		beginInsertRows(QModelIndex(), mData.size(), mData.size());
		mData.appendData(n);
		endInsertRows();
	}
}

QVariantMap PersModel::persData()
{
	QVariantMap data;
	for (int i = 0; i < mData.size(); i++) {
		data.insert(mData.name().at(i), mData.score().at(i));
	}

	return data;
}

void PersModel::setPersData(const QVariantMap &map)
{
	beginRemoveRows(QModelIndex(), 0, mData.size());
	endRemoveRows();
	mData.clearData();
	QMapIterator<QString, QVariant> i(map);
	while (i.hasNext()) {
		i.next();
		beginInsertRows(QModelIndex(), mData.size(), mData.size());
		mData.setData(i.key(), i.value().toInt());
		endInsertRows();
	}
}
