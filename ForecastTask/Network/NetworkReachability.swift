//
//  NetworkReachability.swift
//  ForecastTask
//
//  Created by  Muhammad Ismail on 19/03/2022.
//

import UIKit
import Alamofire

class NetworkReachability {
    
    // MARK: - Properties
    
    static let shared = NetworkReachability()
    let reachabilityManager = NetworkReachabilityManager(host: "www.google.com")
    let offlineAlertController: UIAlertController = {
        UIAlertController(title: "No Network", message: "Please Connect to Network and Try Again", preferredStyle: .alert)
    }()
    
    
    // MARK: - Private Methods
    
    func startNetworkMonitoring() {
        reachabilityManager?.startListening { status in
            switch status {
            case .notReachable:
                self.showOfflineAlert()
            case .reachable(.cellular):
                self.dismissOfflineAlert()
            case .reachable(.ethernetOrWiFi):
                self.dismissOfflineAlert()
            case .unknown:
                debugPrint("Unknown Network State")
            }
        }
    }
    
    func showOfflineAlert() {
        let rootViewController = UIApplication.shared.windows.first?.rootViewController
        rootViewController?.present(offlineAlertController, animated: true, completion: nil)
    }
    
    func dismissOfflineAlert() {
        let rootViewController = UIApplication.shared.windows.first?.rootViewController
        rootViewController?.dismiss(animated: true, completion: nil)
    }
    
}
