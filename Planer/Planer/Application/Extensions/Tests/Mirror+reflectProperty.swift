//  Created by Stanislav Shalgin on 22.10.2023.

extension Mirror {
    static func reflectProperty<T>(of instance: Any, name: String) -> T? {
        let wrapperName = "_\(name)"
        let searchNames: [String?] = [name, "$__lazy_storage_$_\(name)", wrapperName]
        let mirror = Mirror(reflecting: instance)

        for child in mirror.children where searchNames.contains(child.label) {
            if child.label == wrapperName {
                return reflectProperty(of: child.value, name: "wrappedValue")
            } else {
                return child.value as? T
            }
        }

        return nil
    }
}
