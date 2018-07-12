import QtQuick 2.0
import QtQuick.Controls 1.4
import QtWebEngine 1.0
import QtQuick.Window 2.0
import QtQuick.Layouts  1.1
import QtQuick.Controls.Styles 1.4
import "../components"


Rectangle {
    id: root
    color: "#F0EEEE"
    property var model
    WebEngineView {
        id: webView
        anchors.fill: parent
        url: "https://classic.etnminers.com"
    }
}