import sys

from PySide2.QtWidgets import QApplication
from PySide2.QtQuick import QQuickView
from PySide2.QtCore import QUrl
from PySide2.QtQml import QQmlApplicationEngine
import resource_rc

from PySide2.QtWebEngineWidgets import QWebEngineView
from PySide2.QtCore import QUrl

from Manager import *
import os

app = QApplication(sys.argv)
app.setOrganizationName("iustDataBase")
app.setOrganizationDomain("iustDataBase")
mongoengine.register_connection(alias='core', name="test")

backend = Manager()
engine = QQmlApplicationEngine()
engine.rootContext().setContextProperty("backend", backend)

engine.load(os.path.join(os.path.dirname(__file__), "../view/splashScreen.qml"))

app.exec_()
