include( ../../../../common.pri )

# FIXME: for some strange reason, pkg-config does not works on OS X and
# fails with error message : Project ERROR: Package gio-2.0 not found
# although it works properly when running it from command line
#unix {
#    CONFIG += link_pkgconfig
#    PKGCONFIG += gio-2.0
#}
QMAKE_CXXFLAGS += $$system(pkg-config --cflags gio-2.0)
LIBS += $$system(pkg-config --libs gio-2.0)

TEMPLATE = lib
TARGET = ../UbuntuComponents
QT += qml quick quick-private
CONFIG += qt plugin no_keywords

#comment in the following line to disable traces
#DEFINES += QT_NO_DEBUG_OUTPUT

TARGET = $$qtLibraryTarget($$TARGET)
uri = Ubuntu.Components

HEADERS += plugin.h \
    themeengine.h \
    themeengine_p.h \
    themeloader_p.h \
    themesettings_p.h \
    suffixtree_p.h \
    itemstyleattached.h \
    itemstyleattached_p.h \
    rule.h \
    rule_p.h \
    qmlloader_p.h \
    qmlthemeloader_p.h \
    i18n.h \
    listener.h \
    ucscalingimageprovider.h \
    ucunits.h \
    ucqquickimageextension.h \
    quickutils.h \
    giconprovider.h \
    shapeitemtexture.h \
    shapeitem.h

SOURCES += plugin.cpp \
    themeengine.cpp \
    suffixtree.cpp \
    themesettings.cpp \
    itemstyleattached.cpp \
    rule.cpp \
    qmlloader.cpp \
    qmlthemeloader.cpp \
    i18n.cpp \
    listener.cpp \
    ucscalingimageprovider.cpp \
    ucunits.cpp \
    ucqquickimageextension.cpp \
    quickutils.cpp \
    giconprovider.cpp \
    shapeitem.cpp

# deployment rules for the plugin
installPath = $$[QT_INSTALL_IMPORTS]/$$replace(uri, \\., /)
target.path = $$installPath
INSTALLS += target

