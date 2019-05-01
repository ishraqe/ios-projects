import UIKit



class AppSearchController: BaseCollectionVC, UICollectionViewDelegateFlowLayout {

    let searchCellId = "searchCellId"
    
    let searchController = UISearchController(searchResultsController: nil)
    var timer: Timer?
    
    let searchTermLabel : UILabel = {
        let label =  UILabel()
        label.text = "Search above to get results..."
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupSearchController()

    }
    func setupSearchController(){
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    fileprivate func setupCollectionView() {
        collectionView.backgroundColor =  .white
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.addSubview(searchTermLabel)
        searchTermLabel.fillSuperview(padding: .init(top: 100, left: 50, bottom: 0, right: 50))
        collectionView.register(AppSearchCell.self, forCellWithReuseIdentifier: searchCellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        searchTermLabel.isHidden = DataService.instance.searchResults.count != 0
        
        return DataService.instance.searchResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: searchCellId, for: indexPath) as! AppSearchCell
        
            let result = DataService.instance.searchResults[indexPath.row]
            cell.configureCell(result: result)
        
            return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
}


extension AppSearchController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            DataService.instance.fetchItunesData(searchTerm: searchText) { (isComplete) in
                if isComplete {
                    self.collectionView.reloadData()
                }
            }
        })
    }
}


