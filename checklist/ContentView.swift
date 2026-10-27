//
//  ContentView.swift
//  checklist
//
//  Created by Andy Huang on 7/16/23.
//
import SwiftUI

struct ContentView: View {
    @State private var description: String = ""
    @State var inProgress: [String] = []
    @State var complete: [String] = []
    var body: some View {
        VStack(){
            HeaderView(description:$description,inProgress:$inProgress)
            ChecklistView(inProgress:$inProgress,complete:$complete)

        }

    }
}

struct ChecklistView: View {
    @Binding var inProgress: [String]
    @Binding var complete: [String]
    var body: some View {
        List{
            Section{
                ForEach(inProgress,id: \.self){task in
                    Button(){
                        if let index = inProgress.firstIndex(of: task){
                            inProgress.remove(at: index)
                        }
                        complete.append(task)
                    }label: {
                        Text(task)
                    }
                    
                }
            }header: {
                Text("In Progress")
            }
            Section{
                ForEach(complete,id:\.self){task in
                    Button(){
                        if let index = complete.firstIndex(of: task){
                            complete.remove(at: index)
                        }
                        inProgress.append(task)
                    }label: {
                        HStack{
                            Image(systemName: "checkmark")
                            Text(task)
                        }
                    }
                }
            }header: {
                Text("Complete")
            }
            
        }
    }
}
struct HeaderView: View {
    @Binding var description: String
    @Binding var inProgress: [String]
    var body: some View{
        VStack{
            HStack(){
                Image("Charmander")
                    .resizable()
                    .scaledToFit()
                    .scaledToFill()
                    .frame(width:100,height:100)
                    .offset(x:20,y:30)
                    .clipShape(Circle())
                    .overlay(Circle()
                        .stroke(Color.gray,lineWidth: 4)
                    )
                    .padding(15)
                    .shadow(radius: 10)
                Text("Charmander")
                    .font(.title)
                    .bold()
                    .padding(20)
                Spacer()
            }
            HStack(){
                TextField("Enter description",text : $description)
                    .textFieldStyle(.roundedBorder)
                
                Button(){
                    inProgress.append(description)
                    description = ""
                } label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                    
                        .padding(.horizontal,20)
                        .padding(.vertical,7)
                        .background(Color.blue)
                        .clipShape(Capsule())
                    
                }
            }
            .padding(20)

        }
    }
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
