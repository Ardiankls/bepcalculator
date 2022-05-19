//
//  UnitView.swift
//  bepcalculator
//
//  Created by ardian kurniawan on 27/04/22.
//
import SwiftUI

struct UnitView: View {
    @State var fixedcostunit:Double = 0
    @State var variablecostunit:Double = 0
    @State var priceperunit:Double = 0
    @State var total:Double = 0
    
    
    let currencyformat: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.zeroSymbol = ""
        formatter.currencySymbol = ""
        return formatter
    }()
    
    //    var calculateUnit : String {
    //        guard !fixedcostunit.isEmpty, !variablecostunit.isEmpty, !priceperunit.isEmpty else { return "empty" }
    //        guard let fcu = Double(fixedcostunit), let vcu  = Double(variablecostunit), let pcu = Double(priceperunit) else { return "Error" }
    //        let bepunit = fcu / (pcu-vcu)
    //        return String(format: "%.2f", bepunit)
    //    }
    //
    //    func calculate(){
    //        total = fixedcostunit / (variablecostunit/priceperunit)
    //        print (total)
    //    }
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section(header: Text("Fixed Cost").foregroundColor(.black)){
                        TextField("", value: $fixedcostunit, formatter: currencyformat).keyboardType(.decimalPad)
                            .accessibilityLabel("fixedcost, textfield")
                    }
                    
                    Section(header: Text("Variable Cost per Unit").foregroundColor(.black)){
                        TextField("", value: $variablecostunit, formatter: currencyformat).keyboardType(.decimalPad)
                            .accessibilityLabel("Variable Cost per Unit, Textfield")
                    }
                    Section(header: Text("Price per Unit").foregroundColor(.black)){
                        TextField("", value: $priceperunit, formatter: currencyformat).keyboardType(.decimalPad)
                            .accessibilityLabel("Price per Unit, Textfield")
                    }
                    
                    //                    Section(header: Text("Fixed Cost")){
                    //                        TextField("", text: $fixedcostunit).keyboardType(.decimalPad)
                    //                    }
                    //                    Section(header: Text("Variable Cost per Unit")){
                    //                        TextField("", text: $variablecostunit).keyboardType(.decimalPad)
                    //                    }
                    //                    Section(header: Text("Price per Unit")){
                    //                        TextField("", text: $priceperunit).keyboardType(.decimalPad)
                    //                    }
                    Button(action: {
                        total = fixedcostunit / (priceperunit - variablecostunit)
                        print(total)
                        //                        print(fixedcostunit)
                        //                        print(variablecostunit)
                        //                        print(priceperunit)
                        
                    }
                           , label: {
                        Text("Calculate")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                    })
                        .listRowBackground(Color.blue)
                    
                    Section(header: Text("Unit Result").foregroundColor(.black)){
                        Text (String(format:"%g", total))
                            .fontWeight(.bold)
                            .accessibilityLabel("Unit Result, Text")
                    }

                }
            }.navigationTitle("BEP Unit")
        }
    }
    
}

struct UnitView_Previews: PreviewProvider {
    static var previews: some View {
        UnitView()
    }
}
