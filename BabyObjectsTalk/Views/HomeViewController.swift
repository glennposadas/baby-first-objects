//
//  HomeViewController.swift
//  BabyObjectsTalk
//
//  Created by Glenn Posadas on 12/28/20.
//

import UIKit

class HomeViewController: BaseViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var pageControllerContainerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var constraint_ScrollViewWidth: NSLayoutConstraint!
    
    // MARK: - Overrides
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupPageController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        askForSettings()
    }
    
    private func askForSettings() {
        if AppDefaults.getObjectWithKey(.askedSettings, type: Bool.self) == nil {
            alert(
                title: "Do you want to use US or UK English?",
                message: nil,
                okayButtonTitle: "US",
                cancelButtonTitle: "UK") { didTapUS in
                AppDefaults.store(true, key: .askedSettings)
                self.informUser(didTapUS)
            }
        }
    }
    
    private func informUser(_ didTapUS: Bool) {
        let kind = didTapUS ? "US" : "British"
        let message = "Hi! You've selected \(kind) English! You can change this setting on the Settings app, and then navigate to the WORDS FOR BABIES. Thank you!"
        
        didTapUS ? SFX.shared.playUSEnglishSettings() : SFX.shared.playUKEnglishSettings()
            
        alert(
            title: "A quick note",
            message: message,
            okayButtonTitle: "Got it!",
            withBlock: nil
        )
    }
    
    private func setupViews() {
        contentView.backgroundColor = .white
        pageControllerContainerView.backgroundColor = .white
        constraint_ScrollViewWidth.constant = self.view.frame.width * 0.30
    }
    
    private func setupPageController() {
        
    }
    
    // MARK: - IBActions
    
    @IBAction func wordButtonTapped(_ button: BaseButton) {
        
    }
}
