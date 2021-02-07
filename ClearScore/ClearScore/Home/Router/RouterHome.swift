import UIKit

protocol RouterHomeProtocol {
    func presentAlertController(from message: String)
}

final class RouterHome {
    private unowned var view: UIViewController
    init(_ view: UIViewController) {
        self.view = view
    }

}

extension RouterHome: RouterHomeProtocol {
    func presentAlertController(from message: String) {
        let alert = UIAlertController.init(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
        DispatchQueue.main.async {
            self.view.present(alert, animated: true, completion: nil)
        }
    }
}
 
