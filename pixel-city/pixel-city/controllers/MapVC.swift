
import UIKit
import Alamofire
import AlamofireImage
import MapKit

class MapVC: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func centeeMapBtnWasPressed(_ sender: Any) {
    }
}

extension MapVC: MKMapViewDelegate {
    
}

