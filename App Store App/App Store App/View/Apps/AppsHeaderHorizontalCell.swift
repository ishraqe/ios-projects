import UIKit


class AppsHeaderHorizontalCell: UICollectionViewCell {
   
    let companyLbl = UILabel(title: "Facebook", fontSize: .boldSystemFont(ofSize: 8))
    
    let titleLbl =  UILabel(title: "Keeping up with a friend is faster than ever", fontSize: .systemFont(ofSize: 80))

    
    
    let imageView =  UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        companyLbl.textColor = .blue
        titleLbl.numberOfLines = 2
        
        imageView.backgroundColor =  .yellow
        
        
        let stackView = VerticalStackView(arrangedSubViews: [companyLbl, titleLbl, imageView], spacing: 12)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
