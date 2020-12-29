//
//  BaseButton.swift
//  BabyObjectsTalk
//
//  Created by Glenn Posadas on 12/29/20.
//

import UIKit

class BaseButton: UIButton {

    var shouldHighlight: Bool = true
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    private func setup() {
        self.layer.cornerRadius = self.frame.width / 2
        
        self.clipsToBounds = true
        
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.borderWidth = 1.0
        
        self.imageView?.contentMode = .scaleAspectFit
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setup()
    }
    
    override var isHighlighted: Bool {
        get {
            return super.isHighlighted
        }
        set {
            if newValue {
                self.alpha = self.shouldHighlight ? 0.6 : 1.0
            }
            else {
                self.alpha = 1.0
            }
            super.isHighlighted = newValue
        }
    }

    override var isSelected: Bool {
        get {
            return super.isSelected
        }
        set {
            if newValue {
                self.alpha = self.shouldHighlight ? 0.6 : 1.0
            }
            else {
                self.alpha = 1.0
            }
            super.isSelected = newValue
        }

    }
}
