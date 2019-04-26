import UIKit
import SnapKit

class DetailVC: UIViewController {
    
    
    fileprivate let cellId = "cellId"
    fileprivate let headerId = "headerId"
    fileprivate let padding: CGFloat = 16
    var headerView: HeaderView?
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    let collectionView: UICollectionView = {
      
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 150, height: 150), collectionViewLayout: StreachyHeader())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor =  .gray
        collection.isScrollEnabled = true
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        setupCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        headerView?.backBtn.addTarget(self, action: #selector(DetailVC.backBtnPressed), for: .touchUpInside)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        headerView?.animator.stopAnimation(true)
    }
    
    @objc func backBtnPressed () {
       self.dismiss(animated: true, completion: nil)
    }
    
    @objc func editBtnPressed(){
        
    }
    func setupCollectionView() {
        
            collectionView.translatesAutoresizingMaskIntoConstraints = false
         collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
         collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
         collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
         collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        
        collectionView.backgroundColor = .white
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.dataSource = self
        collectionView.delegate = self
        
      
//         collectionView.collectionViewLayout = StreachyHeader()
        // header and cell
        collectionView.register(DetailsCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
}


extension DetailVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
        return .init(width: view.frame.width, height: (view.frame.height / 2) + 100  )
    }
    
    
    // Cell
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DetailsCell
        
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 5
        
//        cell.bgImage.image =  UIImage(named: "night")

        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.frame.width, height: 600)
    }
    
    
    // insets or padding
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsets(top: 0,left: 0 ,bottom: 0,right: 0)
        
    }
    
}
