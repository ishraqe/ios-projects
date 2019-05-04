import Foundation
import Alamofire
import SwiftyJSON

class DataService {
    static let instance = DataService()
    
    var searchResults = [Result]()
    var appGroupsResult: AppsGroup?
    
    
    // Apps Page Data
    
    func getAppHeaderData(handler: @escaping ([SocialApp?], Error?)->()){
        let url = "http://api.letsbuildthatapp.com/appstore/social"
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else {return}
                print(data)
                do {
                    let socialData = try JSONDecoder().decode([SocialApp].self, from: data)
                    handler(socialData, nil)
                }catch let jsonErr {
                    handler([], jsonErr)
                }
            }else {
                handler([], response.error)
            }
        }
    }
    func getAppsGamesData(handler: @escaping (AppsGroup?, Error?)->()) {
        let url = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/50/explicit.json"
        fetchGroupData(url: url, handler: handler)
    }
    
    func topGrossingApp(handler: @escaping (AppsGroup?, Error?)->()) {
        let url = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/50/explicit.json"
        fetchGroupData(url: url, handler: handler)
    }
    func topFreeApp(handler: @escaping (AppsGroup?, Error?)->()) {
        let url = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/50/explicit.json"
        fetchGroupData(url: url, handler: handler)
    }
    
    func fetchGroupData(url: String, handler: @escaping (AppsGroup?, Error?)->()){
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else {return}
                do {
                    let appsSeactionResult = try JSONDecoder().decode(AppsGroup.self, from: data)
                    handler(appsSeactionResult, nil)
                }catch let jsonErr {
                    handler(nil, jsonErr)
                }
            }else {
                handler(nil, response.error)
            }
        }
    }

   
    
    // Search Data
    func fetchItunesData(searchTerm: String, handler: @escaping (_ status: Bool)-> ()) {
       
        Alamofire.request("https://itunes.apple.com/search?term=\(searchTerm)&entity=software", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if response.result.error == nil {
               self.searchResults = []
                guard let data = response.data else {return}
                do {
                      let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                    
                    
                    searchResult.results.forEach({ (result) in
                        
                        var allScreenShots = [String]()
                        
                        result.screenshotUrls.forEach({ (url) in
                            allScreenShots.append(url)
                        })
                    
                        let result =  Result.init(trackName: result.trackName, primaryGenreName: result.primaryGenreName, averageuserRatings: result.averageuserRatings, screenshotUrls: allScreenShots, artworkUrl100: result.artworkUrl100)
                        
                        self.searchResults.append(result)
                    })
                }catch let jsonErr {
                    print("Failed to decode json:", jsonErr)
                }
                handler(true)

            }else {
                handler(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
}
