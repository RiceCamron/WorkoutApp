//
//  NavBarController.swift
//  WorkoutApp
//
//  Created by Artur Avdeev on 21.11.2023.
//

import UIKit

final class NavBarController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: R.Colors.titleGray,
            .font: R.Fonts.helvelticaRegular(with: 17)
        ]
        navigationBar.addBottomBorder(with: R.Colors.separator, height: 1)
    }
}
