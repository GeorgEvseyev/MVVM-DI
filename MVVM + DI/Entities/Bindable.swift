//
//  File.swift
//  MVVM + DI
//
//  Created by Георгий Евсеев on 12.05.24.
//

import Foundation

class Bindable <T> {
    
    typealias Listener = (T) -> Void
    
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func bind(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
