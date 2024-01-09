//
//  Preview.swift
//  
//
//  Created by Dana Buehre on 1/9/24.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
struct TextView: UIViewRepresentable {
 
    @Binding var text: String
    let highlighter = Highlighter(withTheme: "xcode-default-light")
 
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
 
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.autocapitalizationType = .sentences
        textView.isSelectable = false
        textView.isEditable = false
        textView.isUserInteractionEnabled = true
 
        return textView
    }
 
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.attributedText = highlighter.highlight(text, as: "swift", doFastRender: true)
    }
}

@available(iOS 13.0, *)
struct TextViewUI: View {
    @State var text = source
    
    var body: some View {
        TextView(text: $text)
            .padding(.horizontal)
    }
}

@available(iOS 13.0, *)
struct TextViewUI_Previews: PreviewProvider {
    static var previews: some View {
        TextViewUI()
    }
}

let source = """
// this is a comment
struct AttributedOutputFormat: OutputFormat {
    private let theme: Theme
    
    init(theme: Theme) {
        self.theme = theme
    }
    
    func makeBuilder() -> Builder {
        Builder(theme: self.theme)
    }

    // Return a descriptive string for this person
    func description(offset: Int = 0) -> String {
        return \"\\(name) is \\(age + offset) years old\"
    }
}

private func strippedThemeToTheme(_ themeStringDict: HRThemeStringDict) -> HRThemeDict {

    var returnTheme = HRThemeDict()
    for (className, props) in themeStringDict {
        var keyProps = [AttributedStringKey: AnyObject]()
        for (key, prop) in props {
            switch key {
            case "color":
                keyProps[attributeForCSSKey(key)] = colourFromHexString(prop)
            case "font-style":
                keyProps[attributeForCSSKey(key)] = fontForCSSStyle(prop)
            case "font-weight":
                keyProps[attributeForCSSKey(key)] = fontForCSSStyle(prop)
            case "background-color":
                keyProps[attributeForCSSKey(key)] = colourFromHexString(prop)
            default:
                break
            }
        }

        if keyProps.count > 0 {
            let key: String = className.replacingOccurrences(of: ".", with: "")
            returnTheme[key] = keyProps
        }
    }

    return returnTheme
}
"""

@available(iOS 13.0, *)
extension Highlighter {
    
