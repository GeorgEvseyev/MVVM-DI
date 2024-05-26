//
//  MainViewModel.swift
//  MVVM + DI
//
//  Created by Георгий Евсеев on 3.05.24.
//

import UIKit

protocol IMainViewModel: AnyObject {
    var text: Bindable<String> { get }
    func parse(data: Data)
    func buttonPressed()
}

final class MainViewModel {
    
    var text = Bindable<String>(value: "")
    private let router: IMainRouter?
    var networkManager: INetworkManager?
    init(router: IMainRouter, networkManager: INetworkManager) {
        self.router = router
        self.networkManager = networkManager
    }
}

extension MainViewModel: IMainViewModel {
    
    func parse(data: Data) {
        if let json = try? JSONSerialization.jsonObject(with: data) as? [Any] {
            text.value = "json1: \(json)"
        }
    }

    func buttonPressed() {
        networkManager?.sendRequest(address: UrlString().baseUrlString, completion: { [weak self] data, _ in
            if let data = data {
                self?.parse(data: data)
            }
        })
    }
}
