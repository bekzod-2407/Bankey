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
   
        window?.rootViewController = mainViewController
        onboardingViewController.delegate = self
        loginViewController.delegate = self
        dummyViewController.delegate = self
        return true
    }
}

extension AppDelegate: LoginViewControllerDelegate, OnboardingContainerViewControllerDelegate , LogOutDelegate {
    func didLogOut() {
        setRootViewController(vc: loginViewController)
    }
    
    func didLogin() {
        setRootViewController(vc: LocalState.hasOnbordered ? dummyViewController : onboardingViewController)
    }
    func didFinishOnboarding() {
       setRootViewController(vc: dummyViewController)
        LocalState.hasOnbordered = true
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


