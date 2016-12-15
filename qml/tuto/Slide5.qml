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

// Slide 4
Component {
    id: slide4
    Item {
        id: slide1Container

        Image {
            anchors {
                top: parent.top
                bottom: introductionText.top
                bottomMargin: units.gu(2)
                horizontalCenter: parent.horizontalCenter
            }
            fillMode: Image.PreserveAspectFit
            source: Qt.resolvedUrl("img/5.png")
        }

        Label {
            id: introductionText
            anchors.centerIn: parent
            elide: Text.ElideRight
            fontSize: "x-large"
            maximumLineCount: 2
            text: "Save"
            horizontalAlignment: Text.AlignHCenter
            width: parent.width
            wrapMode: Text.WordWrap
        }

        Label {
            id: finalMessage
            anchors {
                top: introductionText.bottom
                bottom: parent.bottom
                left: parent.left
                right: parent.right
                margins: units.gu(1)
                topMargin: units.gu(3)
            }
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            text: "Found something interesting? Type <b>save <i>name</i></b> and you'll be able to get back to that moment."
            onLinkActivated: Qt.openUrlExternally(link)
        }
    }
}
