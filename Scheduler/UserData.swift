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
    @Published var monday: [String] {
        didSet {
            UserDefaults.standard.set(monday, forKey: "monday")
        }
    }
    @Published var tuesday: [String] {
        didSet {
            UserDefaults.standard.set(tuesday, forKey: "tuesday")
        }
    }
    @Published var wednesday: [String] {
        didSet {
            UserDefaults.standard.set(wednesday, forKey: "wednesday")
        }
    }
    @Published var thursday: [String] {
        didSet {
            UserDefaults.standard.set(thursday, forKey: "thursday")
        }
    }
    @Published var friday: [String] {
        didSet {
            UserDefaults.standard.set(friday, forKey: "friday")
        }
    }
    init() {
        reminders = UserDefaults.standard.object(forKey: "reminders") as? String ?? ""
        tests = UserDefaults.standard.object(forKey: "tests") as? [Test] ?? []
        monday = UserDefaults.standard.object(forKey: "monday") as? [String] ?? ["", "", "", "", "", ""]
        tuesday = UserDefaults.standard.object(forKey: "tuesday") as? [String] ?? ["", "", "", "", "", ""]
        wednesday = UserDefaults.standard.object(forKey: "wednesday") as? [String] ?? ["", "", "", "", "", ""]
        thursday = UserDefaults.standard.object(forKey: "thursday") as? [String] ?? ["", "", "", "", "", ""]
        friday = UserDefaults.standard.object(forKey: "friday") as? [String] ?? ["", "", "", "", "", ""]
    }
}
