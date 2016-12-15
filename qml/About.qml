import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem



Page {
	id: aboutPage
	title: "About"
	
	header: PageHeader {
		id: pageHeader
		title: "About"
		StyleHints {
			foregroundColor: '#ffffff'
			backgroundColor: '#000000'
			dividerColor: UbuntuColors.slate
		}

		leadingActionBar {
			numberOfSlots: 1
			actions: [
				Action {
					id: actionSettings
					iconName: "back"
				        shortcut: "Ctrl+B"
					text: "Back"
					onTriggered: {
						onClicked: mainPageStack.pop(aboutPage)
					}
				}
			]
		}
	}

	Flickable {
		id: flickable
		anchors.fill: parent
		anchors.topMargin: units.gu(5)
		contentHeight: appColumn.height + launchpadColumn.height + poweredByColumn.height + devColumn.height +  origColumn.height + basedColumn.height + poweredByColumn.height + units.gu(12)

		Column {
			id: appColumn
			spacing: units.gu(1)
			anchors {
				top: parent.top; left: parent.left; right: parent.right; topMargin: units.gu(5)
			}
			Image {
				id: appImage
				source: "tuto/img/1.png"
				anchors.horizontalCenter: parent.horizontalCenter
				fillMode: Image.PreserveAspectCrop
			}
			Label {
				width: parent.width
				wrapMode: Text.WordWrap
				horizontalAlignment: Text.AlignHCenter
				text: "Colossal Cave Adventure (a.k.a. Adventure)"
			}
			Label {
				width: parent.width
				wrapMode: Text.WordWrap
				horizontalAlignment: Text.AlignHCenter
				text: "Version %1. Under License %2".arg("1.0").arg("<a href=\"http://www.gnu.org/licenses/gpl-3.0.en.html\">GPL3</a>")
				onLinkActivated: Qt.openUrlExternally(link)
			}
		}


		Column {
			id: devColumn
			anchors.top: appColumn.bottom
			anchors.topMargin: units.gu(2)
			width: parent.width
			ListItem.Header {
				id: devHeader
				text: "Development"
			}

			Repeater {
				id: devListView

				model: devModel
				delegate: ListItem.Standard {
					progression: true
					showDivider: false
					text: model.name
					onClicked: Qt.openUrlExternally(model.link)
				}
			}

			ListModel {
				id: devModel
				Component.onCompleted: initialize()
				function initialize() {
					devModel.append({ name: "Joan CiberSheep", link: "https://cibersheep.com/" })
				}
			}
		}

		Column {
			id: origColumn
			anchors.top: devColumn.bottom
			anchors.topMargin: units.gu(2)
			width: parent.width

			ListItem.Header {
				id: ogHeader
				text: "Original game by"
			}

			Repeater {
				id: origListView

				model: origModel
				delegate: ListItem.Standard {
					progression: true
					showDivider: false
					text: model.name
					onClicked: Qt.openUrlExternally(model.link)
				}
			}

			ListModel {
				id: origModel
				Component.onCompleted: initialize()
				function initialize() {
					origModel.append({ name: "Will Crowther, Don Woods and David Platt", link: "http://advent.jenandcal.familyds.org/" })
				}
			}
		}		
		Column {
			id: basedColumn
			anchors.top: origColumn.bottom
			anchors.topMargin: units.gu(2)
			width: parent.width

			ListItem.Header {
				id: bsHeader
				text: "Based on the port of"
			}

			Repeater {
				id: basedListView

				model: basedModel
				delegate: ListItem.Standard {
					progression: true
					showDivider: false
					text: model.name
					onClicked: Qt.openUrlExternally(model.link)
				}
			}

			ListModel {
				id: basedModel
				Component.onCompleted: initialize()
				function initialize() {
					basedModel.append({ name: "Mike Arnautov", link: "https://mipmip.org/" })
				}
			}
		}
		Column {
			id: launchpadColumn
			anchors.top: basedColumn.bottom
			anchors.topMargin: units.gu(4)
			width: parent.width
			ListItem.Header {
				id: lpHeader
				text: "Links"
			}

			Repeater {
				id: lpListView

				model: lpModel
				delegate: ListItem.Standard {
					progression: true
					showDivider: false
					text: model.name
					onClicked: Qt.openUrlExternally(model.link)
				}
			}

			ListModel {
				id: lpModel
				Component.onCompleted: initialize()
				function initialize() {
					lpModel.append({ name: "Will Crowther (initial game)", link: "https://en.wikipedia.org/wiki/William_Crowther_(programmer)" })
					lpModel.append({ name: "Don Woods (expansion)", link: "https://en.wikipedia.org/wiki/Don_Woods_(programmer)" })
					lpModel.append({ name: "Dave Platt (extension and porting)", link: "http://mud.wikia.com/wiki/Colossal_Cave_Adventure" })
					lpModel.append({ name: "Mike Arnautov (code port and info)", link: "http://mipmip.org/" })
					lpModel.append({ name: "Bill Morrow (pictures CC 2.0-By)", link: "https://commons.wikimedia.org/wiki/File:Colossal_Cave.jpg" })

					lpModel.append({ name: "Jen and Cal's Advent Family Tree", link: "http://jenandcal.familyds.org/MediaWiki/" })
					lpModel.append({ name: "Wikipedia (game history)", link: "https://en.wikipedia.org/wiki/Colossal_Cave_Adventure" })
					lpModel.append({ name: "Writer (qml app base)", link: "https://uappexplorer.com/app/uwp.costales" })
					lpModel.append({ name: "uNav (qml code)", link: "https://uappexplorer.com/app/navigator.costales" })
					lpModel.append({ name: "Podbird (intro code)", link: "https://uappexplorer.com/app/com.mikeasoft.podbird" })
				}
			}
		}
		Column {
			id: poweredByColumn
			anchors.top: launchpadColumn.bottom
			anchors.topMargin: units.gu(2)
			width: parent.width

			ListItem.Header {
				id: poweredbyHeader
				text: "Powered by"
			}

			Repeater {
				id: poweredbyListView

				model: poweredbyModel
				delegate: ListItem.Standard {
					progression: true
					showDivider: false
					text: model.name
					onClicked: Qt.openUrlExternally(model.link)
				}
			}

			ListModel {
				id: poweredbyModel
				Component.onCompleted: initialize()
				function initialize() {
					poweredbyModel.append({ name: "Emscripten (game port)", link: "https://kripken.github.io/emscripten-site" })
				}
			}
		}


	}
}
