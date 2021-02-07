import API

public class FactoryDomain {
    public static let shared = FactoryDomain()
    
    public var useCaseGetCredit: UseCaseGetCreditProtocol {
        UseCaseGetCredit.init(repo: FactoryAPI.credit.defaultProtocol as! RepositoryCreditProtocol)
    }
}
