//
//  Resources.swift
//  WorkoutApp
//
//  Created by Artur Avdeev on 20.11.2023.
//

import UIKit

enum R {
    enum Colors {
        static var active = UIColor(hexString: "#437BFE")
        static var inactive = UIColor(hexString: "#929DA5")
        
        static var background = UIColor(hexString: "F8F9F9")
        static var separator = UIColor(hexString: "#E8ECEF")
        static var secondary = UIColor(hexString: "#F0F3FF")
        
        static var titleGray = UIColor(hexString: "#545C77")
    }
    
    enum Strings {
        enum TabBar {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .overview: return "Overview"
                case .session: return "Session"
                case .progress: return "Progress"
                case .settings: return "Settings"
                }
            }
        }
        
        enum NavBar {
            static var overview = "Today"
            static var session = "High Intensity Cardio"
            static var progress = "Workout Progress"
            static var settings = "Settings"
        }
        
        enum Overview {
            static var allWorkoutsButton = "All Workouts"
        }
        
        enum Session {
            static var navBarStart = "Start    "
            static var navBarPause = "Pause"
            static var navBarFinish = "Finish"
            
            static let elapsedTime = "Elapsed Time"
            static let remainingTime = "Remaining Time"
        }
        
        enum Progress {
            static var navBarLeft = "Export"
            static var navBarRight = "Details"
        }
        
        enum Settings {}
    }
    
    enum Images {
        enum TabBar {
            static func icon(for tab: Tabs) -> UIImage? {
                switch tab {
                case .overview: UIImage(named: "overview_tab")
                case .session: UIImage(named: "session_tab")
                case .progress: UIImage(named: "progress_tab")
                case .settings: UIImage(named: "settings_tab")
                }
            }
        }
        
        enum Common {
            static var downArrow = UIImage(named: "down_arrow")
            static var add = UIImage(named: "add_button")
        }
    }
    
    enum Fonts {
        static func helvelticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}
