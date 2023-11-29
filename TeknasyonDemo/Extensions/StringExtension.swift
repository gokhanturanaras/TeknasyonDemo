//
//  UIImageExtension.swift
//  TeknasyonDemo
//
//  Created by Gökhan Aras on 29.11.2023.
//

import UIKit

extension String {
    func getImagePath() -> String {
        ApplicationServer.imageUrl + self
    }
    
    func getUIDate() -> String {
        DateUtil.shared.getUIDateFormat(data: self) ?? ""
    }
}
