import UIKit

class StreachyCell: UICollectionViewCell {
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupview()
    }
    
    let bgImage: UIImageView = {
        let image =  UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 5
        
        return image
    }()
    
    let MainLabel : UILabel = {
       let label = UILabel()
        label.text = "hello"
        label.textColor = .white
        
        return label
    }()
    
    let DescLabel : UILabel = {
        let label = UILabel()
        label.text = "This is the description of the view"
        label.textColor = .white
        
        return label
    }()
    
    func setupview(){
        addSubview(bgImage)
        addSubview(MainLabel)
        addSubview(DescLabel)
        
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        bgImage.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        bgImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        bgImage.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        bgImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        
        
        MainLabel.translatesAutoresizingMaskIntoConstraints = false
        MainLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        MainLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
    
        DescLabel.translatesAutoresizingMaskIntoConstraints = false
        DescLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        DescLabel.topAnchor.constraint(equalTo: MainLabel.bottomAnchor, constant: 8).isActive = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
