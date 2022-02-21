#ifndef MODULESPLUGIN_H
#define MODULESPLUGIN_H

#include <QQmlEngineExtensionPlugin>

class ModulesPlugin : public QQmlEngineExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlEngineExtensionInterface_iid)

};

#endif // MODULESPLUGIN_H
