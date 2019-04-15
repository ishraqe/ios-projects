import Foundation


class Message {
    private var _message: String
    private var _senderId: String
    
    
    var message: String {
        return _message
    }
    
    var senderId: String {
        return _senderId
    }
    
    init(message: String, senderId: String) {
        self._senderId = senderId
        self._message = message
    }
}
