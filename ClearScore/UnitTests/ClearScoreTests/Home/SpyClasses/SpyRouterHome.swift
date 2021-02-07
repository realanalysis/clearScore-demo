@testable import ClearScore

final class SpyRouterHome: RouterHomeProtocol {
    
    private(set) var presentAlertControllerCalled: Bool = false
  
    func presentAlertController(from message: String) {
        presentAlertControllerCalled = true
    }
}
