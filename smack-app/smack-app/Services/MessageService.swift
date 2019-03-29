import Foundation
import Alamofire
import SwiftyJSON

class MessageService{
    static let instance = MessageService()
    
    var channels = [Channel]()
    var messages = [Message]()
    var selectedChannel : Channel!
    
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
                            let channel = Channel.init(channelName: name, channelDesc: description, id: id)
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
    func findAllMessagesByChannel(channelId: String, completion: @escaping CompletionHandler){
        Alamofire.request("\(URL_GET_MESSAGES_BY_CHANNEL)\(channelId)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error != nil {
                self.clearMessages()
                guard let data = response.data else {return}
                if let json = JSON(data: data).array {
                    for item in json {
                        let messageBody = item["messageBody"].stringValue
                        let channelId = item["channelId"].stringValue
                        let id = item["_id"].stringValue
                        let userName = item["username"].stringValue
                        let userAvatar = item["userAvatar"].stringValue
                        let userAvatarColor = item["userAvatarColor"].stringValue
                        let timestamp = item["timeStamp"].stringValue
                        
                        let message = Message.init(message: messageBody, userName: userName, channelId: channelId, userAvatar: userAvatar, userAvatarColor: userAvatarColor, id: id, timestamp: timestamp)
                        self.messages.append(message)
                        print(self.messages)
                    }
                }
                completion(true)
            }else{
                completion(false)
            }
        }
    }
    func clearMessages() {
        messages.removeAll()
    }
    func clearChannels() {
        channels.removeAll()
    }
}
