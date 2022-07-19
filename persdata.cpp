#include "persdata.h"

void PersData::appendData(const QString &name)
{
	mName.append(name);
	mScore.append(1);
}

void PersData::setData(const QString &name, const int score)
{
	mName.append(name);
	mScore.append(score);
}

void PersData::changeData(const QString &name)
{
	int index = mName.indexOf(name);
	mScore[index]++;
}

void PersData::delData(const int index)
{
	if (index < mName.size()) {
		mName.removeAt(index);
		mScore.removeAt(index);
	}
}

void PersData::clearData()
{
	mName.clear();
	mScore.clear();
}
