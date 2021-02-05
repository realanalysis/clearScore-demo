protocol PresenterHomeProtocol:class, PresenterViewControllerLifeCycleProtocol {
    
}

final class PresenterHome {
    private unowned var view: ViewHomeControllerProtocol
    private var viewModel: ViewModelHome
    private var router: RouterHomeProtocol

    init(view: ViewHomeControllerProtocol,
         viewModel: ViewModelHome,
         router: RouterHomeProtocol)
    {
        self.view = view
        self.viewModel = viewModel
        self.router = router
    }
}

extension PresenterHome: PresenterHomeProtocol {
    
}

extension PresenterHome: PresenterViewControllerLifeCycleProtocol {
    func viewDidLoad() {
        view.decorate(from: viewModel)
    }
}
