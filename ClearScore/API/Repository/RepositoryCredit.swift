public protocol RepositoryCreditProtocol: RepositoryProtocol {
    func eecuteGetMockCredit(on completion: @escaping (Int, Error?, DTOResponseCredit?) -> Void)
}

final class RepositoryCredit {
    private var statusCode: Int = -1
    private var error: Error? = NSError(domain:"API", code:-1, userInfo:[ NSLocalizedDescriptionKey: "Cant read url"])
    private var JSONData: Data?
    private var testing: Bool = false
    
    init() {
    }
    
    init(statusCode: Int, error: Error?, JSONData: Data?) {
        testing = true
        self.statusCode = statusCode
        self.error = error
        self.JSONData = JSONData
    }
    
    private func codableFrom<T: Codable>(statusCode: Int, error: Error?, data:Data?) -> (Int, Error?, T?) {
        guard let data = data else { return (-1, self.error, nil)}

        do {
            let tmpObjecs = try JSONDecoder().decode(T.self, from: data)
            if statusCode == 200 {
                return (statusCode, error, tmpObjecs)
            } else {
                return (statusCode, error ??  NSError(domain:"API", code:-1, userInfo:[ NSLocalizedDescriptionKey: "Cant reach end point"]), nil)
            }
        }   catch let error {
            return (statusCode, error, nil)
        }
    }
    
    private func excute<T: Codable>(from url: String, on completion: @escaping (Int, Error?, T?) -> Void) {
        guard let url = URL(string: url), !testing else {
            let tmpDcodableObjects:(statusCode: Int, error: Error?, object: T?) = self.codableFrom(statusCode: statusCode, error: error, data:JSONData)
            completion(tmpDcodableObjects.statusCode, tmpDcodableObjects.error, tmpDcodableObjects.object)
            return
        }
        
        DispatchQueue.global(qos: .utility).async {
            URLSession.shared.dataTask(with: url) {(data, response, responseError) in
                guard let response = response as? HTTPURLResponse else { return  completion(-1, self.error, nil)}
                let tmpDcodableObjects:(statusCode: Int, error: Error?, object: T?) = self.codableFrom(statusCode: response.statusCode, error: responseError, data:data)
                completion(tmpDcodableObjects.statusCode, tmpDcodableObjects.error, tmpDcodableObjects.object)
            }.resume()
        }
    }
}

extension RepositoryCredit: RepositoryCreditProtocol {
    func eecuteGetMockCredit(on completion: @escaping (Int, Error?, DTOResponseCredit?) -> Void) {
        return excute(from: "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values", on: completion)
    }
}
