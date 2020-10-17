import Charts

class DayAxisValueFormatter: NSObject, IAxisValueFormatter {
    weak var chart: BarLineChartViewBase?
    let months = ["Jan", "Feb", "Mar",
                  "Apr", "May", "Jun",
                  "Jul", "Aug", "Sep",
                  "Oct", "Nov", "Dec"]

    init(chart: BarLineChartViewBase) {
        self.chart = chart
    }

    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let days = Int(value)
        let month = determineMonth(forDayOfYear: days)

        let monthName = months[month % months.count]

        return monthName

    }

    private func days(forMonth month: Int, year: Int) -> Int {
        switch month {
        case 1:
            var is29Feb = false
            if year < 1582 {
                is29Feb = (year < 1 ? year + 1 : year) % 4 == 0
            } else if year > 1582 {
                is29Feb = year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
            }
            return is29Feb ? 29 : 28

        case 3, 5, 8, 10:
            return 30

        default:
            return 31
        }
    }

    private func determineMonth(forDayOfYear dayOfYear: Int) -> Int {
        var month = -1
        var days = 0

        while days < dayOfYear {
            month += 1
            if month >= 12 {
                month = 0
            }

            let year = determineYear(forDays: days)
            days += self.days(forMonth: month, year: year)
        }

        return max(month, 0)
    }

    private func determineYear(forDays days: Int) -> Int {
        switch days {
        case ...366: return 2020
        case 367...730: return 2021
        case 731...1094: return 2022
        case 1095...1458: return 2023
        default: return 2024
        }
    }
}
