//
//  AppDelegate.swift
//  BabyObjectsTalk
//
//  Created by Glenn Posadas on 12/27/20.
//

import UIKit

let mainSB = UIStoryboard(name: "Main", bundle: nil)

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        checkDefaults()
        registerDefaultsFromSettingsBundle()
        return true
    }
    
    private func checkDefaults() {
        if AppDefaults.getObjectWithKey(.useUSEnglish, type: Bool.self) == nil {
            AppDefaults.store(true, key: .useUSEnglish)
        }
    }
    
    private func registerDefaultsFromSettingsBundle() {
        let userDefaults = UserDefaults.standard
        
        if let settingsURL = Bundle.main.url(forResource: "Root", withExtension: "plist", subdirectory: "Settings.bundle"),
           let settings = NSDictionary(contentsOf: settingsURL),
           let preferences = settings["PreferenceSpecifiers"] as? [NSDictionary] {
            
            var defaultsToRegister = [String: Any]()
            
            for prefSpecification in preferences {
                if let key = prefSpecification["Key"] as? String,
                   let value = prefSpecification["DefaultValue"] {
                    
                    defaultsToRegister[key] = value as AnyObject
                    debugPrint("registerDefaultsFromSettingsBundle: (\(key), \(value)) \(type(of: value))")
                }
            }
            
            userDefaults.register(defaults: defaultsToRegister)
            
        } else {
            debugPrint("registerDefaultsFromSettingsBundle: Could not find Settings.bundle")
        }
    }
}
