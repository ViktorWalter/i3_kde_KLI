import QtQuick 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras

Item {
  PlasmaComponents.Label {
    id:label
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.centerIn: parent
    height: implicitHeight

    elide: Text.ElideRight
    font.pixelSize: 20
    text: layoutFetcher.getLayoutStr();

  }

  LayoutFetcher {
      id:layoutFetcher
  }

  Timer {
    interval: 100; running: true; repeat: true;
    onTriggered: label.text = layoutFetcher.getLayoutStr();
  }

}
