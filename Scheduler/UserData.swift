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
    @Published var homework: [[String]] {
        didSet {
            UserDefaults.standard.set(homework, forKey: "homework")
        }
    }
    init() {
        reminders = UserDefaults.standard.object(forKey: "reminders") as? String ?? ""
        tests = UserDefaults.standard.object(forKey: "tests") as? [Test] ?? []
        homework = UserDefaults.standard.object(forKey: "homework") as? [[String]] ?? [["", "", "", "", ""], ["", "", "", "", ""], ["", "", "", "", ""], ["", "", "", "", ""], ["", "", "", "", ""], ["", "", "", "", ""]]
    }
}
