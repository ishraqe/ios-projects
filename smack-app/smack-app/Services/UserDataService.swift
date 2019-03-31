import Foundation


class UserDataService {
  static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var name = ""
    public private(set) var email = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    
    func setUserData(id: String, name: String, email: String, avatarColor: String, avatarName: String){
        self.id = id
        self.name = name
        self.email = email
        self.avatarColor = avatarColor
        self.avatarName = avatarName
    }
    
    func setAvatarName(avatarName: String){
        self.avatarName = avatarName
    }
    
    func returnUiColor(components: String) -> UIColor {
        let scanner = Scanner.init(string: components)
        let skip = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skip
        
        var r, g,b,a : NSString?
        let defaultColor = UIColor.lightGray
        
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
        guard let rUnwrapped = r else { return defaultColor }
        guard let gUnwrapped = g else { return defaultColor }
        guard let bUnwrapped = b else { return defaultColor }
        guard let aUnwrapped = a else { return defaultColor }
        
        let rFloat = CGFloat(rUnwrapped.doubleValue)
        let gFloat = CGFloat(gUnwrapped.doubleValue)
        let bFloat = CGFloat(bUnwrapped.doubleValue)
        let aFloat = CGFloat(aUnwrapped.doubleValue)
        
        let newColor = UIColor.init(red: rFloat, green: gFloat, blue: bFloat, alpha: aFloat)
        
        return newColor
    }
    
    func logoutUser() {
        id = ""
        name = ""
        email = ""
        avatarColor = ""
        avatarName = ""
        AuthService.instance.authToken = ""
        AuthService.instance.isLoggedIn = false
        AuthService.instance.userEmail = ""
        MessageService.instance.clearChannels()
        MessageService.instance.clearMessages()
    }
    
}
