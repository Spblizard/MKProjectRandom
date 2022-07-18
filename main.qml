import QtQuick 2.9
import QtQuick.Controls 2.1
import QtQuick.Window 2.3

ApplicationWindow {
    id: appWind
    visible: true
    width: 640
    height: 480
	title: qsTr("MKProjectRandom")

	SwipeView {
		id: swipeView
		anchors.fill: parent
		interactive: false

		TournamentView {
			id: tournView
			onSendSwipe: {
				swipeView.currentIndex++
			}
		}

		ScoresView {
			id: scoresView
			onSendBack: {
				swipeView.currentIndex--
			}
		}

		onCurrentIndexChanged: {
		}
	}
}
