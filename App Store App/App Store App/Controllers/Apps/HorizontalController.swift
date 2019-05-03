import UIKit

class HorizontalController: BaseCollectionVC, UICollectionViewDelegateFlowLayout {
    let cellId = "id"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    func setupCollectionView(){
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
    
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(AppRowCell.self, forCellWithReuseIdentifier: cellId)
        
        //horizontal cell
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
       
        return cell
    }
    let topBottomPadding: CGFloat = 12
    let lineSpacing: CGFloat = 10
    
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - 2 * topBottomPadding - 2 * lineSpacing) / 3
        return .init(width: view.frame.width - 48, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
}
