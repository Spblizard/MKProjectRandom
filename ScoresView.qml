import QtQuick 2.0
import QtQuick.Controls

Item {

	signal sendBack()

	Text {
		id: text
		text: "ScoreView"
		anchors.centerIn: parent
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
