import UIKit
protocol RouterHomeProtocol {

}

final class RouterHome {
    private unowned var view: UIViewController
    init(_ view: UIViewController) {
        self.view = view
    }

}

extension RouterHome: RouterHomeProtocol {
    
}
 
