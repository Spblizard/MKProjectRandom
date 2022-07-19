import QtQuick 2.0
import QtQuick.Controls

Item {

	signal sendBack()

	Item {
		id: scoresItem
		width: parent.width / 3
		anchors {
			left: parent.left
			top: parent.top
			bottom: btnBack.top
		}

		Label {
			id: scoresLabel
			text: "Wins"
		}

		ListView {
			id: scoresView
			interactive: true
			anchors {
				top: scoresLabel.bottom
				topMargin: 5
				left: parent.left
				bottom: parent.bottom
				right: parent.right
			}
			z: 2
			model: WinsModelView
			delegate: Row {
				spacing: 3
				Text { text: name }
				Text { text: score }
			}
		}
	}

	Item {
		id: winnersItem
		property real widthItem: width / 3
		anchors {
			left: scoresItem.right
			top: parent.top
			bottom: parent.bottom
			right: parent.right
		}
		Item {
			id: ultChampItem
			width: parent.widthItem
			anchors {
				left: parent.left
				top: parent.top
				bottom: parent.bottom
			}
			Label {
				id: ultChampLabel
				text: "Ultimate Champion"
			}
			ListView {
				id: ultChampView
				interactive: true
				anchors {
					top: ultChampLabel.bottom
					topMargin: 5
					left: parent.left
					bottom: parent.bottom
					right: parent.right
				}
				model: UltChampModelView
				delegate: Row {
					spacing: 3
					Text { text: name }
					Text { text: score }
				}
			}
		}
		Item {
			id: grndChampItem
			width: parent.widthItem
			anchors {
				left: ultChampItem.right
				top: parent.top
				bottom: parent.bottom
			}
			Label {
				id: grndChampLabel
				text: "Grand Champion"
			}
			ListView {
				id: grndChampView
				interactive: true
				anchors {
					top: grndChampLabel.bottom
					topMargin: 5
					left: parent.left
					bottom: parent.bottom
					right: parent.right
				}
				model: GrndChampModelView
				delegate: Row {
					spacing: 3
					Text { text: name }
					Text { text: score }
				}
			}
		}
		Item {
			id: champItem
			width: parent.widthItem
			anchors {
				left: grndChampItem.right
				top: parent.top
				bottom: parent.bottom
			}
			Label {
				id: champLabel
				text: "Champion"
			}
			ListView {
				id: champView
				interactive: true
				anchors {
					top: champLabel.bottom
					topMargin: 5
					left: parent.left
					bottom: parent.bottom
					right: parent.right
				}

				model: ChampModelView
				delegate: Row {
					spacing: 3
					Text { text: name }
					Text { text: score }
				}
			}
		}
	}

	Button {
		id: btnBack
		anchors {
			left: parent.left
			bottom: parent.bottom
		}
		text: "Back"
		palette.buttonText: "black"
		onClicked: {
			sendBack()
		}
	}
}
