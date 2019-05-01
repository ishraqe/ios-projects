import UIKit
import SDWebImage

class AppSearchCell: UICollectionViewCell {
    
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "APP NAME"
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos & Video"
        return label
    }()
    
    let ratingsLabel: UILabel = {
        let label = UILabel()
        label.text = "9.26M"
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.layer.cornerRadius = 16
        return button
    }()
    
     lazy var screenshotImage1 = self.createScreenshotImageView()
     lazy var screenshotImage2 = self.createScreenshotImageView()
     lazy var screenshotImage3 = self.createScreenshotImageView()
    
    
    func createScreenshotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    
    
    
    func setupViews() {
        let labelStackView = VerticalStackView(arrangedSubViews: [
            nameLabel, categoryLabel, ratingsLabel
            ], spacing: 5)

        
        let infoTopStackView = UIStackView(arrangedSubviews: [appIconImageView, labelStackView, getButton])
        addSubview(infoTopStackView)
        infoTopStackView.spacing = 12
        infoTopStackView.alignment = .center
        
        let screenshotStackView =  UIStackView(arrangedSubviews: [screenshotImage1, screenshotImage2, screenshotImage3])
        screenshotStackView.spacing = 12
        screenshotStackView.distribution = .fillEqually
      
        
       let overAllStackView = VerticalStackView(arrangedSubViews: [infoTopStackView,screenshotStackView], spacing:  16)
        
        addSubview(overAllStackView)
        overAllStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
    }
    
    func configureCell(result: Result){
        self.nameLabel.text = result.trackName
        self.categoryLabel.text = result.primaryGenreName
        print(result.averageuserRatings)
        self.ratingsLabel.text = "Ratings: \(result.averageuserRatings ?? 0)"
        
        let iconUrl = URL(string: result.artworkUrl100)
        
        self.appIconImageView.sd_setImage(with: iconUrl)
        
        self.screenshotImage1.sd_setImage(with: URL(string: result.screenshotUrls[0]))
        
        if result.screenshotUrls.count > 1 {
            self.screenshotImage2.sd_setImage(with: URL(string: result.screenshotUrls[1]))
        }
        if result.screenshotUrls.count > 2 {
             self.screenshotImage3.sd_setImage(with: URL(string: result.screenshotUrls[2]))
        }
        
       
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
