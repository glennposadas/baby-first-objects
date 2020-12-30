//
//  WordViewerViewController.swift
//  BabyObjectsTalk
//
//  Created by Glenn Posadas on 12/30/20.
//

import UIKit

class WordViewerViewController: BaseViewController {

    // MARK: - Properties
    
    var word: Word!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Overrides
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = word.icon
    }
}
