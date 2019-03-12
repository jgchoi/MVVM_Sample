//
//  EndpointType.swift
//  MVVM_Sample
//
//  Created by Jung Geon Choi on 2019-03-12.
//  Copyright © 2019 Jung Geon Choi. All rights reserved.
//

import Foundation

public protocol EndpointType {
    var baseURL: URL { get }
    var path: String { get }
}
