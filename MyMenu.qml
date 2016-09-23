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
        margins: 30

        Flickable {
            width: drawer.width - 1
            height: parent.height - height
            contentHeight: 1000
            ScrollIndicator.vertical: ScrollIndicator { }

            /* Menu Header */
            Label {
                id: header
                text: "Menu"
                font.pixelSize: 36
                anchors.fill: parent
                horizontalAlignment: Label.AlignHCenter
            }

            /* Open File Button */
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
                spacing: 1

                /* Grayscale */
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

                /* Brightness */
                Button {
                    id: btnShaderBrightness
                    width: columnGrid.width
                    height: 48
                    text: qsTr("Shader - Brightness")

                    onClicked: {
                        console.log(qsTr("Button Shader Brightness Pressed"))
                        myWindow.fragmentShaderSource = openFile("qrc:/s/shaders/brightness.frag")
                    }
                }

                /* Blur */
                Button {
                    id: btnShaderBlur
                    width: columnGrid.width
                    height: 48
                    text: qsTr("Shader - Blur")

                    onClicked: {
                        console.log(qsTr("Button Shader Blur Pressed"))
                        myWindow.fragmentShaderSource = openFile("qrc:/s/shaders/blur.frag")
                    }
                }

                /* Edge */
                Button {
                    id: btnShaderEdge
                    width: columnGrid.width
                    height: 48
                    text: qsTr("Shader - Edge")

                    onClicked: {
                        console.log(qsTr("Button Shader Edge Pressed"))
                        myWindow.fragmentShaderSource = openFile("qrc:/s/shaders/edge.frag")
                    }
                }

                /* Dilation */
                Button {
                    id: btnShaderDilation
                    width: columnGrid.width
                    height: 48
                    text: qsTr("Shader - Dilation")

                    onClicked: {
                        console.log(qsTr("Button Shader Dilation Pressed"))
                        myWindow.fragmentShaderSource = openFile("qrc:/s/shaders/dilation.frag")
                    }
                }

                /* Blue Isolate */
                Button {
                    id: btnShaderBlueIsolate
                    width: columnGrid.width
                    height: 48
                    text: qsTr("Shader - Blue Isolate")

                    onClicked: {
                        console.log(qsTr("Button Shader Blue Isolate Pressed"))
                        myWindow.fragmentShaderSource = openFile("qrc:/s/shaders/blueisolate.frag")
                    }
                }

                /* Sobel */
                Button {
                    id: btnShaderSobel
                    width: columnGrid.width
                    height: 48
                    text: qsTr("Shader - Sobel")

                    onClicked: {
                        console.log(qsTr("Button Shader Sobel Pressed"))
                        myWindow.fragmentShaderSource = openFile("qrc:/s/shaders/sobel.frag")
                    }
                }

                /* Billboard */
                Button {
                    id: btnShaderBillboard
                    width: columnGrid.width
                    height: 48
                    text: qsTr("Shader - Billboard")

                    onClicked: {
                        console.log(qsTr("Button Shader Billboard Pressed"))
                        myWindow.fragmentShaderSource = openFile("qrc:/s/shaders/billboard.frag")
                    }
                }
            }
        }
    }
}




















