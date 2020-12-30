//
//  BaseButton.swift
//  BabyObjectsTalk
//
//  Created by Glenn Posadas on 12/29/20.
//

import UIKit

class BaseButton: UIButton {

    // MARK: - Properties
    
    @IBInspectable var word: String?
    private var shouldHighlight: Bool = true
    private let label_Title = UILabel()
    
    // MARK: - Overrides
    // MARK: Functions
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    private func setup() {
        layer.cornerRadius = frame.width / 2
        
        clipsToBounds = true
        
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 1.0
        
        if let imageView = self.imageView {
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
                imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
                imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
                imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            ])
        }
    }
    
    private func setupTitle() {
        guard let value = value(forKey: "word") as? String,
              let word = Word(stringValue: value) else { return }
        
        label_Title.text = word.stringValue.capitalized
        label_Title.numberOfLines = 1
        label_Title.textAlignment = .center
        label_Title.adjustsFontSizeToFitWidth = true
        label_Title.shadowColor = .lightGray
        label_Title.shadowOffset = CGSize(width: -1, height: -1)
        label_Title.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(label_Title)
        NSLayoutConstraint.activate([
            label_Title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            label_Title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            label_Title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
        setupTitle()
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
