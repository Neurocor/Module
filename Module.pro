include(../common_qml.pri)

TARGET = moduleplugin
TARGET = $$qt5LibraryTarget($$TARGET)

QML_IMPORT_NAME = Module
QML_IMPORT_MAJOR_VERSION = 1


HEADERS += \
    moduleplugin.h

SOURCES += \
    moduleplugin.cpp

DISTFILES += qmldir \
            $$OUT_PWD/plugins.qmltypes \


unix:!macx: DISTFILES += *.qml
else: DISTFILES += CustomText.qml \
                    CustomButton.qml \
                    CustomTextBlock_backup.qml \
                    Histogram.qml \
                    Prompt.qml \
                    ButtonBlock.qml \
                    CircleProgressBar.qml \
                    Table.qml \
                    CustomSlider.qml \
                    CustomItemDelegate.qml \
                    CustomTextBlock.qml \
                    CustomSlider.qml

qmlFiles.files = $$DISTFILES
qmlFiles.path = $$DESTDIR

lupdate_only {
    SOURCES += $$DISTFILES
}

TRANSLATIONS += module_ru.ts


RESOURCES += \
    resources/res.qrc
