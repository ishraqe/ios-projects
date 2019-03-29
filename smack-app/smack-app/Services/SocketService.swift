
import UIKit
import SocketIO

class SocketService: NSObject {
    static let instance = SocketService()
    let manager: SocketManager
    let socket: SocketIOClient
    
    
    override init() {
        self.manager = SocketManager(socketURL: URL(string: BASE_URL)!)
        self.socket = manager.defaultSocket
        super.init()
    }
    func establishConnection(){
        socket.connect()
    }
    func closeConnection(){
        socket.disconnect()
    }
    func addChannel(ChannelName: String, ChannelDesc: String, completion: @escaping CompletionHandler){
        socket.emit("newChannel", ChannelName, ChannelDesc)
        completion(true)
    }
    func getChannels(completion: @escaping CompletionHandler){
        socket.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else {return}
            guard let channelDesc = dataArray[1] as? String else {return}
            guard let channelId = dataArray[2] as? String else {return}
        
            let newChannel = Channel(channelName: channelName, channelDesc: channelDesc, id: channelId)
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
    func addMessage(messageBody: String, channelId: String, userId: String, completion: @escaping CompletionHandler){
        let user = UserDataService.instance
        socket.emit("newMessage", messageBody, userId, channelId,user.name, user.avatarName, user.avatarColor )
        completion(true)
        
    }
    
    
}
