//
//  TabBarController.swift
//  Tabbar
//
//  Created by Swarajmeet Singh on 25/08/23.
//

import UIKit

class TabBarController: UITabBarController {

    // MARK: - Properties -

    private let indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()

    private lazy var indicatorHeight: CGFloat = 50

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        customizeTabBar()
    }

    // MARK: - Customization -

    private func customizeTabBar() {
        setupIndicatorView()
        customizeTabBarAppearance()
        adjustTabBarItemImages()
    }

    private func setupIndicatorView() {
        tabBar.insertSubview(indicatorView, at: 0)
        indicatorView.frame = CGRect(x: 0, y: 10, width: 50, height: indicatorHeight)
        indicatorView.layer.cornerRadius = 10
        indicatorView.center.x = tabBar.frame.width / CGFloat(tabBar.items?.count ?? 1)
    }

    private func customizeTabBarAppearance() {
        let crimsonRust = UIColor.CrimsonRust
        guard let font = UIFont(name: "Orbitron-Regular", size: 9) else { return }
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.shadowImage = nil
        tabBarAppearance.shadowColor = nil
        tabBarAppearance.backgroundColor = .white
        
        let titleTextAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: crimsonRust, .font: font]
        let titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 8)
        
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = titleTextAttributes
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = titleTextAttributes
        tabBarAppearance.stackedLayoutAppearance.selected.titlePositionAdjustment = titlePositionAdjustment
        tabBarAppearance.stackedLayoutAppearance.normal.titlePositionAdjustment = titlePositionAdjustment
        
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
        tabBar.layer.masksToBounds = true
        tabBar.layer.cornerRadius = 30
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    private func adjustTabBarItemImages() {
        let verticalAdjustment: CGFloat = 10
        for item in tabBar.items ?? [] {
            item.imageInsets = UIEdgeInsets(top: verticalAdjustment, left: 0, bottom: -verticalAdjustment, right: 0)
        }
    }

    // MARK: - Indicator Movement -

    func moveIndicator(at index: Int) {
        guard let items = tabBar.items else { return }
        
        let tabBarWidth = tabBar.bounds.width
        let totalTabs = CGFloat(items.count)
        let itemWidth = tabBarWidth / totalTabs
        
        let selectedItem = items[index]
        let title = selectedItem.title ?? ""
        
        let font = UIFont(name: "Orbitron-Regular", size: 9) ?? UIFont.systemFont(ofSize: 9)
        let titleSize = (title as NSString).size(withAttributes: [.font: font])
        
        let indicatorWidth = titleSize.width + 20  // Add some padding
        
        let xPosition = (CGFloat(index) * itemWidth) + (itemWidth / 2) - (indicatorWidth / 2)
        
        UIView.animate(withDuration: 0.4) {
            self.indicatorView.frame = CGRect(x: xPosition, y: 10, width: indicatorWidth, height: self.indicatorHeight)
            self.indicatorView.backgroundColor = UIColor.PalePink
        }
    }

    // MARK: - Tab Bar Selection -

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let items = tabBar.items else { return }
        moveIndicator(at: items.firstIndex(of: item) ?? 0)
    }
}


extension UIColor {
    static var CrimsonRust: UIColor {
        if let color = UIColor(named: "CrimsonRust") {
            return color
        } else {
            return UIColor.black // Fallback color in case the named color is not found
        }
    }
    
    static var PalePink: UIColor {
        if let color = UIColor(named: "PalePink") {
            return color
        } else {
            return UIColor.black // Fallback color in case the named color is not found
        }
    }
}
