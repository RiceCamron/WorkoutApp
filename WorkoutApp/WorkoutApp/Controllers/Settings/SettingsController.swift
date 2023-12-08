//
//  SettingsController.swift
//  WorkoutApp
//
//  Created by Artur Avdeev on 21.11.2023.
//

import UIKit

class SettingsController: WABaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = R.Strings.NavBar.settings
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: Tabs.settings)
    }
    
}
