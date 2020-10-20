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
                case .failure(_):
                    completion(.failure(NetworkError.networkError))
            }
        }

    }

    func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)

        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }

        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
}
