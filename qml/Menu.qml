/*
 * Colossal Cave Afventure for Ubuntu. 
 * Developed by CiberSheep. This is a port of the 
 * original computer game from Crowther, expansioned by Woods and 
 * extended by Platt. This app uses the code of Writer and uNav 
 * (Costales) and Podbird (Sheldon).
 * 
 * This app is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 * 
 * Distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem

MainView {
    id: menuView
    anchors.fill: parent
    anchorToKeyboard: true

    Page {
        id: pageMenu
        
        property bool expandLink: false
        property bool expandImg: false
        property bool expandTableCreate: false
        property bool expandFind: false
        property bool expandReplace: false
        
        header: PageHeader {
            id: pageHeader
            title: "Menu"
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
                        text: "Back"
		        shortcut: "Ctrl+B"
                        onTriggered: {
                            onClicked: mainPageStack.pop(pageMenu)
                        }
                    }
                ]
            }
            trailingActionBar {
                numberOfSlots: 1
                actions: [
                    Action {
                        id: actionAbout
                        iconName: "info"
                        shortcut: "Ctrl+I"
                        text: "About"
                        onTriggered: {
                            mainPageStack.push(Qt.resolvedUrl("About.qml"))
                        }
                    }
                ]
            }
        }

	Flickable {
		id: flickable
		anchors.fill: parent
		anchors.topMargin: units.gu(5)
		contentHeight: appColumn.height + introColumn.height + aboutColumn.height + commandsColumn.height + historyColumn.height + familyColumn.height + units.gu(32)

		Column {
			id: appColumn
			spacing: units.gu(1)
			anchors {
				top: parent.top; left: parent.left; right: parent.right; topMargin: units.gu(5)
			}
			
			Label {
				width: parent.width
				wrapMode: Text.WordWrap
				horizontalAlignment: Text.AlignHCenter
				text: "<b>Colossal Cave Adventure</b>"
			}
			Label {
				width: parent.width
				wrapMode: Text.WordWrap
				horizontalAlignment: Text.AlignHCenter
                		text: "Adv550 version\nSeptember 18 1984"
			}
		}
		Column {
			id: introColumn
			anchors.top: appColumn.bottom
			anchors.topMargin: units.gu(4)
			width: parent.width
			ListItem.Header {
				id: icHeader
				text: "Somewhere nearby is Colossal Cave,"
			}

			Label {
				wrapMode: Text.WordWrap
				width: parent.width
			    text: "<b>where others have found fortunes in treasure and gold, though it is rumored that some who enter are never seen again.  Magic is said to work in the cave.</b>"
			    anchors.left: parent.left
			    anchors.right: parent.right
			    anchors.leftMargin: units.gu(2)
			    anchors.rightMargin: units.gu(2)
			}
			Label {text: " "}
			Image {
				id: bannerImage
				source: "img/1.png"
				anchors.horizontalCenter: parent.horizontalCenter
				fillMode: Image.PreserveAspectCrop
			}
}

		Column {
			id: aboutColumn
			anchors.top: introColumn.bottom
			anchors.topMargin: units.gu(4)
			width: parent.width
			ListItem.Header {
				id: abHeader
				text: "The Game"
			}

			Label {
				id: abc0
				wrapMode: Text.WordWrap
				width: parent.width
			    text: "<b>Explore,</b> through simple text commands, a cave rumored to be filled with <b>wealth.</b> Earn points for <b>acquiring treasure</b> and escape the cave <b>alive.</b> The maximum amount of points in this version of the game are <b>550.</b>"
			    anchors.left: parent.left
			    anchors.right: parent.right
			    anchors.leftMargin: units.gu(2)
			    anchors.rightMargin: units.gu(2)
			}


			Label {
				id: abc1
				wrapMode: Text.WordWrap
				width: parent.width
			    text: "The game can be played typing entirely from the <b>keyboard,</b> as long as the <b>text input field</b> remains in focus (with the cursor blinking in it)."
			    anchors.left: parent.left
			    anchors.right: parent.right
			    anchors.leftMargin: units.gu(2)
			    anchors.rightMargin: units.gu(2)
			}
			Label {
				wrapMode: Text.WordWrap
				width: parent.width
			    text: "Commands can be <b>submitted</b> by pressing the ENTER key (a.k.a. RETURN or GO) or the submit button. <b>Up</b> and <b>down</b> arrow keys allow recalling/selecting previous commands."
			    anchors.left: parent.left
			    anchors.right: parent.right
			    anchors.leftMargin: units.gu(2)
			    anchors.rightMargin: units.gu(2)
			}
			Label {text: " "}
			Label {
				wrapMode: Text.WordWrap
				width: parent.width
			    text: "If you wish to <b>stop playing</b> and to continue at some other time, <b>it is not necessary to use the save command</b> – just open the app again and you will be offered the option of <b>continuing the current game,</b> if there is one."
			    anchors.left: parent.left
			    anchors.right: parent.right
			    anchors.leftMargin: units.gu(2)
			    anchors.rightMargin: units.gu(2)

			}
			Label {
				wrapMode: Text.WordWrap
				width: parent.width
			    text: "The game runs <b>locally</b> – there is no network access. All data is stored in the app cache."
			    anchors.left: parent.left
			    anchors.right: parent.right
			    anchors.leftMargin: units.gu(2)
			    anchors.rightMargin: units.gu(2)

			}

		}

		Column {
			id: commandsColumn
			anchors.top: aboutColumn.bottom
			anchors.topMargin: units.gu(4)
			width: parent.width
			ListItem.Header {
				id: coHeader
				text: "Some Commands"
			}

			Label {
				wrapMode: Text.WordWrap
				width: parent.width
			    text: "<b>To move,</b> try words like FOREST, BUILDING, DOWNSTREAM, ENTER, EAST (e), WEST (w), NORTH (n), SOUTH (s), UP (u), or DOWN (d)."
			    anchors.left: parent.left
			    anchors.right: parent.right
			    anchors.leftMargin: units.gu(2)
			    anchors.rightMargin: units.gu(2)
			}
			Label {
				wrapMode: Text.WordWrap
				width: parent.width
			    text: "There's a few <b>special objects,</b> like a black rod hidden in the cave.  These objects can be manipulated using <b>some action words.</b> Usually you will need to type both the object and action words (in either order). Some objects also <b>imply verbs;</b> in particular, «INVENTORY» (inv) implies «TAKE INVENTORY», which gives you a <b>list of the things</b> you're carrying."
			    anchors.left: parent.left
			    anchors.right: parent.right
			    anchors.leftMargin: units.gu(2)
			    anchors.rightMargin: units.gu(2)
			}
			Label {text: " "}
			Label {
				wrapMode: Text.WordWrap
				width: parent.width
			    text: "To <i>speed</i> the game you can sometimes <b>move long distances</b> with a single word. For example, typing «BUILDING» usually <b>gets you</b> to the building from anywhere above ground <b>except</b> when lost in the forest."
			    anchors.left: parent.left
			    anchors.right: parent.right
			    anchors.leftMargin: units.gu(2)
			    anchors.rightMargin: units.gu(2)
			}
			Label {
				wrapMode: Text.WordWrap
				width: parent.width
			    text: "Also, note that cave passages <b>turn a lot,</b> and that leaving a room to the north <b>does not</b> guarantee entering the next from the south. Good luck!"
			    anchors.left: parent.left
			    anchors.right: parent.right
			    anchors.leftMargin: units.gu(2)
			    anchors.rightMargin: units.gu(2)

			}
			Label {text: " "}
			Label {text: " "}
			Image {
				id: histoImage
				source: "img/2.jpg"
				anchors.horizontalCenter: parent.horizontalCenter
				width: parent.width
				fillMode: Image.PreserveAspectFit
			}

		}
		Column {
			id: historyColumn
			anchors.top: commandsColumn.bottom
			anchors.topMargin: units.gu(4)
			width: parent.width
			ListItem.Header {
				id: hiHeader
				text: "History"
			}

			Label {
				wrapMode: Text.WordWrap
				width: parent.width
			    text: "<b>Colossal Cave Adventure</b> (also known as <i>ADVENT, Colossal Cave,</i> or <i>Adventure</i>) is a text adventure game, developed originally in 1976, by <b>Will Crowther</b> for the PDP-10 mainframe. The game <b>was expanded</b> upon in 1977, with help from <b>Don Woods,</b> and other programmers created several <b>variations</b> on the game and ports to other systems in the following years."
			    anchors.left: parent.left
			    anchors.right: parent.right
			    anchors.leftMargin: units.gu(2)
			    anchors.rightMargin: units.gu(2)
			}
			Label {text: " "}

			Label {
				wrapMode: Text.WordWrap
				width: parent.width
			    text: "The concept bore out from Crowther's background as a caving enthusiast, with the game's cave structured loosely around the Mammoth Cave system in Kentucky."
			    anchors.left: parent.left
			    anchors.right: parent.right
			    anchors.leftMargin: units.gu(2)
			    anchors.rightMargin: units.gu(2)
			}
			Label {
				wrapMode: Text.WordWrap
				width: parent.width
			    text: "Colossal Cave Adventure is the <b>first</b> known work of <i>interactive fiction</i> and, as the first text adventure game, is considered the <b>precursor</b> for the adventure game genre. Colossal Cave Adventure also contributed towards the <b>role playing and roguelike genres.</b>"
			    anchors.left: parent.left
			    anchors.right: parent.right
			    anchors.leftMargin: units.gu(2)
			    anchors.rightMargin: units.gu(2)
			}
			Label {text: " "}
			Label {
				wrapMode: Text.WordWrap
				width: parent.width
			    text: "Will Crowther was a programmer at Bolt, Beranek &amp; Newman (BBN). Him and his wife were experienced <b>cavers,</b> having previously helped to create vector map surveys of the Mammoth Cave in Kentucky in the early 1970s for the <i>Cave Research Foundation.</i> In addition, Crowther enjoyed playing the <b>tabletop</b> role-playing game <i>Dungeons &amp; Dragons</i> with a regular group which included <b>Eric S. Roberts</b> and <b>Dave Lebling,</b> one of the future founders of <b>Infocom.</b> Following his divorce, Crowther wanted to connect better with his daughters, and decided a computerized simulation of his cave explorations with <b>elements</b> of his role-playing games would help. He created a means by which the game could be <b>controlled through natural language</b> input so that it would be «a thing that gave you the illusion anyway that you'd typed in English commands and it did what you said»."
			    anchors.left: parent.left
			    anchors.right: parent.right
			    anchors.leftMargin: units.gu(2)
			    anchors.rightMargin: units.gu(2)
			}
			Label {text: " "}
			Label {
				wrapMode: Text.WordWrap
				width: parent.width
			    text: "Crowther's original version of the game did not include any <b>scorekeeping</b> and once it was complete, Crowther showed it off to his co-workers at BBN for feedback, leaving the <b>compiled game</b> in a directory before taking a month off for vacation. During that time, others had found the game and it was <b>distributed widely</b> across the network, which had surprised Crowther on his return. Though titled in-game as <i>Colossal Cave Adventure,</i> its executable file was simply named <i>ADVENT,</i> which led to this becoming an alternate name for the game."
			    anchors.left: parent.left
			    anchors.right: parent.right
			    anchors.leftMargin: units.gu(2)
			    anchors.rightMargin: units.gu(2)
			}
			Label {text: " "}
			Label {
				wrapMode: Text.WordWrap
				width: parent.width
			    text: "One of those that had discovered the game was <b>Don Woods,</b> a graduate student at Stanford University in 1976. Woods wanted to expand upon the game, and contacted Crowther to gain access to the source code. Woods added more high <b>fantasy-related elements</b> based on his love of J.R.R. Tolkien. He also introduced a <b>scoring system</b> within the game, and added 140 map locations, 293 vocabulary words, 53 objects (15 treasure objects), travel tables, and miscellaneous messages. Don Woods continued <b>releasing</b> updated editions through to at least the mid-1990s."
			    anchors.left: parent.left
			    anchors.right: parent.right
			    anchors.leftMargin: units.gu(2)
			    anchors.rightMargin: units.gu(2)
			}
			Label {text: " "}
			Label {
				wrapMode: Text.WordWrap
				width: parent.width
			    text: "Crowther <b>did not</b> distribute the source code to his version, while Woods, once completed with his improvements, <b>widely distributed</b> the code alongside the compiled executable. Woods' 1977 version became the more <b>recognizable</b> and <i>canon</i> version of Colossal Cave Adventure in part due to wider code availability. Crowther's original code was thought to have <b>been lost</b> until 2007, when an unmodified version of it was found on Woods' student account archive."
			    anchors.left: parent.left
			    anchors.right: parent.right
			    anchors.leftMargin: units.gu(2)
			    anchors.rightMargin: units.gu(2)
			}
			Label {text: " "}
			Label {
				wrapMode: Text.WordWrap
				width: parent.width
			    text: "<b>Dave Platt's</b> 550-point version (released in 1984) was innovative in a number of ways. It broke away from coding the game <b>directly</b> in a programming language such as FORTRAN or C. Instead, Platt developed the A-code – a language for <b>adventure programming</b> – and wrote his extended version in that language. The A-code source was pre-processed by a FORTRAN 77 «munger» program, which <b>translated</b> A-code. Platt's version was also notable for providing a <b>randomised</b> variety of responses to the player, introducing a number of rare «cameo» events, and committing some outrageous puns. Dave Platt's version of Colossal Cave is perhaps the most famous variant of this game other than the original, itself a jumping-off point for <b>many other versions.</b>"
			    anchors.left: parent.left
			    anchors.right: parent.right
			    anchors.leftMargin: units.gu(2)
			    anchors.rightMargin: units.gu(2)
			}
		}
		Column {
			id: familyColumn
			anchors.top: historyColumn.bottom
			anchors.topMargin: units.gu(6)
			width: parent.width
			Image {
				id: appImage
				source: "img/plat550-tree.png"
				anchors.horizontalCenter: parent.horizontalCenter
				width: parent.width
				fillMode: Image.PreserveAspectFit
			}
			Label {
				id: legend
				wrapMode: Text.WordWrap
				width: parent.width
			    text: "CROW0000: Crowther's version. WOOD0350: Don Woods' extension. 350 points. PLAT0550: Dave Platt's 550-point expansion."
			    textSize: Label.Small
			    anchors.left: parent.left
			    anchors.right: parent.right
			    anchors.leftMargin: units.gu(2)
			    anchors.rightMargin: units.gu(2)
			}
		}
	}
}
}
