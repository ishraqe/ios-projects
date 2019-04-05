import UIKit

class PopVC: UIViewController,UIGestureRecognizerDelegate  {

    @IBOutlet weak var imageView: UIImageView!
    var passedImage: UIImage!
    
    func initData(forImage image: UIImage) {
        self.passedImage = image
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = passedImage
        addDoubleTap()
        
    }
    
    func addDoubleTap() {
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(closeVC))
        doubleTap.numberOfTapsRequired = 2
        doubleTap.delegate = self
        view.addGestureRecognizer(doubleTap)
    }
    @objc func closeVC(){
        print("double tap")
        dismiss(animated: true, completion: nil)
    }
    
}
