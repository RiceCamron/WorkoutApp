//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Artur Avdeev on 21.11.2023.
//

import UIKit

class SessionController: WABaseController {
    private var timerView = TimerView()
    private let statsView = StatsView(with: R.Strings.Session.workoutStats)
    private let stepsView = StepsView(with: R.Strings.Session.stepsCounter)
    
    private let timerDuration = 5.0
    
    override func navBarLeftButtonHandler() {
        if timerView.state == .isStopped {
            timerView.startTimer { progress in
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.navBarRightButtonHandler()
                }
            }
        } else {
            timerView.pauseTimer()
        }
        
        timerView.state =  timerView.state == .isRuning ? .isStopped : .isRuning
        setTitleForNavBarButton(timerView.state == .isRuning ? R.Strings.Session.navBarPause :  R.Strings.Session.navBarStart, at: .left)
        
    }
    
    override func navBarRightButtonHandler() {
        timerView.stopTimer()
        timerView.state = .isStopped
        
        setTitleForNavBarButton( R.Strings.Session.navBarStart, at: .left)
    }
}

extension SessionController {
    override func setupViews() {
        super.setupViews()
        
        view.setupView(timerView)
        view.setupView(statsView)
        view.setupView(stepsView)
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            statsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            statsView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 10),
            statsView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -7.5),
            
            stepsView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 7.5),
            stepsView.topAnchor.constraint(equalTo: statsView.topAnchor),
            stepsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            stepsView.heightAnchor.constraint(equalTo: statsView.heightAnchor),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        title = R.Strings.NavBar.session
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: Tabs.session)
        
        addNavBarButton(at: .left, with: R.Strings.Session.navBarStart)
        addNavBarButton(at: .right, with: R.Strings.Session.navBarFinish)
        
        timerView.configure(with: timerDuration, progress: 0.0)
        
        timerView.callBack = { progress in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.navBarRightButtonHandler()
                print(progress)
            }
        }
        
        statsView.configure(with: [.heartRate(value: "155"),
                                   .averagePace(value: "8'20''"),
                                   .totalSteps(value: "7,682"),
                                   .totalDistance(value: "8.25")])
        
        stepsView.configure(with: [.init(value: "8k", heightParm: 1, title: "2/14"),
                                   .init(value: "7k", heightParm: 0.8, title: "2/15"),
                                   .init(value: "5k", heightParm: 0.6, title: "2/16"),
                                   .init(value: "6k", heightParm: 0.3, title: "2/17")])
    }
}
