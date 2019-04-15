import Foundation
import Firebase


class AuthService {
    static let instance = AuthService()
    
    func regUser(withEmail email: String, andPass password: String, createUserCompletion: @escaping (_ status: Bool, _ error: Error?)->()){
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            guard let user = authResult?.user else {
                createUserCompletion(false, error)
                return
            }
            let userData = ["provider": user.providerID, "email": user.email]
            DataService.instance.createDBUser(uid: user.uid, userData: userData)
            createUserCompletion(true, nil)
        }
    }
    
    func loginUser(withEmail email: String, andPass password: String, loginUserCompletion: @escaping (_ status: Bool, _ error: Error?)->()){
        Auth.auth().signIn(withEmail: email, password: password) { (loginResult, error) in
           if error != nil {
                loginUserCompletion(false, nil)
                return
            }
            loginUserCompletion(true, nil)
        }
        
    }
    
}
