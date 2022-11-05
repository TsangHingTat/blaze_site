//
//  ContentView.swift
//  PLC
//
//  Created by HingTatTsang on 5/11/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach((1...10), id: \.self) { i in
                    CombineView(time: UInt32(i))
                }
            }
        }
    }
}

struct CombineView: View {
    @State var light1 = false
    let time: UInt32
    var body: some View {
        HStack {
            light(onoff: $light1)
            Toggle("", isOn: $light1)
        }
        .onAppear() {
            sleep(time)
            light1 = true
        }
    }
}

struct light: View {
    @Binding var onoff: Bool
    var body: some View {
        VStack {
            if onoff == true {
                Circle()
                    .foregroundColor(.red)
            } else {
                Circle()
                    .foregroundColor(.gray)
                
            }
        }
        .frame(width: 50, height: 50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
