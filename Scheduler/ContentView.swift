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
                    Group{
                        Spacer().frame(height:60)
                        Text(config.class1).frame(maxWidth: 100, alignment: .center).multilineTextAlignment(.center)
                        Spacer()
                        Text(config.class2).frame(maxWidth: 100, alignment: .center).multilineTextAlignment(.center)
                        Spacer()
                        Text(config.class3).frame(maxWidth: 100, alignment: .center).multilineTextAlignment(.center)
                    }
                    Group{
                        Spacer()
                        Text(config.class4).frame(maxWidth: 100, alignment: .center).multilineTextAlignment(.center)
                        Spacer()
                        Text(config.class5).frame(maxWidth: 100, alignment: .center).multilineTextAlignment(.center)
                        Spacer()
                        Text(config.class6).frame(maxWidth: 100, alignment: .center).multilineTextAlignment(.center)
                        Spacer().frame(height: 70)
                    }
                }
                VStack{
                    Spacer()
                    Text("Monday - Day \(monDay)")
                    ForEach($data.monday, id: \.self) { $txt in
                        TextEditor(text: $txt)
                    }
                }
                VStack{
                    Spacer()
                    Text("Tuesday - Day \(tuesDay)")
                    TextEditor(text: $data.tuesdayC1).font(mainfont)
                    TextEditor(text: $data.tuesdayC2).font(mainfont)
                    TextEditor(text: $data.tuesdayC3).font(mainfont)
                    TextEditor(text: $data.tuesdayC4).font(mainfont)
                    TextEditor(text: $data.tuesdayC5).font(mainfont)
                    TextEditor(text: $data.tuesdayC5).font(mainfont)
                }
                VStack{
                    Spacer()
                    Text("Wednesday - Day \(wednesDay)")
                    TextEditor(text: $data.wednesdayC1).font(mainfont)
                    TextEditor(text: $data.wednesdayC2).font(mainfont)
                    TextEditor(text: $data.wednesdayC3).font(mainfont)
                    TextEditor(text: $data.wednesdayC4).font(mainfont)
                    TextEditor(text: $data.wednesdayC5).font(mainfont)
                    TextEditor(text: $data.wednesdayC6).font(mainfont)
                }
                VStack{
                    Spacer()
                    Text("Thursday - Day \(thursDay)")
                    TextEditor(text: $data.thursdayC1).font(mainfont)
                    TextEditor(text: $data.thursdayC2).font(mainfont)
                    TextEditor(text: $data.thursdayC3).font(mainfont)
                    TextEditor(text: $data.thursdayC4).font(mainfont)
                    TextEditor(text: $data.thursdayC5).font(mainfont)
                    TextEditor(text: $data.thursdayC6).font(mainfont)
                }
                VStack{
                    Spacer()
                    Text("Friday - Day \(friDay)")
                    TextEditor(text: $data.fridayC1).font(mainfont)
                    TextEditor(text: $data.fridayC2).font(mainfont)
                    TextEditor(text: $data.fridayC3).font(mainfont)
                    TextEditor(text: $data.fridayC4).font(mainfont)
                    TextEditor(text: $data.fridayC5).font(mainfont)
                    TextEditor(text: $data.fridayC6).font(mainfont)
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
        @ObservedObject var data: UserConfig = UserConfig.init()
        
        var body: some View {
                VStack{
                    Group{
                        Spacer()
                        Text("**Monday Day**")
                        TextField("1-6", text: $data.monDay).frame(width:30)
                        Spacer().frame(height:30)
                    }
                    Group{
                        Text("**Class 1**")
                        TextField("History", text: $data.class1).frame(width:200)
                        Text("**Class 2**")
                        TextField("Science", text: $data.class2).frame(width:200)
                        Text("**Class 3**")
                        TextField("Math", text: $data.class3).frame(width:200)
                    }
                    Group{
                        Text("**Class 4**")
                        TextField("Language", text: $data.class4).frame(width:200)
                        Text("**Class 5**")
                        TextField("English", text: $data.class5).frame(width:200)
                        Text("**Class 6**")
                        TextField("Elective", text: $data.class6).frame(width:200)
                    }
                    Spacer()
                }
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
