//
//  SplashViewController.swift
//  WhereIsABC
//
//  Created by Glenn Posadas on 12/10/20.
//

import UIKit

class SplashViewController: BaseViewController {

    // MARK: - Properties
    
    @IBOutlet weak var label_SplashTitle: UILabel!
    @IBOutlet weak var imageView_SplashIcon: UIImageView!
    
    // MARK: - Overrides
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.animateViews()
    }
    
    private func setupViews() { }
    
    private func animateViews() {
        UIView.animate(withDuration: 1.0, animations: {
            self.imageView_SplashIcon.alpha = 1
            self.label_SplashTitle.alpha = 1
        }) { _ in
            delay(2) {
                self.goToHome()
            }
        }
    }
    
    // MARK: - Navigations
    
    private func goToHome() {
        let homeVC = mainSB.instantiateViewController(identifier: "HomeViewController")
            as! HomeViewController
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let sceneDelegate = windowScene.delegate as? SceneDelegate,
              let window = sceneDelegate.window else { return }
        
        window.rootViewController = homeVC
        
        UIView.transition(
            with: window,
            duration: 1.0,
            options: [.transitionCrossDissolve],
            animations: { },
            completion: nil
        )
    }
}
