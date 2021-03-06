import Foundation
import Firebase

let DB_BASE = Database.database().reference()


class DataService {
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_GROUPS: DatabaseReference {
        return _REF_GROUPS
    }
    
    var REF_FEED : DatabaseReference {
        return _REF_FEED
    }
    
    func createDBUser(uid: String, userData: Dictionary<String, Any>){
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    func postMessage(forMessage message: String, forSender uid: String, forGroupKey groupKey: String?, sendCompletion: @escaping (_ status: Bool)->()){
        
        if groupKey != nil {
            // send to group ref
        }else {
            REF_FEED.childByAutoId().updateChildValues(["content": message, "senderId": uid])
            sendCompletion(true)
        }
    }
    func getAllFeedMessages(handler: @escaping (_ messages: [Message])->()) {
        REF_FEED.observeSingleEvent(of: .value, with: { (feedDataSnapShot) in
            var messagesArray = [Message]()
            guard let feedDataSnapShot = feedDataSnapShot.children.allObjects as? [DataSnapshot] else {return}
            
            for message in feedDataSnapShot {
                let content = message.childSnapshot(forPath: "content").value as! String
                let senderId = message.childSnapshot(forPath: "senderId").value as! String
                let message = Message.init(message: content, senderId: senderId)
                messagesArray.append(message)
            }
            handler(messagesArray)
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func getUsername(forUID uid: String,handler: @escaping (_ username: String)->() ) {
        REF_USERS.observeSingleEvent(of: .value, with: { (userSnapShot) in
            guard let userSnapShot = userSnapShot.children.allObjects as? [DataSnapshot] else {return}
            for user in userSnapShot {
                if user.key == uid {
                    handler(user.childSnapshot(forPath: "email").value as! String)
                }
            }
            
        }) { (error) in
            print(error.localizedDescription)
        }
    }
}
