import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.2

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr(" ")

    ImageWindow {
        id: myWindow
        anchors.fill: parent
        z: 1
    }

    Rectangle {
        id: menuIcon
        width: 32
        height: 32
        x: 5; y: 5; z: 5
        color: "transparent"

        Image {
            id: img
            source: "qrc:/i/icons/right.png"
            anchors.fill: parent
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log(qsTr("Menu Button Clicked"))
                drawer.open()
            }
        }
    }

    Drawer {
          id: drawer
          width: parent.width * 0.33
          height: parent.height
          z: 3

          Label {
              id: header
              text: "Menu"
              font.pixelSize: 36
              anchors.fill: parent
              horizontalAlignment: Label.AlignHCenter
          }

          Rectangle {
              id: icon
              width: 32
              height: 32
              x: parent.width - 32
              y: parent.height / 2

              Image {
                  id: imgIcon
                  source: "qrc:/i/icons/left.png"
                  anchors.fill: parent
              }
          }
      }
}













