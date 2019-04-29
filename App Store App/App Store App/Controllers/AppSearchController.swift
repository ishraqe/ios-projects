import UIKit



class AppSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let searchCellId = "searchCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        DataService.instance.fetchItunesData { (isComplete) in
            print("complete", isComplete)
        }
    }
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    fileprivate func setupCollectionView() {
        collectionView.backgroundColor =  .white
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(AppSearchCell.self, forCellWithReuseIdentifier: searchCellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: searchCellId, for: indexPath) as! AppSearchCell
        
        cell.nameLabel.text = "my aoo"
       
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
}



