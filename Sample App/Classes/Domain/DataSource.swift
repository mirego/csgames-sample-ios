//
//  DataSource.swift
//  Sample App
//
//  Created by Émile Bélair on 16-03-01.
//  Copyright © 2016 Mirego. All rights reserved.
//

import Alamofire

protocol DataSourceDelegate
{
    func didRefreshData()
}

class DataSource: NSObject
{
    private let TIME_API_URL = "http://www.timeapi.org/utc/now"
    private let TIME_FORMAT = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    
    private let dateFormatter = NSDateFormatter()
    
    private(set) var currentDate: NSDate?
    var delegate: DataSourceDelegate?
    
    override init()
    {
        super.init()
        
        dateFormatter.dateFormat = TIME_FORMAT
        dateFormatter.locale = NSLocale.currentLocale()
    }
    
    func refreshData()
    {
        Alamofire.request(.GET, TIME_API_URL).responseString {
            response in
            
            if let value = response.result.value, parsedDate = self.dateFormatter.dateFromString(value)
            {
                self.currentDate = parsedDate
            }
            else
            {
                self.currentDate = nil
            }
            
            self.delegate?.didRefreshData()
        }
    }
}
