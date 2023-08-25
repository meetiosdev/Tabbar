//
//  IndicatingTabBarController.swift
//  Tabbar
//
//  Created by Swarajmeet Singh on 25/08/23.
//

//
//  Created by Egzon Pllana on 13.4.23.
//  Copyright © 2023 Native Coders. All rights reserved.
//
import UIKit

//class IndicatingTabBarController: UITabBarController, UITabBarControllerDelegate {
//
//    // MARK: - Properties -
//    private let indicatorView: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor.PalePink
//        return view
//    }()
//
//    // Set attributes as you need here
//    private lazy var indicatorWidth: Double = tabBar.bounds.width / CGFloat(tabBar.items?.count ?? 1)
//    private var indicatorColor: UIColor = .black
//
//    // MARK: - Life cycle -
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Add the line indicator as a subview of the tab bar
//        tabBar.addSubview(indicatorView)
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        // Position the line indicator at the bottom of the selected tab item
//        moveIndicator()
//    }
//
//    // MARK: - Methods -
//    func moveIndicator(at index: Int=0) {
//        let itemWidth = (tabBar.bounds.width / CGFloat(tabBar.items?.count ?? 1))
//        let xPosition = (CGFloat(index) * itemWidth) + ((itemWidth / 2) - (indicatorWidth / 2))
//
//        UIView.animate(withDuration: 0.3) { [self] in
//            self.indicatorView.frame = CGRect(x: xPosition,
//                                              y: 1,
//                                              width: self.indicatorWidth,
//                                              height: 1)
//            self.indicatorView.backgroundColor = self.indicatorColor
//        }
//    }
//
//    // MARK: - UITabBarControllerDelegate -
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        guard let items = tabBar.items else { return }
//        moveIndicator(at: items.firstIndex(of: item) ?? 0)
//    }
//}

