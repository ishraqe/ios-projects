
import UIKit

class AppCollectionViewController: BaseCollectionVC, UICollectionViewDelegateFlowLayout {
    let cellId = "id"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.backgroundColor = .yellow
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // register cells
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
    
    
}
