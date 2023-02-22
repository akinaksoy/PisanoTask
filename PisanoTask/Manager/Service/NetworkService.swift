//
//  NetworkService.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 22.02.2023.
//

import Foundation
import Network

class NetworkService {
    static let shared = NetworkService()
    
    let monitor = NWPathMonitor()
    private var status: NWPath.Status = .requiresConnection
    var isReachable: Bool { status == .satisfied }
    var isReachableOnCellular: Bool = true
    var networkConnection = true
    
    func startMonitoring() {
        
        monitor.pathUpdateHandler = { [weak self] path in
            self?.status = path.status
            self?.isReachableOnCellular = path.isExpensive
            
            if path.status == .satisfied {
                print("We're connected!")
                self?.networkConnection = true
            } else {
                print("No connection.")
                self?.networkConnection = false
            }
            print(path.isExpensive)
        }
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }
    
    func stopMonitoring() {
        monitor.cancel()
    }
}
