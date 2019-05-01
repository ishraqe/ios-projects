
import UIKit

class BaseCollectionVC: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
