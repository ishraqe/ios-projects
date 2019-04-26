
import UIKit


class StreatchyHeaderController: UIViewController {

    
    fileprivate let cellId = "cellId"
    fileprivate let headerId = "headerId"
    fileprivate let padding: CGFloat = 16
    var headerView: HeaderView?
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        setupCollectionView()
       
        
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    private func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.dataSource = self
        collectionView.delegate = self
       
        
        collectionView.collectionViewLayout = StreachyHeader()
        
        // header and cell
        collectionView.register(StreachyCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        //        let collectionViewLayout:  UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        //
        //        if let layout = collectionViewLayout {
        //            layout.sectionInset =  .init(top: padding, left: padding, bottom: padding, right: padding)
        //            layout.minimumLineSpacing = 10
        //        }
    }
}



extension StreatchyHeaderController: UICollectionViewDataSource, UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentofsetY =  scrollView.contentOffset.y
        if contentofsetY > 0 {
             headerView?.animator.fractionComplete = 0
            return
        }
        headerView?.animator.fractionComplete = abs(contentofsetY) / 100
        
        
    }
    

    
    // Header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as? HeaderView
        return headerView!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 340 )
    }
    
    
    // Cell
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! StreachyCell
        
        cell.backgroundColor = .black
        cell.layer.cornerRadius = 5
        
        cell.bgImage.image =  UIImage(named: "night")
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.frame.width - 2 * padding, height: 150)
    }
    
    
    // insets or padding
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsets(top: padding,left: padding ,bottom: padding,right: padding)

    }
    
   
}

