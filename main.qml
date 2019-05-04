import QtQuick 2.9
import QtQuick.Controls 2.1
import QtQuick.Window 2.3

ApplicationWindow {
    id: appWind
    visible: true
    width: 640
    height: 480
    title: qsTr("MKProjectRandom")

    property int widthSize: 8
    property int heightSize: 1
    property int count: 0
    property int round: 1
    property bool grandRound: false

    Component.onCompleted: {
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
        if (grandRound) {
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

    function newGenerate() {
        if (grandRound) {
            for (var a = 0; a < dataModel.count; a++) {
                listView.currentIndex = a
                if (listView.currentItem.visible === true) {
                    var obj = dataModel.get(a)
                    var numb = obj["name"]
                    dataModel.clear()
                    dataModel.append({ "name": "Ultimate Champion MK Project " + numb })
                    widthSize = 1
                    listView.currentItem.enabled = false
                }
            }
        } else if (mainDataModel.count === 8 && !grandRound) {
            for (var j = 0; j < mainDataModel.count; j++)
                dataModel.append(mainDataModel.get(j))
            mainDataModel.clear()
            widthSize = 8
            grandRound = true
        } else if (!grandRound){
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
            Text { anchors.centerIn: parent; text: model.name; }
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
            Text { anchors.centerIn: parent; text: model.name; }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (index % 2) {
                        enabled = false
                        listView.currentIndex = index - 1
                        listView.currentItem.visible = false
                        count++
                    } else {
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
}
