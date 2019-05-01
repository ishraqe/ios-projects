import Foundation
import Alamofire
import SwiftyJSON

class DataService {
    static let instance = DataService()
    
    var searchResults = [Result]()
    
    
   
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
