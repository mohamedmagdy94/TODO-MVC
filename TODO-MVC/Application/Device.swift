import Foundation
import Localize_Swift

struct Device{
    
    public func getAppLang()->ApplicationLanguages{
        if let lang = UserDefaults.standard.string(forKey: "appLang"){
            if lang == "ar"{
                return ApplicationLanguages.Arabic
            }else{
                return ApplicationLanguages.English
            }
        }else{
            return getDeivceLang()
        }
    }
    
    private func getDeivceLang()->ApplicationLanguages{
        let preferedLang = Localize.currentLanguage()//Get prefered Language .
        let index = preferedLang.index(of: "-") ?? preferedLang.endIndex//Split prefered language if it's assocaited with country code .
        let subString = preferedLang[..<index]//Get prefered language only .
        let deviceLang = String(subString)//Convert prefered language from substring to string .
        if deviceLang == "ar"{
            return ApplicationLanguages.Arabic
        }else{
            return ApplicationLanguages.English
        }
    }
    
    public func setUserLang(lang : String){
        UserDefaults.standard.set(lang, forKey: "appLang")
    }
    
    public func setAppLang(lang : String){
        if lang ==  "ar"{
            UserDefaults.standard.set([lang], forKey: "AppleLanguages")
            UserDefaults.standard.set(lang, forKey: "appLang")
            Localize.setCurrentLanguage(lang)
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        }else{
            UserDefaults.standard.set([lang], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
            UserDefaults.standard.set(lang, forKey: "appLang")
            Localize.setCurrentLanguage(lang)
            UIView.appearance().semanticContentAttribute = .forceLeftToRight

        }
    }
    
    public func setDeviceToken(token: String){
        UserDefaults.standard.set(token, forKey: "deviceToken")
    }
    
    public func getDeviceToken()->String{
        if let token = UserDefaults.standard.string(forKey: "deviceToken"){
            return token
        }else{
            return ""
        }
        
    }
    
}
