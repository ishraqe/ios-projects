import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()


//URL constants

let BASE_URL = "https://smack-chat-ish.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"
let URL_FIND_USER_BY_EMAIL = "\(BASE_URL)/user/byEmail/"
let URL_GET_ALL_CHANNELS = "\(BASE_URL)/channel/"
let URL_GET_MESSAGES_BY_CHANNEL = "\(BASE_URL)message/byChannel/"
// color
let smack_purple_color = #colorLiteral(red: 0.1960784314, green: 0.4784313725, blue: 1, alpha: 0.5)

//Notifications

let NOTIF_USER_DATA_CHANGED = Notification.Name("notifUserDataChanged")
let NOTIF_CHANNELS_DATA_CHANGED = Notification.Name("notifChannelDataChanged")
let NOTIF_CHANNELS_DATA_SELECTED = Notification.Name("notifChannelDataSelected")
//seques
let TO_Login = "toLogin"
let To_Create_Account = "to_Create_account"
let Unwind = "unwindToSeque"
let TO_AVATAR_PICKER = "toAvatarPicker"


// User defaults

let TOKEN_KEY = "key"
let LOGGED_IN_KEY = "loggedin"
let USER_EMAIL = "userEmail"


// Headers


let BEARER_HEADER = [
    "Authorization": "Bearer \(AuthService.instance.authToken)",
    "Content-Type" : "application/json; charset=utf-8"
]
