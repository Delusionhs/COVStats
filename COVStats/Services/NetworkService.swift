import Foundation
import SystemConfiguration
import Alamofire

enum NetworkError: Error {
    case networkError
    case dataError
}

protocol NetworkServiceProtocol {
    func getJSONData(URL: URL, parameters: [String: Any], completion: @escaping (Result<Data, NetworkError>) -> Void)
}

class NetworkService: NetworkServiceProtocol {

    func getJSONData(URL: URL, parameters: [String: Any], completion: @escaping (Result<Data, NetworkError>) -> Void) {
        AF.request(URL, parameters: parameters).responseJSON { responseJSON in
            switch responseJSON.result {
                case .success:
                    if let data = responseJSON.data {
                        completion(.success(data))
                    } else {
                        completion(.failure(NetworkError.dataError))
                    }
                case .failure:
                    completion(.failure(NetworkError.networkError))
            }
        }

    }
}
