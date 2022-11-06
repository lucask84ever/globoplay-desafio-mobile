//
//  TabCoordinator.swift
//  globoplay-challenge
//
//  Created by Lucas Angeli Lima on 05/11/22.
//

import UIKit

protocol TabCoordinatorProtocol: Coordinator {
    var tabbarController: UITabBarController { get set }
    func selectPage(_ page: TabBarPage)
    func setSelectedIndex(_ index: Int)
    func currentPage() -> TabBarPage?
}

enum TabBarPage: Int {
    case coming = 0, search, favorites
    
    var title: String {
        switch self {
        case .coming:
            return "Início"
        case .search:
            return "Buscar Filme"
        case .favorites:
            return "Favoritos"
        }
    }
    
    var image: UIImage? {
        var imageName: String
        switch self {
        case .coming:
            imageName = "home"
        case .search:
            imageName = ""
        case .favorites:
            imageName = "star"
        }
        return UIImage(named: imageName, in: Bundle(for: TabCoordinator.self), compatibleWith: nil)
    }
}

class TabCoordinator: NSObject, TabCoordinatorProtocol {
    var tabbarController: UITabBarController
    var type: CoordinatorType { .tab }
    var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator]
    
    required init(navigation: UINavigationController) {
        tabbarController = UITabBarController()
        navigationController = navigation
        childCoordinators = []
    }
    
    func start() {
        let pages: [TabBarPage] = [.coming, .favorites]
        let controllers: [UINavigationController] = pages.map( { self.getTabController(for: $0) })
        prepareTabBarController(with: controllers)
    }
    
    func selectPage(_ page: TabBarPage) {
        
    }
    
    func setSelectedIndex(_ index: Int) {
        
    }
    
    func currentPage() -> TabBarPage? {
        return nil
    }
    
    private func prepareTabBarController(with controllers: [UINavigationController]) {
        tabbarController.delegate = self
        tabbarController.setViewControllers(controllers, animated: true)
        tabbarController.selectedIndex = TabBarPage.coming.rawValue
        tabbarController.tabBar.isTranslucent = false
        tabbarController.tabBar.backgroundColor = .black
        tabbarController.tabBar.tintColor = .red
        tabbarController.tabBar.unselectedItemTintColor = .darkGray
        navigationController.viewControllers = [tabbarController]
    }
    
    private func getTabController(for page: TabBarPage) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(false, animated: false)
        navController.tabBarItem = UITabBarItem(title: page.title, image: page.image, tag: page.rawValue)
        // instanciar o coordinator desses caras
        switch page {
        case .coming:
            let upcomingVC = UpComingViewController(viewModel: UpComingViewModel())
            navController.pushViewController(upcomingVC, animated: true)
        case .favorites:
            let favoritesVC = FavoriteMoviesViewController(viewModel: FavoritesMoviesViewModel())
            navController.pushViewController(favoritesVC, animated: true)
        case .search:
//            let upcomingVC = UpComingViewController(viewModel: UpComingViewModel())
//            navController.pushViewController(upcomingVC, animated: true)
            print("Não disponível ainda")
        }
        return navController
    }
}

extension TabCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        //
    }
}
