import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()


//URL constants

let BASE_URL = "https://smack-chat-ish.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"

//seques

let TO_Login = "toLogin"
let To_Create_Account = "to_Create_account"
let Unwind = "unwindToSeque"


// User defaults

let TOKEN_KEY = "key"
let LOGGED_IN_KEY = "loggedin"
let USER_EMAIL = "userEmail"
