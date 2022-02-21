#ifndef MODULEPLUGIN_H
#define MODULEPLUGIN_H

#include <QQmlEngineExtensionPlugin>

class ModulePlugin : public QQmlEngineExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlEngineExtensionInterface_iid)

};

#endif // MODULESPLUGIN_H
