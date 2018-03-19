import QtQuick 2.9
import QtQuick.Controls 2.1
import QtQuick.Window 2.3

ApplicationWindow {
    id: appWind
    visible: true
    width: 640
    height: 480
    title: qsTr("MKProjectRandom")

    Row {
        id: row1
        width: parent.width / 8
        height: parent.height / 4
        Rectangle {
            id: rect1
            width: parent.width
            height: parent.height
            border.color: "black"
            border.width: 1
            TextEdit { id: txt1; text: mkp.mkPers(0); anchors.centerIn: parent }
            MouseArea { anchors.fill: parent
                onClicked: {
                    edtTxt1.clear()
                    edtTxt1.insert(0, mkp.mkPers(0))
                    if (mkp.outInt() === 8)
                        mkp.subLose(txt2.getText(0, 20), 1)
                }
            }
        }
        Rectangle {
            width: parent.width
            height: parent.height
            border.color: "black"
            border.width: 1
            TextEdit { id: txt2; text: mkp.mkPers(1); anchors.centerIn: parent }
            MouseArea { anchors.fill: parent
                onClicked: {
                    edtTxt1.clear()
                    edtTxt1.insert(0, mkp.mkPers(1))
                    if (mkp.outInt() === 8)
                        mkp.subLose(txt1.getText(0, 20), 1)
                }
            }
        }
        Rectangle {
            width: parent.width
            height: parent.height
            border.color: "black"
            border.width: 1
            TextEdit { id: txt3; text: mkp.mkPers(2); anchors.centerIn: parent }
            MouseArea { anchors.fill: parent
                onClicked: {
                    edtTxt2.clear()
                    edtTxt2.insert(0, mkp.mkPers(2))
                    if (mkp.outInt() === 8)
                        mkp.subLose(txt4.getText(0, 20), 2)
                }
            }
        }
        Rectangle {
            width: parent.width
            height: parent.height
            border.color: "black"
            border.width: 1
            TextEdit { id: txt4; text: mkp.mkPers(3); anchors.centerIn: parent }
            MouseArea { anchors.fill: parent
                onClicked: {
                    edtTxt2.clear()
                    edtTxt2.insert(0, mkp.mkPers(3))
                    if (mkp.outInt() === 8)
                        mkp.subLose(txt3.getText(0, 20), 2)
                }
            }
        }
        Rectangle {
            width: parent.width
            height: parent.height
            border.color: "black"
            border.width: 1
            TextEdit { id: txt5; text: mkp.mkPers(4); anchors.centerIn: parent }
            MouseArea { anchors.fill: parent
                onClicked: {
                    edtTxt3.clear()
                    edtTxt3.insert(0, mkp.mkPers(4))
                    if (mkp.outInt() === 8)
                        mkp.subLose(txt6.getText(0, 20), 3)
                }
            }
        }
        Rectangle {
            width: parent.width
            height: parent.height
            border.color: "black"
            border.width: 1
            TextEdit { id: txt6; text: mkp.mkPers(5); anchors.centerIn: parent }
            MouseArea { anchors.fill: parent
                onClicked: {
                    edtTxt3.clear()
                    edtTxt3.insert(0, mkp.mkPers(5))
                    if (mkp.outInt() === 8)
                        mkp.subLose(txt5.getText(0, 20), 3)
                }
            }
        }
        Rectangle {
            width: parent.width
            height: parent.height
            border.color: "black"
            border.width: 1
            TextEdit { id: txt7; text: mkp.mkPers(6); anchors.centerIn: parent }
            MouseArea { anchors.fill: parent
                onClicked: {
                    edtTxt4.clear()
                    edtTxt4.insert(0, mkp.mkPers(6))
                    if (mkp.outInt() === 8)
                        mkp.subLose(txt8.getText(0, 20), 4)
                }
            }
        }
        Rectangle {
            width: parent.width
            height: parent.height
            border.color: "black"
            border.width: 1
            TextEdit { id: txt8; text: mkp.mkPers(7); anchors.centerIn: parent }
            MouseArea { anchors.fill: parent
                onClicked: {
                    edtTxt4.clear()
                    edtTxt4.insert(0, mkp.mkPers(7))
                    if (mkp.outInt() === 8)
                        mkp.subLose(txt7.getText(0, 20), 4)
                }
            }
        }
    }
    Row {
        id: row2
        anchors.top: row1.bottom
        width: parent.width / 4
        height: parent.height / 4
        Rectangle {
            width: parent.width
            height: parent.height
            border.color: "black"
            border.width: 1
            TextEdit { id: edtTxt1; anchors.centerIn: parent}
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    edtTxt5.clear()
                    edtTxt5.insert(0, edtTxt1.getText(0, 20))
                    if (mkp.outInt() === 8)
                        mkp.subLose(edtTxt2.getText(0, 20), 5)
                }
            }
        }
        Rectangle {
            width: parent.width
            height: parent.height
            border.color: "black"
            border.width: 1
            TextEdit { id: edtTxt2; anchors.centerIn: parent }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    edtTxt5.clear()
                    edtTxt5.insert(0, edtTxt2.getText(0, 20))
                    if (mkp.outInt() === 8)
                        mkp.subLose(edtTxt1.getText(0, 20), 5)
                }
            }
        }
        Rectangle {
            width: parent.width
            height: parent.height
            border.color: "black"
            border.width: 1
            TextEdit { id: edtTxt3; anchors.centerIn: parent }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    edtTxt6.clear()
                    edtTxt6.insert(0, edtTxt3.getText(0, 20))
                    if (mkp.outInt() === 8)
                        mkp.subLose(edtTxt4.getText(0, 20), 6)
                }
            }
        }
        Rectangle {
            width: parent.width
            height: parent.height
            border.color: "black"
            border.width: 1
            TextEdit { id: edtTxt4; anchors.centerIn: parent }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    edtTxt6.clear()
                    edtTxt6.insert(0, edtTxt4.getText(0, 20))
                    if (mkp.outInt() === 8)
                        mkp.subLose(edtTxt3.getText(0, 20), 6)
                }
            }
        }
    }

    Row {
        id: row3
        anchors.top: row2.bottom
        width: parent.width / 2
        height: parent.height / 4
        Rectangle {
            width: parent.width
            height: parent.height
            border.color: "black"
            border.width: 1

            TextEdit {
                id: edtTxt5
                anchors.centerIn: parent
                font.pointSize: parent.height / 4
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (mkp.outInt() < 8) {
                        mkp.winners(edtTxt5.getText(0, 20))
                        edtTxt7.clear()
                        edtTxt7.insert(0, "Master " + mkp.numbToStr() + " " + edtTxt5.getText(0, 20))
                    } else if (mkp.outInt () === 8) {
                        mkp.takeGrandPers(edtTxt5.getText(0, 20))
                        mkp.subLose(edtTxt6.getText(0, 20), 7)
                        edtTxt7.clear()
                        edtTxt7.insert(0, "Grand Master " + "1 " + edtTxt5.getText(0, 20))
                    } else if (mkp.outInt() === 9) {
                        mkp.takeGrandPers(edtTxt5.getText (0, 20))
                        edtTxt7.clear()
                        edtTxt7.insert(0, "Grand Master " + "2 " + edtTxt5.getText(0, 20))
                    } else if (mkp.outInt() === 10)
                        edtTxt7.insert(0, "Champion MKProject " + edtTxt5.getText(0, 20))
                }
            }
        }
        Rectangle {
            width: parent.width
            height: parent.height
            border.color: "black"
            border.width: 1

            TextEdit {
                id: edtTxt6
                anchors.centerIn: parent
                font.pointSize: parent.height / 4
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (mkp.outInt() < 8) {
                        mkp.winners(edtTxt6.getText(0, 20))
                        edtTxt7.clear()
                        edtTxt7.insert(0, "Master " + mkp.numbToStr() + " " + edtTxt6.getText(0, 20))
                    } else if (mkp.outInt () === 8) {
                        mkp.takeGrandPers(edtTxt6.getText(0, 20))
                        mkp.subLose(edtTxt5.getText(0, 20), 7)
                        edtTxt7.clear()
                        edtTxt7.insert(0, "Grand Master " + "1 " + edtTxt6.getText(0, 20))
                    } else if (mkp.outInt() === 9) {
                        mkp.takeGrandPers(edtTxt6.getText (0, 20))
                        edtTxt7.clear()
                        edtTxt7.insert(0, "Grand Master " + "2 " + edtTxt6.getText(0, 20))
                    } else if (mkp.outInt() === 10)
                        edtTxt7.insert(0, "Champion MKProject " + edtTxt6.getText(0, 20))
                }
            }
        }
    }
    Column {
        id: row4
        anchors.top: row3.bottom
        width: parent.width
        height: parent.height /4
        Rectangle {
            width: parent.width
            height: parent.height / 2
            border.color: "black"
            border.width: 1
            TextEdit {
                id: edtTxt7
                anchors.centerIn: parent
                font.pointSize: parent.height / 4
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (edtTxt7.getText(0, 20) !== "") {
                        mkp.numbPlus()
                        if (mkp.outInt() > 10)
                                Qt.quit()
                        txt1.clear()
                        txt2.clear()
                        txt3.clear()
                        txt4.clear()
                        txt5.clear()
                        txt6.clear()
                        txt7.clear()
                        txt8.clear()
                        if (mkp.outInt() < 8)
                           mkp.randomPers()
                        if (mkp.outInt() < 10) {
                            txt1.insert(0, mkp.mkPers(0))
                            txt2.insert(0, mkp.mkPers(1))
                            txt3.insert(0, mkp.mkPers(2))
                            txt4.insert(0, mkp.mkPers(3))
                            txt5.insert(0, mkp.mkPers(4))
                            txt6.insert(0, mkp.mkPers(5))
                            txt7.insert(0, mkp.mkPers(6))
                            txt8.insert(0, mkp.mkPers(7))
                        }
                        edtTxt1.clear()
                        edtTxt2.clear()
                        edtTxt3.clear()
                        edtTxt4.clear()
                        edtTxt5.clear()
                        edtTxt6.clear()
                        edtTxt7.clear()
                        if (mkp.outInt() === 10) {
                            edtTxt5.clear()
                            edtTxt6.clear()
                            edtTxt5.insert(0, mkp.gPers(0))
                            edtTxt6.insert(0, mkp.gPers(1))
                        }
                    }
                }
            }
        }
        Row {
            id: row5
            width: parent.width
            height: parent.height / 2
            Rectangle {
                id: rect2
                width: parent.width / 2
                height: parent.height
                border.color: "black"
                border.width: 1
                color: "cyan"
                Text { anchors.centerIn: parent; font.pointSize: parent.height / 4; text: "Save" }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        mkp.save()
                        mkp.stateSave(txt1.getText(0, 20), 1)
                        mkp.stateSave(txt2.getText(0, 20), 2)
                        mkp.stateSave(txt3.getText(0, 20), 3)
                        mkp.stateSave(txt4.getText(0, 20), 4)
                        mkp.stateSave(txt5.getText(0, 20), 5)
                        mkp.stateSave(txt6.getText(0, 20), 6)
                        mkp.stateSave(txt7.getText(0, 20), 7)
                        mkp.stateSave(txt8.getText(0, 20), 8)
                        mkp.stateSave(edtTxt1.getText(0, 20), 9)
                        mkp.stateSave(edtTxt2.getText(0, 20), 10)
                        mkp.stateSave(edtTxt3.getText(0, 20), 11)
                        mkp.stateSave(edtTxt4.getText(0, 20), 12)
                        mkp.stateSave(edtTxt5.getText(0, 20), 13)
                        mkp.stateSave(edtTxt6.getText(0, 20), 14)
                        mkp.stateSave(edtTxt7.getText(0, 20), 15)
                    }
                }
            }
            Rectangle {
                id: rect3
                width: parent.width / 2
                height: parent.height
                border.color: "black"
                border.width: 1
                color: "cyan"
                Text { anchors.centerIn: parent; font.pointSize: parent.height / 4; text: "Load" }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        mkp.load()
                        txt1.clear()
                        txt2.clear()
                        txt3.clear()
                        txt4.clear()
                        txt5.clear()
                        txt6.clear()
                        txt7.clear()
                        txt8.clear()
                        edtTxt1.clear()
                        edtTxt2.clear()
                        edtTxt3.clear()
                        edtTxt4.clear()
                        edtTxt5.clear()
                        edtTxt6.clear()
                        edtTxt7.clear()
                        txt1.insert(0, mkp.stateLoad(1))
                        txt2.insert(0, mkp.stateLoad(2))
                        txt3.insert(0, mkp.stateLoad(3))
                        txt4.insert(0, mkp.stateLoad(4))
                        txt5.insert(0, mkp.stateLoad(5))
                        txt6.insert(0, mkp.stateLoad(6))
                        txt7.insert(0, mkp.stateLoad(7))
                        txt8.insert(0, mkp.stateLoad(8))
                        edtTxt1.insert(0, mkp.stateLoad(9))
                        edtTxt2.insert(0, mkp.stateLoad(10))
                        edtTxt3.insert(0, mkp.stateLoad(11))
                        edtTxt4.insert(0, mkp.stateLoad(12))
                        edtTxt5.insert(0, mkp.stateLoad(13))
                        edtTxt6.insert(0, mkp.stateLoad(14))
                        edtTxt7.insert(0, mkp.stateLoad(15))
                    }
                }
            }
        }
    }
}
