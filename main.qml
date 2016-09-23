import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.2

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr(" ")

    MyWindow {
        id: myWindow
        anchors.fill: parent
        z: 1
    }

    MyMenu {
        id: myMenu
        anchors.fill: parent
        z: 2
    }
}













