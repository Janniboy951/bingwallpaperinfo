import QtQuick 2.0
import QtQuick.Layouts 1.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.plasmoid 2.0


Item {
    
    // Always display the compact view.
    // Never show the full popup view even if there is space for it.
    Plasmoid.preferredRepresentation: Plasmoid.fullRepresentation

    PlasmaComponents.Label {
        id: label
        anchors.fill: parent
        text: getWallpaperTitle()
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment:Text.AlignTop
        font.bold :true
        font.pointSize :15.0
    }
    PlasmaComponents.Label {
        id: label1
        anchors.fill: parent
        text: getWallpaperTitle()
        horizontalAlignment: Text.AlignHCenter
        wrapMode:Text.WordWrap 
        verticalAlignment: Text.AlignVCenter
    }


    function getWallpaperTitle() {
        var http = new XMLHttpRequest()
        var url = "https://www.bing.com/HPImageArchive.aspx?format=js&n=1&mkt=de-de";

        http.open("GET", url);

        http.onreadystatechange = function() { // Call a function when the state changes.
                    if (http.readyState == 4) {
                        if (http.status == 200) {
                            var imageData=JSON.parse(http.responseText).images[0]

                            label.text=imageData.title
                            label1.text=imageData.copyright

                        } else {
                            console.log("error: " + http.status)
                        }
                    }
                }
        http.send();
        return ""
    }
}

