
import UIKit
import Hero
class HeaderView: UICollectionReusableView {
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "detail"))
            iv.contentMode = .scaleAspectFill
            return iv
    }()
    
   
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.fillSuperview()
        imageView.round(with: .bottom , radius: 3)
        imageView.clipsToBounds = true
        imageView.hero.id = "1"
        //blue
        setUpblurView()
        setupGradientLayer()
        setupContent()
        
       
    }
    
    var animator :  UIViewPropertyAnimator!
    var backBtn: UIButton!
    
    private func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0,1]
        
        let gradientContainerSubView =  UIView()
        addSubview(gradientContainerSubView)
        gradientContainerSubView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        gradientContainerSubView.layer.addSublayer(gradientLayer)
     
        
        gradientLayer.frame = self.bounds
        gradientLayer.frame.origin.y -= bounds.height
        
    }
    
    func setupContent(){
       
        
        
        backBtn = UIButton(type: .system)
        backBtn.frame =  CGRect(x: 2, y: 100, width: 200, height: 40)
        backBtn.tintColor = UIColor.white
        backBtn.setImage(UIImage(named:"back"), for: .normal)
        backBtn.imageView?.contentMode = .scaleAspectFit
        backBtn.imageEdgeInsets = UIEdgeInsets(top: 10.0, left: 0.0, bottom: 10.0, right: 0.0)
        backBtn.titleEdgeInsets = UIEdgeInsets(top: 0,left: -30,bottom: 0,right: 0)
        backBtn.setTitle("Back", for: .normal)
        backBtn.titleLabel?.font = UIFont(name: "Avenir Next", size: 16)
        backBtn.imageRect(forContentRect: CGRect(x: 0, y: 0, width: 20, height: 10))
            
        backBtn.backgroundColor = UIColor.clear
            //--> set the background color and check
        backBtn.layer.borderColor = UIColor.clear.cgColor
        
        
        
        let editBtn: UIButton = {
            let btnSort   = UIButton(type: .system)
            btnSort.frame =  CGRect(x: 2, y: 100, width: 200, height: 40)
            btnSort.tintColor = UIColor.white
            btnSort.titleEdgeInsets = UIEdgeInsets(top: 0,left: -30,bottom: 0,right: 0)
            btnSort.setTitle("Edit", for: .normal)
            btnSort.titleLabel?.font = UIFont(name: "Avenir Next", size: 16)
            
      
            
            return btnSort
        }()
        
        
        let weatherImg : UIImageView = {
            let image = UIImageView(image: #imageLiteral(resourceName: "leaf"))
            image.contentMode = .scaleAspectFit
            image.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            return image
        }()
        
        
        let mainTitle = UILabel()
        mainTitle.text = "Take a tour!!"
        mainTitle.font =  UIFont(name: "Avenir Next", size: 30)
        mainTitle.textColor = .white
        
        
        let yearLbl : UILabel = {
            let label = UILabel()
            label.text = "Winter 2019   -   8 days"
            label.font =  UIFont(name: "Avenir Next", size: 16)
            label.textColor = .white
            label.numberOfLines = 0
            return label
        }()
        
//        let dashLbl : UILabel = {
//            let label = UILabel()
//            label.text = "-"
//            label.font = UIFont(name: "Avenir Next", size: 16)
//            label.textColor = .white
//            label.numberOfLines = 0
//            label.backgroundColor = .green
//            return label
//        }()
//
//        let durationLbl : UILabel = {
//            let label = UILabel()
//            label.text = "8 Days"
//            label.font = UIFont(name: "Avenir Next", size: 16)
//            label.textColor = .white
//            label.numberOfLines = 0
//            return label
//        }()
//
//
//        let timeStackView : UIStackView = {
//            let stackView =  UIStackView(arrangedSubviews: [yearLbl,dashLbl,durationLbl])
//            stackView.axis = .horizontal
//            stackView.spacing = 5
//            stackView.alignment = .leading
//            stackView.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//            return stackView
//        }()
//
        let stackView  = UIStackView(arrangedSubviews: [mainTitle, yearLbl])
        let topStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [backBtn!, editBtn])
            stackView.axis = .horizontal
            stackView.distribution = .equalSpacing
            return stackView
        }()
        
        addSubview(topStackView)
        addSubview(stackView)
        addSubview(weatherImg)
      
         topStackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 16, left: 4, bottom: 0, right: 0), size: .zero)
        
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 16, right: 16), size: .zero)
        
        weatherImg.anchor(top: nil, leading: leadingAnchor, bottom: stackView.topAnchor, trailing: nil, padding: .init(top: 0, left: 16, bottom: 30, right: 0), size: .zero)
        
        
        
        
       
    }

    
    private func setUpblurView() {
       
        
        animator =  UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: {
            let blurEffet = UIBlurEffect.init(style: .regular)
            
            let visualEffectView = UIVisualEffectView.init(effect: blurEffet)
            
            self.addSubview(visualEffectView)
            visualEffectView.fillSuperview()
        })
        animator.fractionComplete = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
