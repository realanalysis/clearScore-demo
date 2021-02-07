@testable import ClearScore

final class SpyViewHomeControlller: ViewHomeControllerProtocol {
    private(set) var decorateCalled: Bool = false

    func decorate(from viewModel: ViewModelHome) {
        decorateCalled = true
    }
}
