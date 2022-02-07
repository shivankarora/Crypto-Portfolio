
import SwiftUI

extension Color {
    
    static let base = Color(#colorLiteral(red: 0.2784017324, green: 0.2862927616, blue: 0.2940781415, alpha: 1))
    static let grayish = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    static let greenish = Color(#colorLiteral(red: 0.3411764706, green: 0.9254901961, blue: 0.2235294118, alpha: 1))
    static let darkShadow = Color(#colorLiteral(red: 0.01960292459, green: 0.02353240177, blue: 0.0235229861, alpha: 1))
    
    init(hex: String) {
        self.init(UIColor(hex: hex))
    }
}

extension UIColor {
    convenience init(hex: String) {
        var inputString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if inputString.hasPrefix("#") {
            inputString.remove(at: inputString.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        
        Scanner(string: inputString).scanHexInt64(&rgbValue)
    
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
