//
// Created by Rhys de Haan on 12/15/22.
//

import Foundation

struct Test: Identifiable, Hashable {
    var subject: String
    var date: Date
    var isQuiz: Bool
    var notes: String
    var id = UUID()

    init(newSubject: String, newDate: Date, isQuiz: Bool, newNotes: String){
        subject = newSubject
        date = newDate
        self.isQuiz = isQuiz
        notes = newNotes
    }
}
