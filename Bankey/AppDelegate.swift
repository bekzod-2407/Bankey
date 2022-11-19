//
//  AppDelegate.swift
//  Bankey
//
//  Created by Bekzod Qahhorov on 07/10/22.
//

import UIKit

let appColor: UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let loginViewController = LoginViewController()
    let onboardingViewController = OnboardingContainerViewController()
    let dummyViewController = DummyViewController()
    let  mainViewController = MainViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        mainViewController.setStatusBar()
        loginViewController.delegate = self
        onboardingViewController.delegate = self
            
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backgroundColor = appColor
        window?.rootViewController = mainViewController

        return true
    }
}

extension AppDelegate: LoginViewControllerDelegate, OnboardingContainerViewControllerDelegate, LogOutDelegate{
    
    func didLogin() {
        if LocalState.hasOnbordered {
            setRootViewController(vc: mainViewController)
        } else {
            setRootViewController(vc: onboardingViewController)
        }
    }
    
    func didFinishOnboarding() {
        setRootViewController(vc: mainViewController)
    }
    func didLogOut() {
        setRootViewController(vc: loginViewController)
    }
}
extension AppDelegate {
    
    func setRootViewController(vc: UIViewController, animated: Bool = true) {
        guard let window = self.window ,animated else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.8,options: .transitionCrossDissolve, animations: nil)
    }
    
}


