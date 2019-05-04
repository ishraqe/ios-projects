import UIKit

class AppsPageController: BaseCollectionVC, UICollectionViewDelegateFlowLayout {
    let cellId = "id"
    let headerId = "id"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        fetchAppSectionData()
    }

    var appsGroups = [AppsGroup]()
    var socialApps = [SocialApp]()
    
    
    fileprivate func fetchAppSectionData(){
        var group1: AppsGroup?
        var group2: AppsGroup?
        var group3: AppsGroup?
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        DataService.instance.getAppHeaderData { (app, err) in
            dispatchGroup.leave()
            self.socialApps = app as! [SocialApp]
        }
        
        dispatchGroup.enter()
        DataService.instance.getAppsGamesData { (appsGroup, err) in
            dispatchGroup.leave()
              print("group 1")
            group1 = appsGroup
        }
        
        dispatchGroup.enter()
        DataService.instance.topFreeApp { (appsGroup, error) in
            dispatchGroup.leave()
              print("group 2")
           group2 = appsGroup
        }
        
        dispatchGroup.enter()
        DataService.instance.topGrossingApp { (appsGroup, error) in
            dispatchGroup.leave()
            print("group 3")
            group3 = appsGroup
        }
        
        dispatchGroup.notify(queue: .main){
            print("All dispatch complete")
            
            if let group = group1 {
                self.appsGroups.append(group)
            }
            if let group = group2 {
                self.appsGroups.append(group)
            }
            if let group = group3 {
                self.appsGroups.append(group)
            }
            self.collectionView.reloadData()
        }
    }
    
    func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // register cells
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.showsVerticalScrollIndicator = false
        // 1 Header
        collectionView.register(AppsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    // 2 Header
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppsHeader
        
        header.appheaderHorizontalController.socialApp = self.socialApps
        header.appheaderHorizontalController.collectionView.reloadData()
        
        return header
    }
    // 3 sze of the header
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appsGroups.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupCell
        let apps = appsGroups[indexPath.row]
        cell.titleLabel.text = apps.feed.title
        cell.horizontalVC.appsGroup = apps
        cell.horizontalVC.collectionView.reloadData()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    
    
}
