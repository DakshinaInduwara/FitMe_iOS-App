import SwiftUI
import UserNotifications

struct NotificationView: View {
    var body: some View {
        Text("Notificatoin Panel")
            .onAppear {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                    if granted {
                        print("Notification permission granted")
                    } else if let error = error {
                        print("Error requesting notification permission: \(error.localizedDescription)")
                    }
                }
            }
    }

    func checkForPermission() {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificatoinSettings { settings in
            switch settings.authorizationStatus {
                case .authorized:
                    self.dispatchNotification()
                case .denied:
                    return
                case .notDetermined:
                    notificationCenter.requestAuthorization(options: [.alert, .sound]) { didAllow, error in
                        if didAllow {
                            self.dispatchNotification()
                        }
                    }
                default:
                    return
            }
        }
    }

    func dispatchNotification() {
        let identifier = "my-morning-notification"
        let title = "Time to workout!"
        let body = "Don't be lazy, Hurry up man"
        let hour = 17
        let minute = 01
        let isDaily = true

        let notificationCenter = UNUserNotificationCenter.current()

        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default

        let calendar = Calendar.current
        var dateComponents = DateComponents(calendar: calendar, timeZone: TimeZone.current)
        dateComponents.hour = hour
        dateComponents.minute = minute

        let trigger = UNCalendarNotificationTriger(dateMatching: dateComponents, repeats: isDaily)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
        notificationCenter.add(request)
    }

}

func scheduleNotification(forGoal type: String, current: Double, goal: Double) {
    guard current >= goal else { return }
    
    let content = UNMutableNotificationContent()
    content.title = "\(type) Goal Reached!"
    content.body = "Congratulations! You've reached your \(type.lowercased()) goal of \(goal.formatDouble()) \(type == "Step" ? "steps" : "calories")!"
    content.sound = .default
    
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("Error adding notification: \(error.localizedDescription)")
        }
    }
}
