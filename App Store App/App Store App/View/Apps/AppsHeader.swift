import UIKit


class AppsHeader: UICollectionReusableView  {
    
    let appheaderHorizontalController = AppHeaderHorizontalCollectionView(collectionViewLayout: UICollectionViewFlowLayout())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        addSubview(appheaderHorizontalController.view)
        appheaderHorizontalController.view.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
