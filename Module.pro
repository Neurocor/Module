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
#            CustomText.qml \
#            Prompt.qml \
#            Histogram.qml \
#            CustomButton.qml \
#            CircleProgressBar.qml \
#            CustomTextBlock.qml \
#            ButtonBlock.qml

qmlFiles.files = $$DISTFILES
qmlFiles.path = $$DESTDIR
