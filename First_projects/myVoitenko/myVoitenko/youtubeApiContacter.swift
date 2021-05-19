//
//  youtubeApiContacter.swift
//  myVoitenko
//
//  Created by kymblc on 27.04.2020.
//  Copyright © 2020 traceback. All rights reserved.
//

import Foundation
import UIKit

struct responseItems: Decodable {
    var items : [repsonseInfo]
}

struct repsonseInfo : Decodable {
    var statistics : responseStatistic
}

struct responseStatistic : Decodable {
    var viewCount : String
    var subscriberCount : String
    var videoCount : String
}

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.numberStyle = .decimal
        return formatter
    }()
}

extension Int{
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}


class youtubeApiConnector {
    var channelId : String
    var channelUrl : String
    var response : responseItems? = nil
    var subscriberCounter : Int = 0
    var viewsCounter : Int = 0
    
    let dispatchGroup = DispatchGroup()
    
    init(channelId : String)
    {
        self.channelId = channelId
        self.channelUrl = "https://www.googleapis.com/youtube/v3/channels?part=statistics&id=" + self.channelId + settingApiKey
    }
    
    func deliverSubsToLabel(label : UILabel)
    {
        self.updateMySelf()
        self.dispatchGroup.notify(queue: .main) {
            label.text = self.subscriberCounter.formattedWithSeparator
        }
    }
    
    func updateMySelf() {
        self.dispatchGroup.enter()
        request(urlString: self.channelUrl) {(responseItems, error) in
            guard let subsString = responseItems?.items[0].statistics.subscriberCount else { return }
            self.subscriberCounter = Int(subsString) ?? 0
            self.dispatchGroup.leave()
        }

    }

    func request(urlString: String, completion: @escaping (responseItems?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error occured")
                    completion(nil, error)
                    return
                }
                guard let data = data else { return }
                do {
                    let tracks = try JSONDecoder().decode(responseItems.self, from: data)
                    completion(tracks, nil)
                } catch let jsonError {
                    print("Not avalible to decode JSON", jsonError)
                    completion(nil, jsonError)
                }
            }
        }.resume()
    }

}

