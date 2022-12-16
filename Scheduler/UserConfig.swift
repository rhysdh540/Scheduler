//
//  UserConfig.swift
//  Scheduler
//
//  Created by Rhys de Haan on 12/14/22.
//

import Foundation
import SwiftUI

class UserConfig: ObservableObject {
    @Published var monDay: String {
        didSet {
            UserDefaults.standard.set(monDay, forKey: "monday")
        }
    }
    @Published var classNames: [String] {
        didSet {
            UserDefaults.standard.set(classNames, forKey: "classNames")
        }
    }
    @Published var daysOff: [Bool] {
        didSet {
            UserDefaults.standard.set(daysOff, forKey: "daysOff")
        }
    }
    init() {
        monDay = UserDefaults.standard.object(forKey: "monday") as? String ?? "0"
        daysOff = UserDefaults.standard.object(forKey: "daysOff") as? [Bool] ?? [false]
        classNames = UserDefaults.standard.object(forKey: "classNames") as? [String] ?? ["History", "Science", "Math", "Language", "English", "Elective"]
    }
}
