//
//  ContentView.swift
//  shimmerAnimation
//
//  Created by Константин Лопаткин on 11.07.2023.
//

import SwiftUI

struct ContentView: View {
    @State var list: [Int] = Array(stride(from: 1, to: 30, by: 1))
    @State var isRedacted = false
    var body: some View {
        NavigationView {
            List {
                ForEach(list, id: \.self) { item in
                    HStack(spacing: 16) {
                        Image(systemName: "person.circle.fill")
                            .font(.title)
                        Text("Item \(item)")
                            .fontWeight(.bold)
                    }
                    .padding()
                    .redacted(reason: isRedacted ? .placeholder : [])
                }
                .onDelete(perform: onDelete(_:))
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Button") {
                        isRedacted.toggle()
                    }
                }
        }
        }
    }
    
    func onDelete(_ offsets: IndexSet) {
        if !isRedacted {
            list.remove(atOffsets: offsets)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
