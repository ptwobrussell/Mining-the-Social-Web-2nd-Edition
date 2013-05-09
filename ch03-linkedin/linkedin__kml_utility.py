# -*- coding: utf-8 -*-

# Loosely adapated from http://code.google.com/apis/kml/articles/csvtokml.html
# XXX: This could potentially be rewritten to be more elegant

import xml.dom.minidom


def _createPlacemark(kmlDoc, d):

    extElement = kmlDoc.createElement('ExtendedData')
    for k in d:
        dataElement = kmlDoc.createElement('Data')
        dataElement.setAttribute('name', k)

        valueElement = kmlDoc.createElement('value')
        valueText = kmlDoc.createTextNode(d[k])
        valueElement.appendChild(valueText)

        dataElement.appendChild(valueElement)
        extElement.appendChild(dataElement)

    coorElement = kmlDoc.createElement('coordinates')
    coorElement.appendChild(kmlDoc.createTextNode(d['coords']))

    pointElement = kmlDoc.createElement('Point')
    pointElement.appendChild(coorElement)

    placemarkElement = kmlDoc.createElement('Placemark')
    placemarkElement.appendChild(pointElement)
    placemarkElement.appendChild(extElement)

    return placemarkElement


# Should update this to include a feature to orient meaningfully


def createKML(items, centroid_color='ff0000ff'):
    kmlDoc = xml.dom.minidom.Document()

    kmlElement = kmlDoc.createElementNS('http://earth.google.com/kml/2.2', 'kml')
    kmlElement.setAttribute('xmlns', 'http://earth.google.com/kml/2.2')
    kmlDoc.appendChild(kmlElement)

    styleElement = kmlDoc.createElement('Style')
    styleElement.setAttribute('id', 'centroid')
    iconStyleElement = kmlDoc.createElement('IconStyle')
    colorElement = kmlDoc.createElement('color')
    colorElement.appendChild(kmlDoc.createTextNode(centroid_color))
    iconStyleElement.appendChild(colorElement)
    styleElement.appendChild(iconStyleElement)

    documentElement = kmlDoc.createElement('Document')
    documentElement.appendChild(styleElement)

    for item in items:
        pm = _createPlacemark(kmlDoc, item)

        if item['label'] == 'CENTROID':
            styleUrlElement = kmlDoc.createElement('styleUrl')
            styleUrlElement.appendChild(kmlDoc.createTextNode('#centroid'))
            pm.appendChild(styleUrlElement)

        documentElement.appendChild(pm)

    kmlElement.appendChild(documentElement)

    return kmlDoc.toprettyxml('  ', newl='\n', encoding='utf-8')
