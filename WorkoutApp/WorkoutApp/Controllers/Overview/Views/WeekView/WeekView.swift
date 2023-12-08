//
//  WeekView.swift
//  WorkoutApp
//
//  Created by Artur Avdeev on 22.11.2023.
//

import UIKit

final class WeekView: WABaseView {
    
    private let calendar = Calendar.current
    private var stackView = UIStackView()
    
}

extension WeekView {
    override func setupViews() {
        super.setupViews()
        
        setupView(stackView)
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    override func configureAppearance() {
        super.configureAppearance()
        
        stackView.spacing = 7
        stackView.distribution = .fillEqually
        
        var weekDays = calendar.shortStandaloneWeekdaySymbols
        
        if calendar.firstWeekday == 1 {
            let sun = weekDays.remove(at: 0)
            weekDays.append(sun)
        }
        
        weekDays.enumerated().forEach { index, name in
            let view = WeekDayView()
            
            view.configure(with: index, and: name)
            
            stackView.addArrangedSubview(view)
            
        }
        
    }
}
