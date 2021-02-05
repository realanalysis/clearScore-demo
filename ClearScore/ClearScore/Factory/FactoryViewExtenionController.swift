import UIKit

extension FactoryView {
    var navigationController: UINavigationController? {
        guard let rootVC = viewController else {
            return nil
        }
        let naviController = UINavigationController(rootViewController: rootVC)
        naviController.navigationBar.isTranslucent = false
        return naviController
    }
}

extension FactoryView {
    var viewController: UIViewController? {
        switch self {
        case .home:
            let view = ViewHomeController.init()
            let viewModel = ViewModelHome.init()
            let router = RouterHome.init(view)
            let presenter = PresenterHome.init(view: view,
                                               viewModel: viewModel,
                                               router: router)
            view.presenter = presenter
            return view
        }
    }
}
