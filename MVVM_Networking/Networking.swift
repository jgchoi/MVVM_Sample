//
//  Networking.swift
//  MVVM_Sample
//
//  Created by Jung Geon Choi on 2019-03-12.
//  Copyright © 2019 Jung Geon Choi. All rights reserved.
//

import Foundation

public struct Networking {
	public init() {}
    public func performNetworkTask<T: Codable>(endpoint: GitHubAPI,
                                        type: T.Type,
                                        completion: ((_ response: T) -> Void)?) {
        let urlString = endpoint.baseURL.appendingPathComponent(endpoint.path).absoluteString.removingPercentEncoding
        guard let urlRequest = URL(string: urlString ?? "") else { return }

        let urlSession = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
            if let _ = error {
                return
            }
            guard let data = data else {
                return
            }
            let response = Response(data: data)
            guard let decoded = response.decode(type) else {
                return
            }
            completion?(decoded)
        }
        urlSession.resume()
    }

}
