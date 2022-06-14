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
            $$OUT_PWD/plugins.qmltypes

unix:!macx: DISTFILES += *.qml
else: DISTFILES += CustomText.qml \
                    CustomButton.qml \
                    CustomRadioDelegate.qml \
                    Histogram.qml \
                    ButtonBlock.qml \
                    CircleProgressBar.qml \
                    Table.qml \
                    CustomSlider.qml \
                    CustomItemDelegate.qml \
                    CustomTextBlock.qml \
                    CustomSlider.qml \
                    CommonColumn.qml \
                    CustomTextRow.qml \
                    FlipableTextBlock.qml

qmlFiles.files = $$DISTFILES
qmlFiles.path = $$DESTDIR

lupdate_only {
    SOURCES += $$DISTFILES
}

TRANSLATIONS += module_ru.ts


RESOURCES += \
    resources/res.qrc
