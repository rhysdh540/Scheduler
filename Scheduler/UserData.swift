//
//  UserData.swift
//  Scheduler
//
//  Created by Rhys de Haan on 12/14/22.
//

import Foundation
import Combine
import SwiftUI

class UserData: ObservableObject {
    @Published var reminders: String {
        didSet {
            UserDefaults.standard.set(reminders, forKey: "reminders")
        }
    }
    @Published var tests: [Test] {
        didSet {
                UserDefaults.standard.set(tests, forKey: "tests")
        }
    }
    @Published var monday: [Binding<String>] {
        didSet {
            UserDefaults.standard.set(monday, forKey: "monday")
        }
    }
    @Published var tuesdayC1: String {
        didSet {
            UserDefaults.standard.set(tuesdayC1, forKey: "tuesc1")
        }
    }
    @Published var tuesdayC2: String {
        didSet {
            UserDefaults.standard.set(tuesdayC2, forKey: "tuesc2")
        }
    }
    @Published var tuesdayC3: String {
        didSet {
            UserDefaults.standard.set(tuesdayC3, forKey: "tuesc3")
        }
    }
    @Published var tuesdayC4: String {
        didSet {
            UserDefaults.standard.set(tuesdayC4, forKey: "tuesc4")
        }
    }
    @Published var tuesdayC5: String {
        didSet {
            UserDefaults.standard.set(tuesdayC5, forKey: "tuesc5")
        }
    }
    @Published var tuesdayC6: String {
        didSet {
            UserDefaults.standard.set(tuesdayC6, forKey: "tuesc6")
        }
    }
    @Published var wednesdayC1: String {
        didSet {
            UserDefaults.standard.set(wednesdayC1, forKey: "wedc1")
        }
    }
    @Published var wednesdayC2: String {
        didSet {
            UserDefaults.standard.set(wednesdayC2, forKey: "wedc2")
        }
    }
    @Published var wednesdayC3: String {
        didSet {
            UserDefaults.standard.set(wednesdayC3, forKey: "wedc3")
        }
    }
    @Published var wednesdayC4: String {
        didSet {
            UserDefaults.standard.set(wednesdayC4, forKey: "wedc4")
        }
    }
    @Published var wednesdayC5: String {
        didSet {
            UserDefaults.standard.set(wednesdayC5, forKey: "wedc5")
        }
    }
    @Published var wednesdayC6: String {
        didSet {
            UserDefaults.standard.set(wednesdayC6, forKey: "wedc6")
        }
    }
    @Published var thursdayC1: String {
        didSet {
            UserDefaults.standard.set(thursdayC1, forKey: "thuc1")
        }
    }
    @Published var thursdayC2: String {
        didSet {
            UserDefaults.standard.set(thursdayC2, forKey: "thuc2")
        }
    }
    @Published var thursdayC3: String {
        didSet {
            UserDefaults.standard.set(thursdayC3, forKey: "thuc3")
        }
    }
    @Published var thursdayC4: String {
        didSet {
            UserDefaults.standard.set(thursdayC4, forKey: "thuc4")
        }
    }
    @Published var thursdayC5: String {
        didSet {
            UserDefaults.standard.set(thursdayC5, forKey: "thuc5")
        }
    }
    @Published var thursdayC6: String {
        didSet {
            UserDefaults.standard.set(thursdayC6, forKey: "thuc6")
        }
    }
    @Published var fridayC1: String {
        didSet {
            UserDefaults.standard.set(fridayC1, forKey: "fric1")
        }
    }
    @Published var fridayC2: String {
        didSet {
            UserDefaults.standard.set(fridayC2, forKey: "fric2")
        }
    }
    @Published var fridayC3: String {
        didSet {
            UserDefaults.standard.set(fridayC3, forKey: "fric3")
        }
    }
    @Published var fridayC4: String {
        didSet {
            UserDefaults.standard.set(fridayC4, forKey: "fric4")
        }
    }
    @Published var fridayC5: String {
        didSet {
            UserDefaults.standard.set(fridayC5, forKey: "fric5")
        }
    }
    @Published var fridayC6: String {
        didSet {
            UserDefaults.standard.set(fridayC6, forKey: "fric6")
        }
    }
    init() {
        reminders = UserDefaults.standard.object(forKey: "reminders") as? String ?? ""
        tests = UserDefaults.standard.object(forKey: "tests") as? [Test] ?? []
        monday = UserDefaults.standard.object(forKey: "monday") as? [Binding<String>] ?? []
        tuesdayC1 = UserDefaults.standard.object(forKey: "tuec1") as? String ?? ""
        tuesdayC2 = UserDefaults.standard.object(forKey: "tuec2") as? String ?? ""
        tuesdayC3 = UserDefaults.standard.object(forKey: "tuec3") as? String ?? ""
        tuesdayC4 = UserDefaults.standard.object(forKey: "tuec4") as? String ?? ""
        tuesdayC5 = UserDefaults.standard.object(forKey: "tuec5") as? String ?? ""
        tuesdayC6 = UserDefaults.standard.object(forKey: "tuec6") as? String ?? ""
        wednesdayC1 = UserDefaults.standard.object(forKey: "wedc1") as? String ?? ""
        wednesdayC2 = UserDefaults.standard.object(forKey: "wedc2") as? String ?? ""
        wednesdayC3 = UserDefaults.standard.object(forKey: "wedc3") as? String ?? ""
        wednesdayC4 = UserDefaults.standard.object(forKey: "wedc4") as? String ?? ""
        wednesdayC5 = UserDefaults.standard.object(forKey: "wedc5") as? String ?? ""
        wednesdayC6 = UserDefaults.standard.object(forKey: "wedc6") as? String ?? ""
        thursdayC1 = UserDefaults.standard.object(forKey: "thuc1") as? String ?? ""
        thursdayC2 = UserDefaults.standard.object(forKey: "thuc2") as? String ?? ""
        thursdayC3 = UserDefaults.standard.object(forKey: "thuc3") as? String ?? ""
        thursdayC4 = UserDefaults.standard.object(forKey: "thuc4") as? String ?? ""
        thursdayC5 = UserDefaults.standard.object(forKey: "thuc5") as? String ?? ""
        thursdayC6 = UserDefaults.standard.object(forKey: "thuc6") as? String ?? ""
        fridayC1 = UserDefaults.standard.object(forKey: "fric1") as? String ?? ""
        fridayC2 = UserDefaults.standard.object(forKey: "fric2") as? String ?? ""
        fridayC3 = UserDefaults.standard.object(forKey: "fric3") as? String ?? ""
        fridayC4 = UserDefaults.standard.object(forKey: "fric4") as? String ?? ""
        fridayC5 = UserDefaults.standard.object(forKey: "fric5") as? String ?? ""
        fridayC6 = UserDefaults.standard.object(forKey: "fric6") as? String ?? ""
    }
}
