import UIKit

class DetailsCell: UICollectionViewCell {
 
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    
    let mainLabel : UILabel = {
        let label = UILabel()
        label.text = "The magical experience"
        label.font =  UIFont(name: "Avenir Next", size: 20)
        label.textColor = #colorLiteral(red: 0.1607843137, green: 0.168627451, blue: 0.2039215686, alpha: 1)
        return label
    }()
    
    let desclabel : UILabel = {
        let label = UILabel()
       
        label.text = "A tour description is the marketing content that explains what your tour is and it's unique selling points. The purpose of a tour description is to supply potential customers with details about the features of the tour, so they're compelled to purchase their ticket."
        label.font =  UIFont(name: "Avenir Next", size: 16)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    func setUpView() {
        self.addSubview(mainLabel)
        self.addSubview(desclabel)
        
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        mainLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        
        desclabel.translatesAutoresizingMaskIntoConstraints = false
        desclabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        desclabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 5).isActive = true
        desclabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 16).isActive = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
