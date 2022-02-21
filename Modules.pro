include(../common_qml.pri)

TARGET = modulesplugin
TARGET = $$qtLibraryTarget($$TARGET)

QML_IMPORT_NAME = Modules
QML_IMPORT_VERSION = 1


HEADERS += \
    modulesplugin.h

SOURCES += \
    modulesplugin.cpp

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
