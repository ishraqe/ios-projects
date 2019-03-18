import Foundation
import Alamofire
import SwiftyJSON

class AuthService {
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn: Bool {
        get{
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken: String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail: String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    
    func registeruser (email: String, password: String, completion: @escaping CompletionHandler) {
        let lowercaseEmail = email.lowercased()
        
        let header = [
            "Content-Type" : "application/json; charset=utf-8"
        ]
        
        let parameters: [String: Any] = [
            "email": lowercaseEmail,
            "password" : password
        ]
        print(email, password,"in auth service")
        Alamofire.request(URL_REGISTER, method: .post, parameters: parameters, encoding: JSONEncoding.default , headers: header).responseString { (response) in
            if response.result.error == nil {
                completion(true)
                
                print(response)
            }else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func loginUser (email: String, password:  String, completion: @escaping CompletionHandler){
        let lowercaseEmail = email.lowercased()
        
        let header = [
            "Content-Type" : "application/json; charset=utf-8"
        ]
        
        let body: [String: Any] = [
            "email": lowercaseEmail,
            "password" : password
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            
            if response.result.error == nil {
//                if let json = response.result.value as? Dictionary<String, Any>{
//                    if let email = json["user"] as? String {
//                        self.userEmail = email
//                    }
//                    if let token = json["token"] as? String {
//                        self.authToken = token
//                    }
//                }
//
                guard let data = response.data else {return}
                let json = JSON(data:data)
                self.userEmail = json["user"].stringValue
                self.authToken = json["token"].stringValue
                
                self.isLoggedIn = true
                completion(true)
                
            }else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }

    func createUser( name: String, email: String, avatarColor: String, avatarName: String, completion:  @escaping CompletionHandler) {
        let lowercaseEmail = email.lowercased()
        
        let header = [
            "Authorization": "Bearer \(AuthService.instance.authToken)",
            "Content-Type" : "application/json; charset=utf-8"
        ]
        let parameters: [String: Any] = [
            "name" : name,
            "email": lowercaseEmail,
            "avatarColor" : avatarColor,
            "avatarName" : avatarName
        ]
        
        Alamofire.request(URL_USER_ADD, method: .post, parameters: parameters, encoding: JSONEncoding.default , headers: header).responseJSON { (response) in
            if response.result.error == nil {
               
                
                guard let data = response.data else {return}
                let json = JSON(data:data)
                let id = json["_id"].stringValue
                let email = json["email"].stringValue
                let name = json["name"].stringValue
                let avatarColor = json["avatarColor"].stringValue
                let avatarName = json["avatarName"].stringValue
                
                UserDataService.instance.setUserData(id: id, name: name, email: email, avatarColor: avatarColor, avatarName: avatarName)
                
                 completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
                
            }
        }
        
    }
}
