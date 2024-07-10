//
//  Date+Ext.swift
//  GithubFollowers
//
//  Created by Rami Mustafa on 08.07.24.
//

import Foundation



extension Date{
    func convertToMonthYearFormat() -> String{
        return formatted(.dateTime.month().year())
    }
}
