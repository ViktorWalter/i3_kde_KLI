/*
    Copyright (c) 2016 Carlos López Sánchez <musikolo{AT}hotmail[DOT]com>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.2

Item {
    id: layoutFetcher

    property var layoutFetcherPlugin: null
    property bool layoutFetcherFailedToInitialize: false
    
    function getLayoutFetcherPlugin() {
        
        if (layoutFetcherPlugin !== null) {
            return layoutFetcherPlugin
        }
        
        if (!layoutFetcherFailedToInitialize) {
            console.log('Initializing layoutFetcher plugin...')
            try {
                layoutFetcherPlugin = Qt.createQmlObject('import org.kde.private.layoutfetcher 1.0 as WW; WW.LayoutFetcher {}', layoutFetcher, 'LayoutFetcher')
                console.log('LayoutFetcher plugin initialized successfully!')
            }catch (e) {
                console.exception('ERROR: LayoutFetcher plugin FAILED to initialize -->', e)
                layoutFetcherFailedToInitialize = true
            }
        }
        
        return layoutFetcherPlugin
    }
    
    function getLayoutStr() {
        
        var plugin = getLayoutFetcherPlugin()
        if (plugin) {
            var result = plugin.getLayoutStr()
            if(result == ""){
                console.error("plugin.getLayoutStr() returned empty string")
            }
        return result
            
        } else {
            console.exception('ERROR: Getting the layout string - LayoutFetcher plugin not available')
        }
    }
}
