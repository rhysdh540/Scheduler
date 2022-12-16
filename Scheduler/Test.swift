//
// Created by Rhys de Haan on 12/15/22.
//

import Foundation

struct Test: Identifiable, Hashable {
    var name: String
    var subject: String
    var date: Date
    var isQuiz: Bool
    var notes: String
    var id = UUID()

    init(_ newName: String, _ newSubject: String, _ newDate: Date, _ isQuiz: Bool, _ newNotes: String){
        name = newName
        subject = newSubject
        date = newDate
        self.isQuiz = isQuiz
        notes = newNotes
    }
}
