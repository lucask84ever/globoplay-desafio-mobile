//
//  Coordinator.swift
//  globoplay-challenge
//
//  Created by Lucas Angeli Lima on 05/11/22.
//
import UIKit

public protocol CoordinatorFinishDelegate {
    func coordinatorDidFinish(child: Coordinator)
}

public protocol Coordinator: AnyObject {
    var type: CoordinatorType { get }
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    func start()
    func finish()
    init(navigation: UINavigationController)
}

public enum CoordinatorType {
    case tab, app
}

extension Coordinator {
    func finish() {
        childCoordinators.removeAll()
        finishDelegate?.coordinatorDidFinish(child: self)
    }
}
