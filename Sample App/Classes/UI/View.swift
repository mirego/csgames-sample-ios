//
//  View.swift
//  Sample App
//
//  Created by Émile Bélair on 16-03-01.
//  Copyright © 2016 Mirego. All rights reserved.
//

import MCUIViewLayout
import UIKit

class View: UIView
{
    private let weekDayLabel = UILabel()
    private let dayLabel = UILabel()
    private let monthLabel = UILabel()
    private let timeLabel = UILabel()
    private var labels: [UIView] {
        return [weekDayLabel, dayLabel, monthLabel, timeLabel]
    }
    
    init()
    {
        super.init(frame: CGRectZero)
        
        backgroundColor = UIColor(forHex: "#ad9758")
        
        weekDayLabel.font = UIFont.systemFontOfSize(36, weight: UIFontWeightUltraLight)
        weekDayLabel.textColor = UIColor.whiteColor()
        addSubview(weekDayLabel)
        
        dayLabel.font = UIFont.systemFontOfSize(80, weight: UIFontWeightMedium)
        dayLabel.textColor = UIColor.whiteColor()
        addSubview(dayLabel)
        
        monthLabel.font = UIFont.systemFontOfSize(36, weight: UIFontWeightLight)
        monthLabel.textColor = UIColor.whiteColor()
        addSubview(monthLabel)
        
        timeLabel.font = UIFont.systemFontOfSize(30, weight: UIFontWeightMedium)
        timeLabel.textColor = UIColor.whiteColor()
        addSubview(timeLabel)
    }

    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        let margin1: CGFloat = 40
        let margin2: CGFloat = 0
        let margin3: CGFloat = 60
        
        let totalHeight = labels.reduce(0, combine: { $0 + $1.mc_height() }) + margin1 + margin2 + margin3
        
        weekDayLabel.mc_setPosition(.PositionTopHCenter, withMargins: UIEdgeInsets(top: (mc_height() - totalHeight) / 2, left: 0, bottom: 0, right: 0))
        
        dayLabel.mc_setRelativePosition(.RelativePositionUnderCentered, toView: weekDayLabel, withMargins: UIEdgeInsets(top: margin1, left: 0, bottom: 0, right: 0))
        
        monthLabel.mc_setRelativePosition(.RelativePositionUnderCentered, toView: dayLabel, withMargins: UIEdgeInsets(top: margin2, left: 0, bottom: 0, right: 0))
        
        timeLabel.mc_setRelativePosition(.RelativePositionUnderCentered, toView: monthLabel, withMargins: UIEdgeInsets(top: margin3, left: 0, bottom: 0, right: 0))
    }
}

// PMARK: Public
extension View
{
    func refreshDate(weekDay weekDay: String, day: String, month: String, time: String)
    {
        weekDayLabel.text = weekDay
        weekDayLabel.sizeToFit()
        
        dayLabel.text = day
        dayLabel.sizeToFit()
        
        monthLabel.text = month
        monthLabel.sizeToFit()
        
        timeLabel.text = time
        timeLabel.sizeToFit()
        
        setNeedsLayout()
    }
}
