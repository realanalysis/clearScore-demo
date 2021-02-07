@testable import Domain

final class SpyUseCaseGetCredit: UseCaseGetCreditProtocol {
    var success = true
    private(set) var executeCalled: Bool = false
  
    func execute(on completion: @escaping (Error?, EntityCredit) -> Void) {
        executeCalled = true
        if success {
            completion(nil, EntityCredit())
        }
        else {
            completion(NSError(domain:"SpyUseCaseGetCredit", code:-1, userInfo:[ NSLocalizedDescriptionKey: "Cant reach end point"]), EntityCredit())
        }
    }
}
