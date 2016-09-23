import QtQuick.Window 2.2
import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.2

Item {

    function openFile(fileUrl) {
        var request = new XMLHttpRequest();
        request.open("GET", fileUrl, false);
        request.send(null);
        return request.responseText;
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

    FileDialog {
        id: fileDialog
        title: "Choose file"
        nameFilters: [ "Image files (*.jpg *.png)", "All files (*)" ]

        onAccepted: {
            console.log("Accepted: " + fileDialog.fileUrls)
            myWindow.pathToFile = fileDialog.fileUrl
            window.title = qsTr(myWindow.imageWidth.toString() + "x" + myWindow.imageHeight.toString())
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

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log(qsTr("Hide Menu Button Clicked"))
                        drawer.close()
                    }
                }
            }
        }

        Button {
            id: btnOpenFile
            text: "Open file"
            width: parent.width
            height: 48
            y: 48

            onClicked: {
                fileDialog.width = Screen.width * 0.6
                fileDialog.height =  Screen.height * 0.6
                fileDialog.open()
            }
        }

        Column {
            id: columnGrid
            width: parent.width
            y: btnOpenFile.y + 64
            x: 0

            Button {
                id: btnShaderGrayscale
                width: columnGrid.width
                height: 48
                text: qsTr("Shader - Grayscale")

                onClicked: {
                    console.log(qsTr("Button Shader Grayscale Pressed"))
                    myWindow.fragmentShaderSource = openFile("qrc:/s/shaders/grayscale.frag")
                }
            }
        }
    }
}




















