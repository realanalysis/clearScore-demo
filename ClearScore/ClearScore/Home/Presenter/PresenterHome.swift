import Domain

protocol PresenterHomeProtocol:class, PresenterViewControllerLifeCycleProtocol {
    
}

final class PresenterHome {
    private unowned var view: ViewHomeControllerProtocol
    private var viewModel: ViewModelHome
    private var router: RouterHomeProtocol
    private var useCase: UseCaseGetCreditProtocol

    init(view: ViewHomeControllerProtocol,
         viewModel: ViewModelHome,
         router: RouterHomeProtocol,
         useCase: UseCaseGetCreditProtocol)
    {
        self.view = view
        self.viewModel = viewModel
        self.router = router
        self.useCase = useCase
    }
    
    private func makeRequest() {
        self.useCase.execute { [weak self] (error, entity) in
            guard let self = self else { return }
            if let error = error {
            
                return
            }
            
            self.viewModel.transform(from: entity)
            self.view.decorate(from: self.viewModel)
        }
    }
}

extension PresenterHome: PresenterHomeProtocol {
    
}

extension PresenterHome: PresenterViewControllerLifeCycleProtocol {
    func viewDidLoad() {
        view.decorate(from: viewModel)
        self.makeRequest()
    }
}
