import Foundation

struct Time: Codable {
    // Example: Mon, 12 Mar 2017 09:41:00 -0400
    private static let TIME_FORMAT = "EEE, d MMM yyyy HH:mm:ss Z"
    private static let TIME_LOCALE = Locale(identifier: "en_US")

    private static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Time.TIME_FORMAT
        dateFormatter.locale = Time.TIME_LOCALE
        return dateFormatter
    }()

    let fulldate: String?

    var date: Date? {
        if let fulldate = fulldate, let parsedDate = Time.dateFormatter.date(from: fulldate) {
            return parsedDate
        } else {
            return nil
        }
    }
}
