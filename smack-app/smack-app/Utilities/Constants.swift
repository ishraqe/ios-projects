import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()


//URL constants

let BASE_URL = "https://smack-chat-ish.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"


//seques
let TO_Login = "toLogin"
let To_Create_Account = "to_Create_account"
let Unwind = "unwindToSeque"
let TO_AVATAR_PICKER = "toAvatarPicker"


// User defaults

let TOKEN_KEY = "key"
let LOGGED_IN_KEY = "loggedin"
let USER_EMAIL = "userEmail"
