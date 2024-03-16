//
//  ContentView.swift
//  UnitConversions
//
//  Created by Hitesh Madaan on 03/03/24.
//

import SwiftUI

struct ContentView: View {
    
    let tempScales=["°C","°F","K"]
    @State private var TempValue:Double=0.0
    @State private var selectedScale1="°C"
    @State private var selectedScale2="°C"
    @FocusState private var isFocused:Bool
    
    var result:Double{
        let value=TempValue
        if(selectedScale1==selectedScale2){
            return value
        }
        else if(selectedScale1=="°C"&&selectedScale2=="°F"){
            return value * 9 / 5 + 32
        }
        else if(selectedScale1=="°C"&&selectedScale2=="K"){
            return value + 273.15
        }
        else if(selectedScale1=="°F"&&selectedScale2=="°C"){
            return (value - 32) * 5 / 9
        }
        else if(selectedScale1=="°F"&&selectedScale2=="K"){
            return (value - 32) * 5 / 9 + 273.15
        }
        else if(selectedScale1=="K"&&selectedScale2=="°C"){
            return value - 273.15
        }
        else{
            return (value - 273.15) * 9 / 5 + 32
        }
        
    }
    
    
    var body: some View {
        NavigationStack{
            
            Form{
                Section("Temprature Conversions"){}
                Section("Select a unit"){
                    Picker("Select Scale",selection: $selectedScale1){
                        ForEach(tempScales,id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                
                }
                
                Section("Enter Value for conversion"){
                    TextField("Enter Value",value: $TempValue,format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                }
            
                
                Section("Converted TO"){
                    Picker("Select Scale",selection: $selectedScale2){
                        ForEach(tempScales,id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Result"){
                    Text(result,format: .number)
                    
                }
            }
            
            .navigationTitle("Unit Conversions")
            .toolbar{
                if isFocused {
                    Button("Done"){
                        isFocused=false
                    }
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
