import UIKit

extension UIColor {
    class func rgb(r: Int, g: Int, b: Int, alpha: CGFloat) -> UIColor{
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
static let yellow = UIColor.rgb(r: 254, g: 249, b: 200, alpha: 1)
static let joy = UIColor.rgb(r: 242, g: 150, b: 200, alpha: 1)
static let anger = UIColor.rgb(r: 195, g: 185, b: 255, alpha: 1)
static let sad = UIColor.rgb(r: 183, g: 224, b: 255, alpha: 1)
static let happy = UIColor.rgb(r: 255, g: 200, b: 100, alpha: 1)
}
    
extension UIView {
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return layer.borderColor.map { UIColor(cgColor: $0) }
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
