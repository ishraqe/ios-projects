
import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewControllers = [
            makeTabController(viewController: AppsPageController(collectionViewLayout: UICollectionViewFlowLayout()), title: "Apps", imageName: "apps"),
            makeTabController(viewController: AppSearchController(collectionViewLayout: UICollectionViewFlowLayout()), title: "Search", imageName: "search"),
            makeTabController(viewController: UIViewController() , title: "Today", imageName: "today")
        ]
    }
    
    
    func makeTabController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
       
        let navController =  UINavigationController(rootViewController: viewController)
        
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.image = UIImage(named: imageName)
        
        
        return navController
    }
    
}
