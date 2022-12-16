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
    @Published var class1: String {
        didSet {
            UserDefaults.standard.set(class1, forKey: "c1")
        }
    }
    @Published var class2: String {
        didSet {
            UserDefaults.standard.set(class2, forKey: "c2")
        }
    }
    @Published var class3: String {
        didSet {
            UserDefaults.standard.set(class3, forKey: "c3")
        }
    }
    @Published var class4: String {
        didSet {
            UserDefaults.standard.set(class4, forKey: "c4")
        }
    }
    @Published var class5: String {
        didSet {
            UserDefaults.standard.set(class5, forKey: "c5")
        }
    }
    @Published var class6: String {
        didSet {
            UserDefaults.standard.set(class6, forKey: "c6")
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
        class1 = UserDefaults.standard.object(forKey: "c1") as? String ?? "Class 1"
        class2 = UserDefaults.standard.object(forKey: "c2") as? String ?? "Class 2"
        class3 = UserDefaults.standard.object(forKey: "c3") as? String ?? "Class 3"
        class4 = UserDefaults.standard.object(forKey: "c4") as? String ?? "Class 4"
        class5 = UserDefaults.standard.object(forKey: "c5") as? String ?? "Class 5"
        class6 = UserDefaults.standard.object(forKey: "c6") as? String ?? "Class 6"
    }
}
