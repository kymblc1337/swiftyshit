import Foundation
import Alamofire
import SwiftyJSON

struct CompletionData<DataType, ErrorType> {
    var array: DataType?
    var error: ErrorType?
}

//MARK: Protocol to all models from API
//MARK: type - string to show model specification
//Needs to be upcasted in future, bad solution :(
protocol AnyModel {
    var type: String? { get set }
    var name: String? { get set }
}

struct TextOnlyModel: AnyModel, Codable {
    var type: String?
    var name: String?
    let text: String
}

struct ImageWithTextModel: AnyModel, Codable {
    var type: String?
    var name: String?
    let text: String
    let url: String
}

struct VariatnsModel: AnyModel, Codable {
    var type: String?
    var name: String?
    let selectedId: Int
    let variants: [selectorModel]
    var items: [String] {
        var array = [String]()
        for selector in variants {
            array.append(selector.text)
        }
        return array
    }
}

struct selectorModel: Codable {
    let text: String
    let id: Int
}

//MARK: Enum to show post type in AnyModelProtocol
enum PostTypes {
    case textOnlyModel
    case imageWithTextModel
    case variatnsModel
}

extension PostTypes {
    var name: String {
        switch self {
        case .textOnlyModel:
            return "textOnlyModel"
        case .imageWithTextModel:
            return "imageWithTextModel"
        case .variatnsModel:
            return "variatnsModel"
        }
    }
}


class NetworkService: Codable {
    static let shared = NetworkService()

    private init() {

    }
}

extension NetworkService {
    func fetchAllContent(completion: @escaping (CompletionData<[AnyModel], Error>) -> Void) {
        let request = AF.request(Constants.url)
        var array = [AnyModel]()
        
        request.responseJSON { [self] response in
            switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    var completionData = CompletionData<[AnyModel], Error>()
                    completionData.array = []
                    for post in json["data"] {
                        do {
                            let data = post.1["data"]
                            if let _ = data["url"].string {
                                var res = try JSONDecoder().decode(ImageWithTextModel.self, from: data.rawData())
                                res.type = PostTypes.imageWithTextModel.name
                                res.name = post.1["name"].string
                                array.append(res)
                            } else if let _ = data["selectedId"].int{
                                var res = try JSONDecoder().decode(VariatnsModel.self, from: data.rawData())
                                res.type = PostTypes.variatnsModel.name
                                res.name = post.1["name"].string
                                array.append(res)
                            } else if let _ = data["text"].string{
                                var res = try JSONDecoder().decode(TextOnlyModel.self, from: data.rawData())
                                res.type = PostTypes.textOnlyModel.name
                                res.name = post.1["name"].string
                                array.append(res)
                            }
                        } catch let error {
                            completionData.error = error
                        }
                    }
                
                // dobule cycle is not best solution
                // maybe need to create dictionary
                // but it uses just 1 time while programm starts
                // so... it's not that bad 
                for view in json["view"] {
                    if let viewname = view.1.string {
                        for post in array {
                            if post.name == viewname {
                                completionData.array?.append(post)
                            }
                        }
                    }
                }
                completion(completionData)
                case .failure(let error):
                    completion(CompletionData(array: nil, error: error))
                }
        }
    }
}

extension NetworkService {
    private struct Constants {
        static var url = "https://chat.pryaniky.com/json/data-default-order-very-very-long-view.json"
    }
}
