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
    @IBOutlet var buttons: [BaseButton]!
    
    // MARK: - Overrides
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupViews()
    }

    private func setupViews() {
        contentView.backgroundColor = .white
        pageControllerContainerView.backgroundColor = .white
        constraint_ScrollViewWidth.constant = self.view.frame.width * 0.30
    }
    
    // MARK: - IBActions
    
    @IBAction func wordButtonTapped(_ button: BaseButton) {

    }
}
