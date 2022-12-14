//
//  ContentView.swift
//  Scheduler
//
//  Created by Rhys de Haan on 12/12/22.
//

import SwiftUI
import SwiftDown


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
    @State private var tests = ""
    let options: [Option] = [
        .init(newTitle: "Schedule", newImage: "calendar.circle", newImageS: "calendar.circle.fill"),
        .init(newTitle: "Reminders", newImage: "list.bullet.rectangle", newImageS: "list.bullet.rectangle.fill"),
        .init(newTitle: "Settings", newImage: "gearshape", newImageS: "gearshape.fill")
    ]
    var body: some View {
        NavigationView {
            ListView(options: options, currentSelection: $currentOption)
            
            switch currentOption{
            case 0: MainView()
            case 1: SwiftDownEditor(text: $tests)
            case 2: Text("imagine all the settings")
            default: Text("amogus")
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
        @State private var   defaultText: String = ""
        @State private var  defaultText2: String = ""
        @State private var  defaultText3: String = ""
        @State private var  defaultText4: String = ""
        @State private var  defaultText5: String = ""
        @State private var  defaultText6: String = ""
        @State private var  defaultText7: String = ""
        @State private var  defaultText8: String = ""
        @State private var  defaultText9: String = ""
        @State private var defaultText10: String = ""
        @State private var defaultText11: String = ""
        @State private var defaultText12: String = ""
        @State private var defaultText13: String = ""
        @State private var defaultText14: String = ""
        @State private var defaultText15: String = ""
        @State private var defaultText16: String = ""
        @State private var defaultText17: String = ""
        @State private var defaultText18: String = ""
        @State private var defaultText19: String = ""
        @State private var defaultText20: String = ""
        @State private var defaultText21: String = ""
        @State private var defaultText22: String = ""
        @State private var defaultText23: String = ""
        @State private var defaultText24: String = ""
        @State private var defaultText25: String = ""
        @State private var defaultText26: String = ""
        @State private var defaultText27: String = ""
        @State private var defaultText28: String = ""
        @State private var defaultText29: String = ""
        @State private var defaultText30: String = ""
        var body: some View {
            HStack{
                VStack{
                    Spacer().frame(height:20)
                    Button(action: toggleSidebar, label: {
                        Image(systemName: "sidebar.leading").resizable().aspectRatio(contentMode: .fit).frame(width:20)
                    }).buttonStyle(.plain)
                    Group{
                        Spacer().frame(height:70)
                        Text("History")
                        Spacer().frame(height:135)
                        Text("Chemistry")
                        Spacer().frame(height:135)
                    }
                    Group{
                        Text("Math")
                        Spacer().frame(height:135)
                        Text("English")
                        Spacer().frame(height:135)
                        Text("Spanish")
                        Spacer().frame(height:135)
                        Text("Computer\nScience/Health").frame(alignment: .center).multilineTextAlignment(.center)
                        Spacer()
                    }
                }
                VStack{
                    Spacer()
                    Text("Monday")
                    TextEditor(text: $defaultText).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                    TextEditor(text: $defaultText2).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                    TextEditor(text: $defaultText3).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                    TextEditor(text: $defaultText4).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                    TextEditor(text: $defaultText5).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                    TextEditor(text: $defaultText6).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                }
                VStack{
                    Spacer()
                    Text("Tuesday")
                    TextEditor(text: $defaultText7).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                    TextEditor(text: $defaultText8).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                    TextEditor(text: $defaultText9).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                    TextEditor(text: $defaultText10).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                    TextEditor(text: $defaultText11).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                    TextEditor(text: $defaultText12).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                }
                VStack{
                    Spacer()
                    Text("Wednesday")
                    TextEditor(text: $defaultText13).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                    TextEditor(text: $defaultText14).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                    TextEditor(text: $defaultText15).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                    TextEditor(text: $defaultText16).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                    TextEditor(text: $defaultText17).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                    TextEditor(text: $defaultText18).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                }
                VStack{
                    Spacer()
                    Text("Thursday")
                    TextEditor(text: $defaultText19).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                    TextEditor(text: $defaultText20).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                    TextEditor(text: $defaultText21).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                    TextEditor(text: $defaultText22).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                    TextEditor(text: $defaultText23).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                    TextEditor(text: $defaultText24).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                }
                VStack{
                    Spacer()
                    Text("Friday")
                    TextEditor(text: $defaultText25).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                    TextEditor(text: $defaultText26).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                    TextEditor(text: $defaultText27).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                    TextEditor(text: $defaultText28).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                    TextEditor(text: $defaultText29).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                    TextEditor(text: $defaultText30).font(Font.custom("JetBrainsMonoNL-Light", size: 14))
                }
            }.padding([.leading, .trailing, .bottom])
        }
        private func toggleSidebar(){
            NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
