import UIKit
import ClearScoreUIKit

protocol ViewHomeControllerProtocol:class {
    func decorate(from viewModel: ViewModelHome)
}

final class ViewHomeController: UIViewController {
    var presenter: PresenterHomeProtocol!
    @IBOutlet weak var scoreView: ViewScoreDashBoard!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension ViewHomeController: ViewHomeControllerProtocol {
    func decorate(from viewModel: ViewModelHome) {
        DispatchQueue.main.async {
            self.view.backgroundColor  = viewModel.backgroundColor
            self.title = viewModel.title
            self.scoreView.decorate(from: viewModel.scoreViewModel)
        }
    }
}
 
