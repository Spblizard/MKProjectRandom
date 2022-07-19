import QtQuick
import QtQuick.Controls

Item {
	id: root

	signal sendSwipe()

	property int widthSize: 8
	property int heightSize: 1
	property int count: 0
	property int round: 1
	property bool championsFull: false
	property bool loseRound: false
	property bool nextChampions: false
	property bool grandChampions: false
	property string loseMaster: ""
	property string championMaster: ""
	property string ultimateMaster: ""

	Component.onCompleted: {
		firstGenerate()
		//timer.start()
	}

	function firstGenerate() {
		for (var i = 0; i < 8; i++) {
			dataModel.append({ "name": mkp.mkPers(i)})
		}
	}

	function defaultParams() {
		widthSize = 8
		heightSize = 1
		count = 0
		round = 1
		championsFull = false
		loseRound = false
		nextChampions = false
		grandChampions = false
		loseMaster = ""
		championMaster = ""
		ultimateMaster = ""
		dataModel.clear()
		champions1DataModel.clear()
		champions2DataModel.clear()
		mkp.defaultPers()
		firstGenerate()
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

	function loseRound1() {
		var arr = new Array()
		for (var i = 0; i < listView.count; i++) {
			listView.currentIndex = i
			if (listView.currentItem.visible === true)
				arr.push(dataModel.get(i)["name"])
		}
		dataModel.clear()
		if (!nextChampions) {
			for (var j = 0; j < champions1DataModel.count; j++) {
				dataModel.append({ "name": champions1DataModel.get(j)["name"]})
			}
			champions1DataModel.clear()
			for (var k = 0; k < arr.length; k++) {
				champions1DataModel.append({ "name": arr[k]})
			}
		} else {
			for (var a = 0; a < champions2DataModel.count; a++) {
				dataModel.append({ "name": champions2DataModel.get(a)["name"]})
			}
			champions2DataModel.clear()
			for (var b = 0; b < arr.length; b++) {
				champions2DataModel.append({ "name": arr[b]})
			}
		}
	}

	function newRound() {
		for (var i = 0; i < listView.count; i++) {
			listView.currentIndex = i
			if (listView.currentItem.visible === true) {
				var obj = dataModel.get(i)
				if (champions1DataModel.count !== 8) {
					ChampModel.addPers(obj["name"])
					champions1DataModel.append({ "name": obj["name"] })
				} else if(champions2DataModel.count !== 8) {
					ChampModel.addPers(obj["name"])
					champions2DataModel.append({ "name": obj["name"] })
					if (champions2DataModel.count === 8)
						championsFull = true
				}
				dataModel.clear()
				round = 1
				count = 0
			}
		}
	}

	function newGenerate() {
		if (championsFull) {
			if (!nextChampions) {
			for (var i = 0; i < champions1DataModel.count; i++)
				dataModel.append(champions1DataModel.get(i))
			champions1DataModel.clear()
			} else {
				dataModel.clear()
				for (var j = 0; j < champions2DataModel.count; j++)
					dataModel.append(champions2DataModel.get(j))
				champions2DataModel.clear()
			}

			widthSize = 8
		} else {
			mkp.randomPers()
			for (var i = 0; i < 8; i++) {
				dataModel.append({ "name": mkp.mkPers(i)})
			}
			widthSize = 8
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
		id: champions1ListView
		width: parent.width
		height: parent.height / 4
		anchors.top: parent.top
		model: ListModel {
			id: champions1DataModel
		}
		orientation: Qt.Horizontal
		layoutDirection: Qt.LeftToRight
		delegate: Rectangle {
			border.color: "black"
			width: champions1ListView.width / 8
			height: champions1ListView.height
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
					if (index % 2) {
						enabled = false
						listView.currentIndex = index - 1
						WinsModel.addPers(dataModel.get(listView.currentIndex + 1)["name"])
						listView.currentItem.visible = false
						if (championsFull && !loseRound) {
							if (round !== 3) {
								if (!nextChampions)
									champions1DataModel.append({"name": dataModel.get(listView.currentIndex)["name"]})
								else
									champions2DataModel.append({"name": dataModel.get(listView.currentIndex)["name"]})
							} else
								if (!nextChampions)
									champions1DataModel.append({"name": dataModel.get(listView.currentIndex + 1)["name"]})
								else
									champions2DataModel.append({"name": dataModel.get(listView.currentIndex + 1)["name"]})
						} else if (grandChampions) {
							if (loseMaster === "") {
								loseMaster = dataModel.get(index)["name"]
								GrndChampModel.addPers(loseMaster)
							} else if (championMaster === "") {
								championMaster = dataModel.get(index)["name"]
								GrndChampModel.addPers(championMaster)
							} else {
								ultimateMaster = dataModel.get(index)["name"]
								UltChampModel.addPers(ultimateMaster)
							}
						}
						count++
					} else if ( !(index % 2)) {
						enabled = false
						listView.currentIndex = index + 1
						WinsModel.addPers(dataModel.get(listView.currentIndex - 1)["name"])
						listView.currentItem.visible = false
						if (championsFull && !loseRound) {
							if (round !== 3)
								if (!nextChampions)
									champions1DataModel.append({"name": dataModel.get(listView.currentIndex)["name"]})
								else
									champions2DataModel.append({"name": dataModel.get(listView.currentIndex)["name"]})
							else
								if (!nextChampions)
									champions1DataModel.append({"name": dataModel.get(listView.currentIndex - 1)["name"]})
								else
									champions2DataModel.append({"name": dataModel.get(listView.currentIndex - 1)["name"]})
						} else if (grandChampions) {
							if (loseMaster === "") {
								loseMaster = dataModel.get(index)["name"]
								GrndChampModel.addPers(loseMaster)
							} else if (championMaster === "") {
								championMaster = dataModel.get(index)["name"]
								GrndChampModel.addPers(championMaster)
							} else {
								ultimateMaster = dataModel.get(index)["name"]
								UltChampModel.addPers(ultimateMaster)
							}
						}
						count++
					}
					if (count === 6) {
						loseRound = false
						loseRound1()
						count = 0
						round++
					} else if (count === 5 && round === 2) {
						loseRound = false
						loseRound1()
						round++
						count = 0
					} else if (count === 1 && grandChampions) {
						if (championMaster === "") {
							dataModel.clear()
							dataModel.append({"name": champions1DataModel.get(0)["name"]})
							dataModel.append({"name": champions2DataModel.get(0)["name"]})
							count = 0
						} else if (ultimateMaster === "") {
							dataModel.clear()
							count = 0
							dataModel.append({"name": loseMaster})
							dataModel.append({"name": championMaster})
						} else {
							dataModel.clear()
							dataModel.append({"name": "Ultimate Champion MKProject " + ultimateMaster})
							newButton.visible = true
							widthSize = 1
						}
					}
					if (count === 4 && round === 1) {
						if (championsFull) {
							loseRound = true
							widthSize = 4
							loseRound1()
						} else
							nextRound()
					} else if (count === 4 && round === 2) {
						loseRound = true
						widthSize = 2
						loseRound1()
					} else if (count === 2 && round === 2) {
						if (championsFull) {
							loseRound = true
							loseRound1()
						} else
							nextRound()
					} else if (count === 1 && round === 3) {
						if (nextChampions) {
							dataModel.clear()
							grandChampions = true
							championsFull = false
							dataModel.append({"name": champions1DataModel.get(1)["name"]})
							dataModel.append({"name": champions2DataModel.get(1)["name"]})
							count = 0
						} else if (championsFull) {
							nextChampions = true
							round = 1
							count = 0
							newGenerate()
						} else {
							newRound()
							newGenerate()
						}
					}
				}
			}
		}
	}

	Button {
		id: newButton
		text: "new"
		width: saveButton.width
		height: saveButton.height
		visible: false
		palette.buttonText: "black"
		anchors {
			top: saveButton.top
			left: parent.left
		}
		onClicked: {
			defaultParams()
			visible = false
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
			mkp.stateCountListSave("widthSize", widthSize)
			mkp.varSave("championsFull", championsFull)
			mkp.varSave("loseRound", loseRound)
			mkp.varSave("nextChampions", nextChampions)
			mkp.varSave("grandChampions", grandChampions)
			mkp.stateStringListSave("loseMaster", loseMaster)
			mkp.stateStringListSave("championMaster", championMaster)
			mkp.stateCountListSave("champions1DataModel", champions1DataModel.count)
			mkp.stateCountListSave("champions2DataModel", champions2DataModel.count)
			if (champions1DataModel.count !== 0) {
				for (var i = 0; i < champions1DataModel.count; i++) {
					var obj = champions1DataModel.get(i)
					mkp.stateSave("champions1DataModel", obj["name"], i)
				}
			}
			if (champions2DataModel.count !== 0) {
				for (var a = 0; a < champions2DataModel.count; a++) {
					var obj2 = champions2DataModel.get(a)
					mkp.stateSave("champions2DataModel", obj2["name"], a)
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
			widthSize = mkp.stateCountListLoad("widthSize")
			championsFull = mkp.varLoad("championsFull")
			loseRound = mkp.varLoad("loseRound")
			nextChampions = mkp.varLoad("nextChampions")
			grandChampions = mkp.varLoad("grandChampions")
			loseMaster = mkp.stateStringListLoad("loseMaster")
			championMaster = mkp.stateStringListLoad("championMaster")
			var countMainData = mkp.stateCountListLoad("champions1DataModel")
			if (countMainData !== 0) {
				champions1DataModel.clear()
				for (var i = 0; i < countMainData; i++)
					champions1DataModel.append({ "name": mkp.stateLoad("champions1DataModel", i) })
			}
			var countGrandData = mkp.stateCountListLoad("champions2DataModel")
			if (countGrandData !== 0) {
				champions2DataModel.clear()
				for (var a = 0; a < countGrandData; a++)
					champions2DataModel.append({ "name": mkp.stateLoad("champions2DataModel", a) })
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
		id: champions2ListView
		width: parent.width
		height: parent.height / 4
		anchors.bottom: parent.bottom
		model: ListModel {
			id: champions2DataModel
		}
		orientation: Qt.Horizontal
		layoutDirection: Qt.LeftToRight
		delegate: Rectangle {
			border.color: "black"
			width: champions1ListView.width / 8
			height: champions1ListView.height
			Text {
				anchors.fill: parent
				verticalAlignment: Text.AlignVCenter
				horizontalAlignment: Text.AlignHCenter
				text: model.name
			}
		}
	}

}
