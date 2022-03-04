include(../common_qml.pri)

TARGET = moduleplugin
TARGET = $$qtLibraryTarget($$TARGET)

QML_IMPORT_NAME = Module
QML_IMPORT_VERSION = 1


HEADERS += \
    moduleplugin.h

SOURCES += \
    moduleplugin.cpp

DISTFILES += qmldir \
            *.qml \
            $$OUT_PWD/plugins.qmltypes

qmlFiles.files = $$DISTFILES
qmlFiles.path = $$DESTDIR
