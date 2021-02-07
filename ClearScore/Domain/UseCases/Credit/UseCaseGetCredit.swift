import API

public protocol UseCaseGetCreditProtocol {
    func execute(on completion: @escaping (Error?, EntityCredit) -> Void)
}

struct UseCaseGetCredit {
    var repo: RepositoryCreditProtocol

}

extension UseCaseGetCredit: UseCaseGetCreditProtocol {
    func execute(on completion: @escaping (Error?, EntityCredit) -> Void) {
        repo.eecuteGetMockCredit { (status, error, dto) in
            completion(error, EntityCredit.transform(from: dto))
        }
    }
}

