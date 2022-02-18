include(../common_qml.pri)

TARGET = modulesplugin
QML_IMPORT_NAME = Modules
QML_IMPORT_VERSION = 1

DESTDIR = $${QML_BIN}/Modules

HEADERS += \
    modulesplugin.h

SOURCES += \
    modulesplugin.cpp

DISTFILES += qmldir \
            $$OUT_PWD/plugins.qmltypes \
            CustomText.qml \
            Prompt.qml \
            Histogram.qml \
            CustomButton.qml

qmlFiles.files = $$DISTFILES
qmlFiles.path = $$DESTDIR
