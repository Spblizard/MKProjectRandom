import QtQuick
import QtQuick.Controls

Item {
	id: root

	signal sendSwipe()

	property int widthSize: 8
	property int heightSize: 1
	property int count: 0
	property int round: 1
	property bool grandRound: false
	property bool ultimateRound: false
	property string grandMaster: ""

	Component.onCompleted: {
		print(root.width)
		print(root.height)
		for (var i = 0; i < 8; i++) {
			dataModel.append({ "name": mkp.mkPers(i)})
		}
		//timer.start()
	}

	function nextRound() {
		var arr = new Array()
		for (var i = 0; i < listView.count; i++) {
			listView.currentIndex = i
			if (listView.currentItem.visible === true) {
				var obj = dataModel.get(i)
				arr.push(obj["name"])
			}
		}
		dataModel.clear()
		for (var j = 0; j < arr.length; j++) {
			dataModel.append({ "name": arr[j] })
		}
		round++
		listView.currentIndex = 0
		count = 0
		if (round === 2)
			widthSize = 4
		else if (round === 3)
			widthSize = 2
	}

	function newRound() {
		if (grandRound || ultimateRound) {
			round = 1
			count = 0
		} else {
			for (var i = 0; i < listView.count; i++) {
				listView.currentIndex = i
				if (listView.currentItem.visible === true) {
					var obj = dataModel.get(i)
					mainDataModel.append({ "name": obj["name"] })
					dataModel.clear()
					round = 1
					count = 0
				}
			}
		}
	}

	function newTournament() {
		dataModel.clear()
		grandDataModel.append({ "name": grandMaster })
		mkp.generateNewPers(grandMaster)
		newGenerate()
	}

	function newGenerate() {
		if (grandDataModel.count === 8 && !ultimateRound) {
			for (var j = 0; j < grandDataModel.count; j++)
				dataModel.append(grandDataModel.get(j))
			grandDataModel.clear()
			widthSize = 8
			ultimateRound = true
		} else if (mainDataModel.count === 8 && !grandRound) {
			for (var j = 0; j < mainDataModel.count; j++)
				dataModel.append(mainDataModel.get(j))
			mainDataModel.clear()
			widthSize = 8
			grandRound = true
		} else if (!grandRound && !ultimateRound){
			mkp.randomPers()
			for (var i = 0; i < 8; i++) {
				dataModel.append({ "name": mkp.mkPers(i)})
			}
			widthSize = 8
		} else if (ultimateRound) {
			for (var a = 0; a < dataModel.count; a++) {
				listView.currentIndex = a
				if (listView.currentItem.visible === true) {
					var obj = dataModel.get(a)
					var numb = obj["name"]
					dataModel.clear()
					dataModel.append({ "name": "Ultimate champion MK Project " + numb })
					widthSize = 1
					listView.currentItem.enabled = false
				}
			}
		} else if (grandRound) {
			for (var a = 0; a < dataModel.count; a++) {
				listView.currentIndex = a
				if (listView.currentItem.visible === true) {
					var obj = dataModel.get(a)
					var numb = obj["name"]
					dataModel.clear()
					dataModel.append({ "name": "Grand Master " + numb })
					grandMaster = numb
					widthSize = 1
				}
			}
		}
	}

	Timer {
		id: timer
		running: false
		interval: 5000
		repeat: false
		onTriggered: {
			listView.currentIndex = 3
			listView.currentItem.visible = false
		}
	}

	ListView {
		id: mainListView
		width: parent.width
		height: parent.height / 4
		anchors.top: parent.top
		model: ListModel {
			id: mainDataModel
		}
		orientation: Qt.Horizontal
		layoutDirection: Qt.LeftToRight
		delegate: Rectangle {
			border.color: "black"
			width: mainListView.width / 8
			height: mainListView.height
			Text {
				anchors.fill: parent
				verticalAlignment: Text.AlignVCenter
				horizontalAlignment: Text.AlignHCenter
				text: model.name
			}
		}
	}

	ListView {
		id: listView
		width: parent.width
		height: parent.height / 4
		anchors.centerIn: parent
		model: ListModel {
			id: dataModel
		}
		orientation: Qt.Horizontal
		layoutDirection: Qt.LeftToRight
		delegate: Rectangle {
			border.color: "black"
			width: listView.width / widthSize
			height: listView.height / heightSize
			Text {
				anchors.fill: parent
				verticalAlignment: Text.AlignVCenter
				horizontalAlignment: Text.AlignHCenter
				text: model.name
			}
			MouseArea {
				anchors.fill: parent
				onClicked: {
					if (listView.count === 1) {
						grandRound = false
						newTournament()
					} else if (index % 2) {
						enabled = false
						listView.currentIndex = index - 1
						listView.currentItem.visible = false
						count++
					} else if ( !(index % 2)) {
						enabled = false
						listView.currentIndex = index + 1
						listView.currentItem.visible = false
						count++
					}
					if (count === 4 && round === 1) {
						nextRound()
					} else if (count === 2 && round === 2) {
						nextRound()
					} else if (count === 1 && round === 3) {
						newRound()
						newGenerate()
					}
				}
			}
		}
	}
	Button {
		id: saveButton
		text: "save"
		width: parent.width / 6
		height: parent.height / 10
		palette.buttonText: "black"
		anchors {
			top: listView.bottom
			topMargin: 10
			left: parent.left
			leftMargin: (parent.width / 2) - width
		}
		onClicked: {
			mkp.save()
			mkp.stateCountListSave("count", count)
			mkp.stateCountListSave("round", round)
			mkp.varSave("grandRound", grandRound)
			mkp.varSave("ultimateRound", ultimateRound)
			mkp.stateCountListSave("widthSize", widthSize)
			mkp.stateCountListSave("mainDataModel", mainDataModel.count)
			mkp.stateCountListSave("grandDataModel", grandDataModel.count)
			if (mainDataModel.count !== 0) {
				for (var i = 0; i < mainDataModel.count; i++) {
					var obj = mainDataModel.get(i)
					mkp.stateSave("mainDataModel", obj["name"], i)
				}
			}
			if (grandDataModel.count !== 0) {
				for (var a = 0; a < grandDataModel.count; a++) {
					var obj2 = grandDataModel.get(a)
					mkp.stateSave("grandDataModel", obj2["name"], a)
				}
			}

			mkp.stateCountListSave("dataModel", dataModel.count)
			for (var j = 0; j < dataModel.count; j++) {
				listView.currentIndex = j
				if (listView.currentItem.visible) {
					var obj1 = dataModel.get(j)
					mkp.stateSave("dataModel", obj1["name"], j)
				} else {
					mkp.stateSave("dataModel", "NULL", j)
				}
			}
		}
	}
	Button {
		id: loadButton
		text: "load"
		anchors.left: saveButton.right
		anchors.top: saveButton.top
		width: saveButton.width
		height: saveButton.height
		palette.buttonText: "black"
		onClicked: {
			mkp.load()
			count = mkp.stateCountListLoad("count")
			round = mkp.stateCountListLoad("round")
			grandRound = mkp.varLoad("grandRound")
			ultimateRound = mkp.varLoad("ultimateRound")
			widthSize = mkp.stateCountListLoad("widthSize")
			var countMainData = mkp.stateCountListLoad("mainDataModel")
			if (countMainData !== 0) {
				mainDataModel.clear()
				for (var i = 0; i < countMainData; i++)
					mainDataModel.append({ "name": mkp.stateLoad("mainDataModel", i) })
			}
			var countGrandData = mkp.stateCountListLoad("grandDataModel")
			if (countGrandData !== 0) {
				grandDataModel.clear()
				for (var a = 0; a < countGrandData; a++)
					grandDataModel.append({ "name": mkp.stateLoad("grandDataModel", a) })
			}

			var countData = mkp.stateCountListLoad("dataModel")
			dataModel.clear()
			for (var j = 0; j < countData; j++) {
				var tmpName = mkp.stateLoad("dataModel", j)
				dataModel.append({ "name": tmpName })
				if (tmpName === "NULL") {
					listView.currentIndex = j
					listView.currentItem.visible = false
				}
			}
		}
	}

	Button {
		id: swipeButton
		width: saveButton.width
		height: saveButton.height
		text: "List"
		palette.buttonText: "black"
		anchors {
			top:  saveButton.top
			right: parent.right
		}
		onClicked: {
			sendSwipe()
		}
	}

	ListView {
		id: grandListView
		width: parent.width
		height: parent.height / 4
		anchors.bottom: parent.bottom
		model: ListModel {
			id: grandDataModel
		}
		orientation: Qt.Horizontal
		layoutDirection: Qt.LeftToRight
		delegate: Rectangle {
			border.color: "black"
			width: mainListView.width / 8
			height: mainListView.height
			Text {
				anchors.fill: parent
				verticalAlignment: Text.AlignVCenter
				horizontalAlignment: Text.AlignHCenter
				text: model.name
			}
		}
	}

}
