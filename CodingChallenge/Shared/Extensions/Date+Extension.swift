//
//  Date+Extension.swift
//  CodingChallenge
//
//  Created by Damian Włodarczyk on 21/04/2022.
//

import Foundation

extension Date {
    private enum FormatterComponents {
        static let formatter = DateFormatter()
    }

    enum Format: String, CaseIterable {
        case yearMonthDay = "YYYY-MM-dd"
        case ISO = "yyyy-MM-dd'T'HH:mm:ssZ"
        case normalizedISO = "yyyy-MM-dd HH:mm:ss"
        case time = "HH:mma"
    }

    func format(_ style: Format) -> String {
        FormatterComponents.formatter.dateFormat = style.rawValue
        FormatterComponents.formatter.timeZone = Calendar.current.timeZone

        return FormatterComponents.formatter.string(from: self)
    }
    
    func add(days: Int) -> Self {
        var dayComponent = DateComponents()
        dayComponent.day = days
        
        let theCalendar = Calendar.current
        let nextDate = theCalendar.date(byAdding: dayComponent, to: Date())
        
        return nextDate ?? self
    }

    static func from(string: String, with format: Format) throws -> Self {
        FormatterComponents.formatter.dateFormat = format.rawValue
        FormatterComponents.formatter.timeZone = TimeZone(secondsFromGMT: 0)

        guard let date = FormatterComponents.formatter.date(from: string) else {
            throw "Cannot parse string: \(string) to date with format: \(format.rawValue)"
        }

        return date
    }
}
