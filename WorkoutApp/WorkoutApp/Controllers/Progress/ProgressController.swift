//
//  ProgressController.swift
//  WorkoutApp
//
//  Created by Artur Avdeev on 21.11.2023.
//

import UIKit

class ProgressController: WABaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = R.Strings.NavBar.progress
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: Tabs.progress)
        
        
        addNavBarButton(at: .left, with: R.Strings.Progress.navBarLeft)
        addNavBarButton(at: .right, with: R.Strings.Progress.navBarRight)
    }
    
}
