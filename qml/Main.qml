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
import Ubuntu.Web 0.2
import com.canonical.Oxide 1.9 as Oxide
import Qt.labs.settings 1.0



MainView {
        id: cca550

        objectName: "cca550"


    applicationName: "cca550.cibersheep"

    width: units.gu(100)
    height: units.gu(70)
    anchorToKeyboard: true
        property var settings: Settings {
            property bool firstRun: true
        }
    PageStack {
        id: mainPageStack
        anchors.fill: parent
        width: parent.width



        Component.onCompleted: {
            // Show the welcome wizard only when running the app for the first time
            if (settings.firstRun) {
                push(Qt.resolvedUrl("tuto/WelcomeWizard.qml"))
            } else {
                push(mainview)
            }
        }
	Page {
		id: mainview
		visible: false
            	onVisibleChanged: {
                if (visible)
                    webview.forceActiveFocus();
            }
            header: PageHeader {
                id: pageHeader
                title: "Colossal Cave Adventure"
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
                            iconName: "navigation-menu"
                            shortcut: "Ctrl+M"
                            text: "Menu"
                            onTriggered: {
                                Qt.inputMethod.hide();
                                mainPageStack.push(Qt.resolvedUrl("Menu.qml"))
                            }
                        }
                    ]
                }
            }
            WebContext {
                id: webcontext
                userAgent: "Mozilla/5.0 (Linux; Android 5.0; Nexus 5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.102 Mobile Safari/537.36"

            }

            WebView {
                id: webview
                anchors.top: pageHeader.bottom
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                //anchors.fill: parent
                z: -6
                context: webcontext
                url: "../www/index.html"
                preferences.appCacheEnabled: true
                preferences.javascriptCanAccessClipboard: true
                preferences.javascriptEnabled: true                
            }
	}


        Page {
            id: infopage
            



        }
        
    }
    

}

    
    
   
