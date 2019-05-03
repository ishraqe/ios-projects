import UIKit

extension UIImageView {
    convenience init(cornerRadius: CGFloat) {
        self.init(image: nil)
        self.layer.cornerRadius =  cornerRadius
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}

extension UIButton {
    convenience init(title: String){
        self.init(type: .system)
        self.setTitle(title, for: .normal)
    }
}

class AppRowCell: UICollectionViewCell {

    let imageView =  UIImageView(cornerRadius: 8)
    
    let nameLbl = UILabel(title: "App Name", fontSize: .systemFont(ofSize: 16))
    let companyLbl = UILabel(title: "Company Name", fontSize: .systemFont(ofSize: 13))
    let getButton = UIButton(title: "GET")
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
        imageView.backgroundColor = .green
        
        
        
        
        
        
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.constrainHeight(constant: 32)
        getButton.constrainWidth(constant: 80)
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        getButton.layer.cornerRadius = 32/2
        
        let stackView =  UIStackView(arrangedSubviews: [imageView, VerticalStackView(arrangedSubViews: [nameLbl, companyLbl], spacing: 4), getButton])
        stackView.spacing = 16
        stackView.alignment = .center
        addSubview(stackView)
        
        stackView.fillSuperview()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
