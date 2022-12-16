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
        .init(newTitle: "Tests", newImage: "doc.text", newImageS: "doc.text.fill"),
        .init(newTitle: "Settings", newImage: "gearshape", newImageS: "gearshape.fill")
    ]
    var body: some View {
        NavigationView {
            ListView(options: options, currentSelection: $currentOption)
            
            switch currentOption{
            case 0: MainView()
            case 1: TextEditor(text: $data.reminders).font(Font.custom("JetBrainsMonoNL-Light", size: 18)).colorScheme(.dark).padding(10)
            case 2: TestView()
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
            TextEditor(text: $hi).frame(width: 0, height: 0)
            Grid{
                GridRow{
                    Button(action: toggleSidebar, label: {
                        Image(systemName: "sidebar.leading").resizable().aspectRatio(contentMode: .fit).frame(width:20)
                    }).buttonStyle(.plain)
                    Text("Monday - Day \(monDay)")
                    Text("Tuesday - Day \(tuesDay)")
                    Text("Wednesday - Day \(wednesDay)")
                    Text("Thursday - Day \(thursDay)")
                    Text("Friday - Day \(friDay)")
                }
                ForEach(0..<data.homework.count, id: \.self){ row in
                    GridRow{
                        Text(config.classNames[row]).multilineTextAlignment(.center).frame(maxWidth:100)
                        ForEach(0..<data.homework[row].count, id: \.self){ col in
                            TextEditor(text: $data.homework[row][col]).font(mainfont)
                        }
                    }
                }
            }.padding([.trailing, .leading, .bottom])
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
                    ForEach(0..<$data.classNames.count, id: \.self){ index in
                        Text("**Class \(index+1)**")
                        TextField(getName(index), text: self.$data.classNames[index]).frame(width:300)
                    }
                    Group {
                        Spacer()
                        Button(action: clear, label: {
                            Text("Clear Homework Grid")
                        })
                        Spacer().frame(height:40)
                    }
                }
        }
        private func getName(_ index: Int) -> String{
            ["History", "Science", "Math", "Language", "English", "Elective"][index]
        }
        private func clear(){
            UserDefaults.standard.removeObject(forKey: "homework")
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    struct TestView: View {
        private let data = UserData()
        var body: some View{
            Text("**Tests**").font(Font.custom("JetBrainsMonoNL-Regular", size: 40))
        }
    }
}
