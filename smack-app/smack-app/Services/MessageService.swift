import Foundation
import Alamofire
import SwiftyJSON

class MessageService{
    static let instance = MessageService()
    
    var channels = [Channel]()
    
    func findAllChannels(completion: @escaping CompletionHandler){
        Alamofire.request(URL_GET_ALL_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER ).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else {return}
               // Swift 4
//                do {
//                    self.channels =  try JSONDecoder().decode([Channel].self, from: data)
//                     completion(true)
//                } catch let error {
//                    completion(false)
//                    debugPrint(error as Any)
//                }
//                print(self.channels)
                // Swift 3
                  if let json = JSON(data: data).array {
                        for item in json {
                            let name = item["name"].stringValue
                            let description =  item["description"].stringValue
                            let id = item["_id"].stringValue
                            let channel = Channel(channelName: name, channelDesc: description, id: id)
                            self.channels.append(channel)
                        }
                      
                        completion(true)
                    }
                
            }else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
