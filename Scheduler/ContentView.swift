//
//  ContentView.swift
//  Scheduler
//
//  Created by Rhys de Haan on 12/12/22.
//

import SwiftUI

struct Option: Hashable {
    let title: String
    let imageName: String
    let imageNameS: String
    
    init(newTitle: String, newImage: String, newImageS: String){
        title = newTitle
        imageName = newImage
        imageNameS = newImageS
    }
}
struct ContentView: View {
    @State var currentOption = 0
    @State private var data: UserData = UserData.init()
    let options: [Option] = [
        .init(newTitle: "Schedule", newImage: "calendar.circle", newImageS: "calendar.circle.fill"),
        .init(newTitle: "Reminders", newImage: "list.bullet.rectangle", newImageS: "list.bullet.rectangle.fill"),
            .init(newTitle: "Crash", newImage: "exclamationmark.3", newImageS: "exclamationmark."),
        //.init(newTitle: "Tests", newImage: "doc.text", newImageS: "doc.text.fill"),
        .init(newTitle: "Settings", newImage: "gearshape", newImageS: "gearshape.fill")
    ]
    var body: some View {
        NavigationView {
            ListView(options: options, currentSelection: $currentOption)
            
            switch currentOption{
            case 0: MainView()
            case 1: TextEditor(text: $data.reminders).font(Font.custom("JetBrainsMonoNL-Light", size: 18)).colorScheme(.dark).padding(10)
            case 2: TestView()//Text("**Tests**").font(Font.custom("JetBrainsMonoNL-Regular", size: 40))
            case 3: SettingsView()
            default: MainView()
            }
        }
        .frame(minWidth: 600, minHeight: 400)
    }
    
    struct ListView: View {
        let options: [Option]
        @Binding var currentSelection: Int
        
        var body: some View {
            VStack{
                let current = options[currentSelection]
                ForEach(options, id: \.self) { option in
                    HStack{
                        Image(systemName: current == option ? option.imageNameS : option.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                        
                        Text(option.title)
                        
                        Spacer()
                    }
                    .padding(5)
                    .onTapGesture {
                        self.currentSelection = options.firstIndex(of: option) ?? 0
                    }
                }
            }
            Spacer()
        }
    }
    
    struct MainView: View {
        @State private var data: UserData = UserData.init()
        @State private var config: UserConfig = UserConfig.init()
        private let mainfont: Font = Font.custom("JetBrainsMonoNL-Light", size: 14)
        @State private var hi = ""
        
        var body: some View {
            let monDay = config.monDay
            let tuesDay = addOne(monDay)
            let wednesDay = addOne(tuesDay)
            let thursDay = addOne(wednesDay)
            let friDay = addOne(thursDay)
            HStack{
                VStack{
                    TextEditor(text:$hi).frame(width:0,height:0) // this is so the "selected" outline around the toggle sidebar button doesn't show up
                    Spacer().frame(height:10)
                    Button(action: toggleSidebar, label: {
                        Image(systemName: "sidebar.leading").resizable().aspectRatio(contentMode: .fit).frame(width:20)
                    }).buttonStyle(.plain)
                    Spacer().frame(height:60)
                    ForEach(0..<config.classNames.count, id: \.self) { i in
                        Text(config.classNames[i]).frame(maxWidth: 100, alignment: .center).multilineTextAlignment(.center)
                        if(i != config.classNames.count-1){ Spacer() }
                    }
                    Spacer().frame(height: 70)
                }
                VStack{
                    Spacer()
                    Text("Monday - Day \(monDay)")
                    ForEach(0..<data.monday.count, id: \.self) { index in
                        TextEditor(text: self.$data.monday[index]).font(mainfont)
                    }
                }
                VStack{
                    Spacer()
                    Text("Tuesday - Day \(tuesDay)")
                    ForEach(0..<data.tuesday.count, id: \.self) { index in
                        TextEditor(text: self.$data.tuesday[index]).font(mainfont)
                    }
                }
                VStack{
                    Spacer()
                    Text("Wednesday - Day \(wednesDay)")
                    ForEach(0..<data.wednesday.count, id: \.self) { index in
                        TextEditor(text: self.$data.wednesday[index]).font(mainfont)
                    }
                }
                VStack{
                    Spacer()
                    Text("Thursday - Day \(thursDay)")
                    ForEach(0..<data.thursday.count, id: \.self) { index in
                        TextEditor(text: self.$data.thursday[index]).font(mainfont)
                    }
                }
                VStack{
                    Spacer()
                    Text("Friday - Day \(friDay)")
                    ForEach(0..<data.friday.count, id: \.self) { index in
                        TextEditor(text: self.$data.friday[index]).font(mainfont)
                    }
                }
            }.padding([.leading, .trailing, .bottom])
        }
        private func toggleSidebar(){
            NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
        }
        private func addOne(_ input: String) -> String{
            if(!"123456".contains(input)){return "ERROR"}
            return (input=="6") ? "1" : String((Int(input) ?? -2)+1)
        }
    }
    
    struct SettingsView: View {
        @State var data: UserConfig = UserConfig.init()
        @State var input: [String] = UserConfig.init().classNames

        var body: some View {
                VStack{
                    Group{
                        Spacer()
                        Text("**Monday Day**")
                        TextField("1-6", text: $data.monDay).frame(width:30)
                        Spacer().frame(height:30)
                    }
                    ForEach(0..<$data.classNames.count, id: \.self){ index in
                        Text("**Class \(index+1)**")
                        TextField(getName(index), text: $data.classNames[index]).frame(width:200)
                    }
                    Spacer()
                }
        }
        private func getName(_ index: Int) -> String{
            ["History", "Science", "Math", "Language", "English", "Elective"][index]
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
struct TestView: View {
    private let data = UserData()
    @State private var tests: [Test] = [
        .init(newSubject: "hi", newDate: Date(), isQuiz: false, newNotes: "notes")
    ]
    @State private var selection = Set<UUID>()
    @State private var currentSelection: Int
    init(){
        let test1 = Test(newSubject: "Math", newDate: Date(), isQuiz: false, newNotes: "rational functions")
        tests = data.tests
//        tests.append(test1)
//        currentSelection = tests.isEmpty ? 0 : tests.count - 1
        currentSelection = 0
    }
    var body: some View {
            HStack {
                List(tests, selection: $selection) { test in
                    Text("\(test.subject) test on \(test.date)")
                }.navigationTitle("Tests").font(Font.custom("JetBrainsMonoNL-Regular", fixedSize: 30)).frame(width: 300)
                Spacer().frame(width: 20)
                VStack{
                    HStack {
                        Spacer()
                        Text(tests[currentSelection].subject).font(Font.custom("JetBrainsMonoNL-Regular", fixedSize: 30))
                        Spacer()
                    }
                    TextField("Subject", text: $tests[currentSelection].subject)
                    DatePicker("Date", selection: $tests[currentSelection].date)
                    Toggle("Quiz", isOn: $tests[currentSelection].isQuiz)
                    Text("Notes")
                    TextEditor(text: $tests[currentSelection].notes)
                }
            }
    }
}
