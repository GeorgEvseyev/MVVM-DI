//
//  MainAssembly.swift
//  MVVM + DI
//
//  Created by Георгий Евсеев on 10.05.24.
//

import UIKit

class Assembly {
    func assemble() -> UIViewController {
        let networkManager = NetworkManager()
        let router = MainRouter()
        let viewModel = MainViewModel(router: router, networkManager: networkManager)
        let controller = MainViewController(viewModel: viewModel)
        viewModel.networkManager = networkManager
        controller.viewModel = viewModel
        return controller
    }
}
