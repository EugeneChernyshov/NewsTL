//
//  String+Extension.swift
//  NewsTL
//
//  Created by Evgeniy Chernyshov on 28.05.2022.
//

import Foundation

extension String {
    func formatJSStringToDisplayingDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =
        "yyyy-MM-dd'T'HH:mm:ss'Z'"
        let newDate = dateFormatter.date(from: self)
        dateFormatter.setLocalizedDateFormatFromTemplate("dd.MM HH:mm")
        return dateFormatter.string(from: newDate!)
    }
}
