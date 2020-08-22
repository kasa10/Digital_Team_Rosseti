#include <QtQml/qqmlprivate.h>
#include <QtCore/qdir.h>
#include <QtCore/qurl.h>

static const unsigned char qt_resource_tree[] = {
0,
0,0,0,0,2,0,0,0,5,0,0,0,1,0,0,0,
144,0,0,0,0,0,1,0,0,0,0,0,0,0,50,0,
0,0,0,0,1,0,0,0,0,0,0,0,82,0,0,0,
0,0,1,0,0,0,0,0,0,0,114,0,0,0,0,0,
1,0,0,0,0,0,0,0,8,0,0,0,0,0,1,0,
0,0,0};
static const unsigned char qt_resource_names[] = {
0,
1,0,0,0,47,0,47,0,18,15,126,124,188,0,77,0,
97,0,112,0,83,0,116,0,97,0,116,0,105,0,111,0,
110,0,73,0,116,0,101,0,109,0,46,0,113,0,109,0,
108,0,13,10,119,92,220,0,80,0,97,0,103,0,101,0,
50,0,70,0,111,0,114,0,109,0,46,0,113,0,109,0,
108,0,13,10,119,94,220,0,80,0,97,0,103,0,101,0,
49,0,70,0,111,0,114,0,109,0,46,0,113,0,109,0,
108,0,12,15,100,39,156,0,72,0,111,0,109,0,101,0,
70,0,111,0,114,0,109,0,46,0,113,0,109,0,108,0,
8,8,1,90,92,0,109,0,97,0,105,0,110,0,46,0,
113,0,109,0,108};
static const unsigned char qt_resource_empty_payout[] = { 0, 0, 0, 0, 0 };
QT_BEGIN_NAMESPACE
extern Q_CORE_EXPORT bool qRegisterResourceData(int, const unsigned char *, const unsigned char *, const unsigned char *);
QT_END_NAMESPACE
namespace QmlCacheGeneratedCode {
namespace _0x5f__main_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__HomeForm_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__Page1Form_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__Page2Form_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__MapStationItem_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}

}
namespace {
struct Registry {
    Registry();
    ~Registry();
    QHash<QString, const QQmlPrivate::CachedQmlUnit*> resourcePathToCachedUnit;
    static const QQmlPrivate::CachedQmlUnit *lookupCachedUnit(const QUrl &url);
};

Q_GLOBAL_STATIC(Registry, unitRegistry)


Registry::Registry() {
        resourcePathToCachedUnit.insert(QStringLiteral("/main.qml"), &QmlCacheGeneratedCode::_0x5f__main_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/HomeForm.qml"), &QmlCacheGeneratedCode::_0x5f__HomeForm_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/Page1Form.qml"), &QmlCacheGeneratedCode::_0x5f__Page1Form_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/Page2Form.qml"), &QmlCacheGeneratedCode::_0x5f__Page2Form_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/MapStationItem.qml"), &QmlCacheGeneratedCode::_0x5f__MapStationItem_qml::unit);
    QQmlPrivate::RegisterQmlUnitCacheHook registration;
    registration.version = 0;
    registration.lookupCachedQmlUnit = &lookupCachedUnit;
    QQmlPrivate::qmlregister(QQmlPrivate::QmlUnitCacheHookRegistration, &registration);
QT_PREPEND_NAMESPACE(qRegisterResourceData)(/*version*/0x01, qt_resource_tree, qt_resource_names, qt_resource_empty_payout);
}

Registry::~Registry() {
    QQmlPrivate::qmlunregister(QQmlPrivate::QmlUnitCacheHookRegistration, quintptr(&lookupCachedUnit));
}

const QQmlPrivate::CachedQmlUnit *Registry::lookupCachedUnit(const QUrl &url) {
    if (url.scheme() != QLatin1String("qrc"))
        return nullptr;
    QString resourcePath = QDir::cleanPath(url.path());
    if (resourcePath.isEmpty())
        return nullptr;
    if (!resourcePath.startsWith(QLatin1Char('/')))
        resourcePath.prepend(QLatin1Char('/'));
    return unitRegistry()->resourcePathToCachedUnit.value(resourcePath, nullptr);
}
}
int QT_MANGLE_NAMESPACE(qInitResources_qml)() {
    ::unitRegistry();
    Q_INIT_RESOURCE(qml_qmlcache);
    return 1;
}
Q_CONSTRUCTOR_FUNCTION(QT_MANGLE_NAMESPACE(qInitResources_qml))
int QT_MANGLE_NAMESPACE(qCleanupResources_qml)() {
    Q_CLEANUP_RESOURCE(qml_qmlcache);
    return 1;
}
