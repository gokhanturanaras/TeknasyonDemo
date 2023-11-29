//
//  DateUtil.swift
//  TeknasyonDemo
//
//  Created by Gökhan Aras on 29.11.2023.
//

import Foundation

class DateUtil {
    static let shared = DateUtil()


    func convertStringToDate(data: String) -> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: data)
    }
    func getUIDateFormat(data:String) -> String?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        guard let date =  convertStringToDate(data: data) else {
            return nil
        }
        return dateFormatter.string(from: date)
    }
}
