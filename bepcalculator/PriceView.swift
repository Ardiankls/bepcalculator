//
//  PriceView.swift
//  bepcalculator
//
//  Created by ardian kurniawan on 27/04/22.
//

import SwiftUI
    
struct PriceView: View {
    @State var fixedcost:Double = 0
    @State var totalvariablecost:Double = 0
    @State var totalunit:Int = 0
    @State var priceresult:Double = 0
    
    let currencyformat: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.zeroSymbol = ""
        formatter.currencySymbol = ""
        return formatter
    }()
    
//    var calculatePrice : String {
//        guard !fixedcost.isEmpty, !totalvariablecost.isEmpty, !totalunit.isEmpty else { return "empty" }
//        guard let fc = Double(fixedcost), let tvc  = Double(totalvariablecost), let tu = Double(totalunit) else { return "Error" }
//        let bepunit = (fc + tvc)/tu
//        return String(format: "%.2f", bepunit)
//    }
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
//                    Section(header: Text("Fixed Cost")){
//                        TextField("", text: $fixedcost).keyboardType(.decimalPad)
//                    }
//                    Section(header: Text("Total Variable Cost")){
//                        TextField("", text: $totalvariablecost).keyboardType(.decimalPad)
//                    }
//                    Section(header: Text("Total Ammount of Unit")){
//                        TextField("", text: $totalunit).keyboardType(.decimalPad)
//                    }
                    Section(header: Text("Fixed Cost")){
                        TextField("", value: $fixedcost, formatter: currencyformat).keyboardType(.decimalPad)
                            .accessibilityLabel("fixedcost, textfield")

                    }
                    Section(header: Text("Total Variable Cost")){
                        TextField("", value: $totalvariablecost, formatter: currencyformat).keyboardType(.decimalPad)
                            .accessibilityLabel("Total Variable Cost, textfield")

                    }
                    Section(header: Text("Total Ammount of Unit")){
                        TextField("", value: $totalunit, formatter: currencyformat).keyboardType(.decimalPad)
                            .accessibilityLabel("Total Ammount of unit, textfield")

                    }
                    Button(action: {
                        priceresult = (fixedcost+totalvariablecost)/Double(totalunit)
//                        print(calculatePrice)
                    }, label: {
                        Text("Calculate")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                    })
                        .listRowBackground(Color.blue)
                    
                    Section(header: Text("Price Result")){
                        Text(String(priceresult))
                            .fontWeight(.bold)
                            .accessibilityLabel("Price Result, Text")

                    }
                }
            }.navigationTitle("BEP Price")
        }
    }
}

struct PriceView_Previews: PreviewProvider {
    static var previews: some View {
        PriceView()
    }
}
