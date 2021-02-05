import UIKit

protocol ViewHomeControllerProtocol:class {
    func decorate(from viewModel: ViewModelHome)
}

final class ViewHomeController: UIViewController {
    var presenter: PresenterHomeProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()

    }
}

extension ViewHomeController: ViewHomeControllerProtocol {
    func decorate(from viewModel: ViewModelHome) {
        self.view.backgroundColor  = viewModel.backgroundColor
        self.title = viewModel.title
    }

}
 
