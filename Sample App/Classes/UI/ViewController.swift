//
//  ViewController.swift
//  Sample App
//
//  Created by Émile Bélair on 16-03-01.
//  Copyright © 2016 Mirego. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    private let TIME_REFRESH_INTERVAL: NSTimeInterval = 1
    
    private let dataSource: DataSource
    
    private let dateFormatter = NSDateFormatter()
    private var refreshTimer: NSTimer?
    
    init(dataSource: DataSource)
    {
        self.dataSource = dataSource
        
        super.init(nibName: nil, bundle: nil)
        
        dataSource.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView()
    {
        view = View()
    }
    
    deinit
    {
        deleteTimer()
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        
        createTimer()
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        
        deleteTimer()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
        return UIStatusBarStyle.LightContent
    }
    
    func refreshData()
    {
        dataSource.refreshData()
    }
}

// PMARK: Private
extension ViewController
{
    private func createTimer()
    {
        refreshTimer = NSTimer.scheduledTimerWithTimeInterval(TIME_REFRESH_INTERVAL, target: self, selector: Selector("refreshData"), userInfo: nil, repeats: true)
        refreshTimer?.fire()
    }
    
    private func deleteTimer()
    {
        refreshTimer?.invalidate()
        refreshTimer = nil
    }
}

// PMARK: DataSourceDelegate
extension ViewController: DataSourceDelegate
{
    func didRefreshData()
    {
        let view = self.view as? View
        
        if let currentDate = dataSource.currentDate
        {
            dateFormatter.dateFormat = "EEEE"
            let weekDay = dateFormatter.stringFromDate(currentDate)
            
            dateFormatter.dateFormat = "dd"
            let day = dateFormatter.stringFromDate(currentDate)
            
            dateFormatter.dateFormat = "MMMM"
            let month = dateFormatter.stringFromDate(currentDate)
            
            dateFormatter.dateFormat = "HH'h' mm'm' ss's'"
            let time = dateFormatter.stringFromDate(currentDate)
            
            view?.refreshDate(weekDay: weekDay, day: day, month: month, time: time)
        }
        else
        {
            view?.refreshDate(weekDay: "", day: "--", month: "", time: "")
        }
    }
}
