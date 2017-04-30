/***************************************************************************
 *   Copyright (C) 2017 Kai Uwe Broulik <kde@privat.broulik.de>            *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA .        *
 ***************************************************************************/

import QtQuick 2.0

import org.kde.latte 0.1 as Latte

Item {
    id: background


    Item {
        id: subRectangle
        width: parent.width/ 2
        height: width

        states: [
            State {
                name: "default"
                when: (root.position !== PlasmaCore.Types.RightPositioned)

                AnchorChanges {
                    target: subRectangle
                    anchors{ top:parent.top; bottom:undefined; left:parent.left; right:undefined;}
                }
            },
            State {
                name: "right"
                when: (root.position === PlasmaCore.Types.RightPositioned)

                AnchorChanges {
                    target: subRectangle
                    anchors{ top:parent.top; bottom:undefined; left:undefined; right:parent.right;}
                }
            }
        ]

        Rectangle {
            anchors.centerIn: parent
            width: 0.8 * parent.width
            height: width
            radius: width/2

            color: theme.textColor
            border.width: 1
            border.color: "grey"


            Latte.IconItem{
                id: audioStreamIcon
                anchors.fill: parent
                source: mainItemContainer.playingAudio && !mainItemContainer.muted ? "audio-volume-high" : "audio-volume-muted"

                MouseArea{
                    anchors.fill: parent
                    onClicked: mainItemContainer.toggleMuted();
                }
            }
        }
    }
}