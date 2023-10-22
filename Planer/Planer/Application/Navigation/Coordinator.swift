//  Created by Stanislav Shalgin on 22.10.2023.

protocol Coordinator: AnyObject {
    var parent: Coordinator? { get set }
    var childs: [Coordinator] { get set }
    
    func start()
}
