import Foundation

struct TimeLeft {
    let hours: Int
    let minutes: Int
    
    var stringify: String {
        var hrsending = ""
        var minending = ""
        let hr = hours % 100
        if (hr >= 10 && hr <= 14) || (hr % 10 == 0) || (hr % 10 >= 5) {
            hrsending = "часов"
        } else if (hr % 10 == 1) {
            hrsending = "час"
        } else {// if (hr % 10 >= 2 && hr % 10 <= 4) {
            hrsending = "часа"
        }
        
        
        if (minutes >= 10 && minutes <= 14) || (minutes % 10 == 0) || (minutes % 10 >= 5) {
            minending = "минут"
        } else if (minutes % 10 == 1) {
            minending = "минута"
        } else {// if (hr % 10 >= 2 && hr % 10 <= 4) {
            minending = "минуты"
        }
        
        
        return "\(hours) \(hrsending) \(minutes) \(minending)"
    }
}

struct PredictionModel {
    let fastestTime: TimeLeft
    let mediumTime: TimeLeft
    let longestTime: TimeLeft
}
