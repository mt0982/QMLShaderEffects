import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2

Item {
    id: myItem
    property url pathToFile;
    property size imgSize: img.sourceSize
    property int imageWidth: img.sourceSize.width
    property int imageHeight: img.sourceSize.height

    function openFile(fileUrl) {
        var request = new XMLHttpRequest();
        request.open("GET", fileUrl, false);
        request.send(null);
        return request.responseText;
    }

    Label {
        id: background
        text: "Choose a file"
        font.pixelSize: 96
        anchors.fill: parent
        verticalAlignment: Label.AlignVCenter
        horizontalAlignment: Label.AlignHCenter
    }

    Slider {
        id: slider
        orientation: Qt.Vertical
        x: parent.width - 30
        y: 15
        z: 1
        height: parent.height - slider.y * 2
        minimumValue: 0.0
        maximumValue: 1.0
        stepSize: 0.01

        onValueChanged: {
            console.log(slider.value)
        }
    }

    Image {
        id: img
        source: pathToFile
        fillMode: Image.PreserveAspectFit
        width: parent.width

        ShaderEffect {
            anchors.fill: parent
            property variant src: img
            property variant value: slider.value

            vertexShader: openFile("qrc:/s/shaders/edge.vert")
            fragmentShader: openFile("qrc:/s/shaders/edge.frag")
        }
    }

    Rectangle {
        id: divider
        width: 5
        height: parent.height
        x: parent.width / 2
        z: 4
        color: "#53ACC9"
        Drag.active: dragArea.drag.active

        MouseArea {
            id: dragArea
            anchors.fill: parent
            drag.target: parent
            drag.axis: Drag.XAxis

            onPositionChanged:  {
                if(divider.x > 0 && divider.x < myItem.width) {
                    console.log(divider.x)
                }
            }
        }
    }

    Rectangle {
        id: mask
        width: divider.x
        height: parent.height
        x: 0
        y: 0
        clip: true

        Image {
            id: img2
            source: pathToFile
            x: 0
            y: 0
            width: img.width
            height: img.height
        }
    }
}
