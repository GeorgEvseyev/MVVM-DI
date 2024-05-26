//
//  NetworService.swift
//  MVVM + DI
//
//  Created by Георгий Евсеев on 5.05.24.
//

import UIKit


protocol INetworkManager: AnyObject {
    func sendRequest(address: String, completion: @escaping(Data?, Error?) -> Void)
}

class NetworkManager: INetworkManager {
    
    var viewModel: IMainViewModel?

    func sendRequest(address: String, completion: @escaping(Data?, Error?) -> Void) {
        guard let url = URL(string: address) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            completion(data, error)
        }
        task.resume()
    }
}
