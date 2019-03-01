
import UIKit

class ParallaxCell: UITableViewCell {
    
  
    @IBOutlet weak var parImage: UIImageView!
    
    @IBOutlet weak var imgLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       setUpParalax()
    }
    func configureCell(withImage image: UIImage, withDesc desc:String){
        parImage.image = image
        imgLabel.text = desc
    }
    
    func setUpParalax() {
        let min = CGFloat(-30)
        let max = CGFloat(30)
        
        let xMotion = UIInterpolatingMotionEffect.init(keyPath: "layer.transform.translation.x", type: .tiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = min
        xMotion.maximumRelativeValue = max
        
        
        let yMotion = UIInterpolatingMotionEffect.init(keyPath: "layer.transform.translation.y", type: .tiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = min
        yMotion.maximumRelativeValue = max
        
        let motionEffectGroup = UIMotionEffectGroup()
        motionEffectGroup.motionEffects = [xMotion,yMotion]
        
        parImage.addMotionEffect(motionEffectGroup)
        
    }
    
}