    struct XcodeDynamicColors: DynamicColorLookup {
        let dynamicColors = [
            "#fff;": UIColor(light: #colorLiteral(red: 1, green: 0.9999999404, blue: 0.9999999404, alpha: 1), dark: #colorLiteral(red: 0.1607843137, green: 0.1647058824, blue: 0.1882352941, alpha: 1)),
            "#000": UIColor(light: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.85), dark: #colorLiteral(red: 1, green: 0.9999999404, blue: 0.9999999404, alpha: 0.85)),
            "#4a5560": UIColor(light: #colorLiteral(red: 0.3609555662, green: 0.4085314572, blue: 0.452249229, alpha: 1), dark: #colorLiteral(red: 0.6380797029, green: 0.6931627989, blue: 0.7475304008, alpha: 1)),
            "#707f8c": UIColor(light: #colorLiteral(red: 0.4392194748, green: 0.4980290532, blue: 0.5490160584, alpha: 1), dark: #colorLiteral(red: 0.4980430007, green: 0.5490083694, blue: 0.5960745215, alpha: 1)),
            "#aa0d91": UIColor(light: #colorLiteral(red: 0.6784297228, green: 0.2392024994, blue: 0.6431324482, alpha: 1), dark: #colorLiteral(red: 0.9999973178, green: 0.478415072, blue: 0.6980343461, alpha: 1)),
            "#02638c": UIColor(light: #colorLiteral(red: 0.009010463953, green: 0.3865026236, blue: 0.5487951636, alpha: 1), dark: #colorLiteral(red: 0.4196258187, green: 0.8744947314, blue: 0.9999926686, alpha: 1)),
            "#d12f1b": UIColor(light: #colorLiteral(red: 0.8210173249, green: 0.1831091344, blue: 0.1060960516, alpha: 1), dark: #colorLiteral(red: 0.9999973178, green: 0.505867064, blue: 0.4392129183, alpha: 1)),
            "#0e0eff": UIColor(light: #colorLiteral(red: 0.0760518536, green: 0.21454072, blue: 1, alpha: 1), dark: #colorLiteral(red: 0.4000090361, green: 0.5999878645, blue: 0.9999918342, alpha: 1)),
            "#1c00cf": UIColor(light: #colorLiteral(red: 0.1524859071, green: 0.1627748609, blue: 0.846955359, alpha: 1), dark: #colorLiteral(red: 0.8509826064, green: 0.7882201076, blue: 0.4862719178, alpha: 1)),
            "#643820": UIColor(light: #colorLiteral(red: 0.47058779, green: 0.2862665057, blue: 0.1647058427, alpha: 1), dark: #colorLiteral(red: 0.9999982715, green: 0.6313573122, blue: 0.3098036945, alpha: 1)),
            "#3900a0": UIColor(light: #colorLiteral(red: 0.2938971221, green: 0.1305076182, blue: 0.6901863217, alpha: 1), dark: #colorLiteral(red: 0.853918612, green: 0.730949223, blue: 1, alpha: 1)),
            "#815f03": UIColor(light: #colorLiteral(red: 0.5803918242, green: 0.4431273937, blue: 7.012306469e-06, alpha: 1), dark: #colorLiteral(red: 0.7985497117, green: 0.5924366713, blue: 0.4063536525, alpha: 1)),
            "#67b7a4": UIColor(light: #colorLiteral(red: 0.2431467474, green: 0.5019516349, blue: 0.5294076204, alpha: 1), dark: #colorLiteral(red: 0.4690470099, green: 0.7612735033, blue: 0.702886641, alpha: 1)),
            "#eee;": UIColor(light: #colorLiteral(red: 0.933, green: 0.933, blue: 0.933, alpha: 1), dark: #colorLiteral(red: 0.067, green: 0.067, blue: 0.067, alpha: 1)),
            "#baeeba": #colorLiteral(red: 0.729, green: 0.933, blue: 0.729, alpha: 1),
            "#ffc8bd": #colorLiteral(red: 1, green: 0.784, blue: 0.741, alpha: 1),
        ]
        
        func getColor(cssColor: String) -> HRColor? {
            return dynamicColors[cssColor]
        }
    }

    convenience init(withTheme: String) {
        self.init()!
        self.setTheme(withTheme, dynamicColor: XcodeDynamicColors())
        self.theme.codeFont = .preferredFont(style: .body).with(.traitMonoSpace)
        self.theme.boldCodeFont = .preferredFont(style: .body).with(.traitMonoSpace, .traitBold)
        self.theme.italicCodeFont = .preferredFont(style: .body).with(.traitMonoSpace, .traitItalic)
    }
}

@available(iOS 13.0, *)
extension UIFont {
    func with(_ traits: UIFontDescriptor.SymbolicTraits...) -> UIFont {
        let traitSet = UIFontDescriptor.SymbolicTraits(traits).union(fontDescriptor.symbolicTraits)
        guard let descriptor = fontDescriptor.withSymbolicTraits(traitSet) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: 0)
    }
    
    static func preferredFont(style: UIFont.TextStyle) -> UIFont {
        preferredFont(forTextStyle: style)
    }
}

@available(iOS 13.0, *)
extension UIColor {
    convenience init(
        light lightModeColor: @escaping @autoclosure () -> UIColor,
        dark darkModeColor: @escaping @autoclosure () -> UIColor
     ) {
        self.init { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .light:
                return lightModeColor()
            case .dark:
                return darkModeColor()
            case .unspecified:
                return lightModeColor()
            @unknown default:
                return lightModeColor()
            }
        }
    }
}
