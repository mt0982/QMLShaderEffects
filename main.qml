import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    function openFile(fileUrl) {
        var request = new XMLHttpRequest();
        request.open("GET", fileUrl, false);
        request.send(null);
        return request.responseText;
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

//    Flickable {
//        anchors.fill: parent
//        contentWidth: img.width;
//        contentHeight: img.height

        Image {
            id: img
            source: "qrc:/i/lena.jpg"
            //fillMode: Image.PreserveAspectFit
            //width: parent.width
            //anchors.fill: parent

            ShaderEffect {
                anchors.fill: parent
                property variant src: img
                property variant value: slider.value

                vertexShader: openFile("qrc:/s/shaders/edge.vert")
                fragmentShader: openFile("qrc:/s/shaders/edge.frag")
            }
        }
//    }
}













