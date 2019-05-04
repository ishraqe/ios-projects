import UIKit

class HorizontalController: BaseCollectionVC, UICollectionViewDelegateFlowLayout {
    let cellId = "id"
    var appsGroup: AppsGroup?
    
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
        return appsGroup?.feed.results.count ?? 0
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppRowCell
        let app = appsGroup?.feed.results[indexPath.row]
        cell.companyLbl.text = app?.artistName
        cell.nameLbl.text = app?.name
        cell.imageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
        
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
