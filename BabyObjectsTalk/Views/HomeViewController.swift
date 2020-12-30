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
    
    let data = Word.allCases
    private var pageViewController: UIPageViewController?
    
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
        view.backgroundColor = .white
        contentView.backgroundColor = .white
        pageControllerContainerView.backgroundColor = .white
        constraint_ScrollViewWidth.constant = self.view.frame.width * 0.30
    }
    
    private func setupPageController() {
        pageViewController = UIPageViewController(
            transitionStyle: .pageCurl,
            navigationOrientation: .horizontal,
            options: nil
        )
        
        let firstWordController = mainSB.instantiateViewController(identifier: "WordViewerViewController")
            as! WordViewerViewController
        firstWordController.word = data.first
        
        let viewControllers = [firstWordController]
        pageViewController!.setViewControllers(
            viewControllers,
            direction: .forward,
            animated: false,
            completion: nil
        )
        
        pageViewController?.dataSource = self
        
        addChild(pageViewController!)
        pageControllerContainerView.addSubview(pageViewController!.view)

        pageViewController!.view.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            pageViewController!.view.topAnchor.constraint(
                equalTo: pageControllerContainerView.topAnchor,
                constant: 0
            ),
            pageViewController!.view.bottomAnchor.constraint(
                equalTo: pageControllerContainerView.bottomAnchor,
                constant: 0
            ),
            pageViewController!.view.leadingAnchor.constraint(
                equalTo: pageControllerContainerView.leadingAnchor,
                constant: 0
            ),
            pageViewController!.view.trailingAnchor.constraint(
                equalTo: pageControllerContainerView.trailingAnchor,
                constant: 0
            )
        ])
        
        pageViewController!.didMove(toParent: self)
    }
    
    // MARK: - IBActions
    
    @IBAction func wordButtonTapped(_ button: BaseButton) {
        guard let value = button.value(forKey: "word") as? String,
              let word = Word(stringValue: value) else {
            return
        }
        
        SFX.shared.playWord(word)
    }
}

// MARK: - UIPageViewControllerDataSource

extension HomeViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = indexOfViewController(viewController as! WordViewerViewController)
        if (index == 0) || (index == NSNotFound) { return nil }
        index -= 1
        let vc = viewControllerAtIndex(index)
        return vc
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = indexOfViewController(viewController as! WordViewerViewController)
        if index == NSNotFound { return nil }
        index += 1
        if index == data.count { return nil }
        let vc = viewControllerAtIndex(index)
        return vc
    }
}

extension HomeViewController {
    private func viewControllerAtIndex(_ index: Int) -> WordViewerViewController? {
        guard data.count > index else { return nil }
        let firstWordController = mainSB.instantiateViewController(identifier: "WordViewerViewController")
            as! WordViewerViewController
        firstWordController.word = data[index]
        return firstWordController
    }

    private func indexOfViewController(_ viewController: WordViewerViewController) -> Int {
        return data.firstIndex(where: { return $0 == viewController.word }) ?? NSNotFound
    }
}
