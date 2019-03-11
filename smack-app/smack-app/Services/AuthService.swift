import Foundation
import Alamofire

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
        
        let body: [String: Any] = [
            "email": lowercaseEmail,
            "pssword" : password
        ]
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default , headers: header).responseString { (response) in
            if response.result.error == nil {
                completion(true)
                
                
            }else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func loginUser (email: String, pass:  String, completion: @escaping CompletionHandler){
        let lowercaseEmail = email.lowercased()
        
        let header = [
            "Content-Type" : "application/json; charset=utf-8"
        ]
        
        let body: [String: Any] = [
            "email": lowercaseEmail,
            "pssword" : pass
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            
            if response.result.error == nil {
                if let json = response.result.value as? Dictionary<String, Any>{
                    if let email = json["user"] as? String {
                        self.userEmail = email
                    }
                    if let token = json["token"] as? String {
                        self.authToken = token
                    }
                }
               
                self.isLoggedIn = true
                completion(true)
                
            }else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
        
        
        
    }
}