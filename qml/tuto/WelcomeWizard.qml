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
import "components"

// Initial Walkthrough tutorial
Walkthrough {
    id: walkthrough
    onFinished: {
        cca550.settings.firstRun = false;
        mainPageStack.pop()
        mainPageStack.push(mainview)
    }
    model: [
        Slide1{},
        Slide2{},
        Slide3{},
        Slide4{},
        Slide5{},
        Slide6{}
    ]
}
