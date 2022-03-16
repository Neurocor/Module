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
            $$OUT_PWD/plugins.qmltypes \
            Table.qml

unix:!macx: DISTFILES += *.qml
else: DISTFILES += CustomText.qml \
                    CustomTextBlock.qml \
                    CustomButton.qml \
                    Histogram.qml \
                    Prompt.qml \
                    ButtonBlock.qml \
                    CircleProgressBar.qml

qmlFiles.files = $$DISTFILES
qmlFiles.path = $$DESTDIR
