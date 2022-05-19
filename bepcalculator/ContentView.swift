//
//  ContentView.swift
//  bepcalculator
//
//  Created by ardian kurniawan on 26/04/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            UnitView()
                .tabItem{
                    Label("Unit", systemImage: "cone")
                }
            PriceView()
                .tabItem{
                    Label("Price", systemImage: "dollarsign.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
