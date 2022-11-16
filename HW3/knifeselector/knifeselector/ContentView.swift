//
//  ContentView.swift
//  knifeselector
//
//  Created by 李炘杰 on 2022/11/16.
//

import SwiftUI

struct ContentView: View {
    @State private var size: Double = 1
    @State var isReverse: Bool = false
    @State private var degree: Double = 0
    @State private var selectKnife = 0
    @State private var selectGlove = 0
    @State private var selectObject = 0
    @State private var selectSkin = 0
    @State private var object = ["Knife", "Glove"]
    @State private var objectType = ["Bayonet", "M9 Bayonet", "Ursus Knife", "Talon Knife", "Karambit", "Skeleton Knife", "Paracord Knife", "Butterfly Knife", "Survival Knife", "Gut Knife", "Bowie Knife","Navaja Knife", "Stiletto Knife", "Nomad Knife", "Classic Knife", "Falchion Knife", "Flip Knife", "Huntsman Knife", "Shadow Daggers"]
    @State private var knifeType = ["Bayonet", "M9 Bayonet", "Ursus Knife", "Talon Knife", "Karambit", "Skeleton Knife", "Paracord Knife", "Butterfly Knife", "Survival Knife", "Gut Knife", "Bowie Knife","Navaja Knife", "Stiletto Knife", "Nomad Knife", "Classic Knife", "Falchion Knife", "Flip Knife", "Huntsman Knife", "Shadow Daggers"]
    @State private var gloveType = ["Hand Wraps", "Moto Gloves", "Specialist Gloves", "Sport Gloves", "Bloodhound Gloves", "Hydra Gloves", "Driver Gloves", "Default Gloves", "Broken Fang"]
    @State private var bayonet = ["Bayonet"]
    @State private var m9 = ["M9 Bayonet", "M9 Autotronic", "M9 Black Laminate", "M9 Blue Steel", "M9 Boreal Forest", "M9 Bright Water", "M9 Case Hardened", "M9 Crimson Web", "M9 Damascus Steel", "M9 Doppler", "M9 Fade", "M9 Forest DDPAT", "M9 Freehand", "M9 Gamma Doppler", "M9 Lore", "M9 Marble Fade", "M9 Night", "M9 Rust Coat", "M9 Safari Mesh", "M9 Scorched", "M9 Slaugghter", "M9 Stained", "M9 Tiger Tooth", "M9 Ultraviolet", "M9 Urban Masked"]
    @State private var ursus = ["Ursus Knife"]
    @State private var talon = ["Talon Knife"]
    @State private var karambit = ["Karambit"]
    @State private var skeleton = ["Skeleton Knife"]
    @State private var paracord = ["Paracord Knife"]
    @State private var butterfly = ["Butterfly Knife"]
    @State private var survival = ["Survival Knife"]
    @State private var gut = ["Gut Knife"]
    @State private var bowie = ["Bowie Knife"]
    @State private var navaja = ["Navaja", "Navaja Case Harden", "Navaja Crimson Web", "Navaja Fade", "Navaja Slaughter"]
    @State private var stiletto = ["Stiletto", "Stiletto Black Steel", "Stiletto Case Harden", "Stiletto Crimson Web", "Stiletto Damascus", "Stiletto Fade", "Stiletto Slaughter", "Stiletto Urban Masked"]
    @State private var nomad = ["Nomad Knife"]
    @State private var classic = ["Classic Knife"]
    @State private var falchioon = ["Falchion Knife"]
    @State private var flip = ["Flip Knife"]
    @State private var hunter = ["Huntsman Knife"]
    @State private var shadow = ["Shadow Daggers"]
    
    @State private var hand = ["Arboreal", "Badlands", "CAUTION!", "Cobalt Skulls", "Constrictor", "Desert Shamagh", "Duct Tape", "Giraffe", "Leather", "Overprint", "Slaughter", "Spruce DDPAT"]
    @State private var moto = ["3rd Commando Company", "Blood Pressure", "Boom!", "Cool Mint", "Eclipse", "Finish Line", "Polygon", "POW!", "Smoke Out", "Spearmint", "Transport", "Turtle"]
    @State private var specialist = ["Buckshot", "Crimson Kimono", "Crimson Web", "Emerald Web", "Fade", "Field Agent", "Forest DDPAT", "Foundation", "Lt. Commander", "Marble Fade", "Mogul", "Tiger Strike"]
    @State private var sport = ["Amphibious", "Arid", "Big Game", "Bronze Morph", "Hedge Maze", "Nocts", "Omega", "Pandora's Box", "Scarlets Shamagh", "Slingshot", "Superconductor", "Vice"]
    @State private var bloodhound = ["Bronzed", "Charred", "Guerrilla", "Snakebite"]
    @State private var hydra = ["Case Hardened", "Emerald", "Mangrove", "Rattler"]
    @State private var driver = ["Black Tie", "Convoy", "Crimson Weave", "Diamondback", "Imperial Plaid", "King Snake", "Lunar Weave", "Overtake", "Queen Jaguar", "Racing Green", "Rezan the Red", "Snow Leopard"]
    @State private var ddefault = ["Default CT Gloves", "Default T Gloves"]
    @State private var broken = ["Jade", "Needle Point", "Unhinged", "Yellow Banded"]
    
    
    @State var knifeArray = ["Bayonet"]
    
    @State var gloveArray = ["Arboreal", "Badlands", "CAUTION!", "Cobalt Skulls", "Constrictor", "Desert Shamagh", "Duct Tape", "Giraffe", "Leather", "Overprint", "Slaughter", "Spruce DDPAT"]
    
    @State var objectArray = ["Bayonet"]
    
    var body: some View {
        VStack {
            Picker(selection: $selectObject) {
                ForEach(0..<object.count, id:\.self){item in
                    Text("\(object[item])")
                }
            } label: {
                Text("Object")
            }
            .pickerStyle(.segmented)
            .onChange(of: selectObject, perform: { newValue in
                if(selectObject == 0) {
                    objectType = knifeType
                    objectArray = knifeArray
                }
                else {
                    objectType = gloveType
                    objectArray = gloveArray
                }
                selectSkin = 0;
                selectKnife = 0;
                selectGlove = 0;
            })
            
            Image(objectArray[selectSkin])
                .resizable()
                .scaledToFit()
                .frame(width: 350, height: 450)
                .padding()
                .scaleEffect(size)
                .rotationEffect(.degrees(degree))
                .rotation3DEffect(.degrees(isReverse ? 180 : 0), axis: (x: 0, y: 1, z: 0))
            
            VStack {
                HStack {
                    Text("Choose Your " + object[selectObject] + " :")
                    Picker(selection: $selectKnife) {
                        ForEach(0..<objectType.count, id:\.self){item in
                                Text("\(objectType[item])")
                        }
                    } label: {
                        Text("Knife")
                    }
                }
                .onChange(of: selectKnife, perform: { newValue in
                    if(selectObject == 0) {
                        switch(newValue) {
                        case 0: knifeArray = bayonet
                        case 1: knifeArray = m9
                        case 2: knifeArray = ursus
                        case 3: knifeArray = talon
                        case 4: knifeArray = karambit
                        case 5: knifeArray = skeleton
                        case 6: knifeArray = paracord
                        case 7: knifeArray = butterfly
                        case 8: knifeArray = survival
                        case 9: knifeArray = gut
                        case 10: knifeArray = bowie
                        case 11: knifeArray = navaja
                        case 12: knifeArray = stiletto
                        case 13: knifeArray = nomad
                        case 14: knifeArray = classic
                        case 15: knifeArray = falchioon
                        case 16: knifeArray = flip
                        case 17: knifeArray = hunter
                        case 18: knifeArray = shadow
                        default: knifeArray = []
                        }
                        objectArray = knifeArray
                    }
                    else {
                        switch(newValue) {
                        case 0: gloveArray = hand
                        case 1: gloveArray = moto
                        case 2: gloveArray = specialist
                        case 3: gloveArray = sport
                        case 4: gloveArray = bloodhound
                        case 5: gloveArray = hydra
                        case 6: gloveArray = driver
                        case 7: gloveArray = ddefault
                        case 8: gloveArray = broken
                        default: knifeArray = []
                        }
                        objectArray = gloveArray
                    }
                    selectSkin = 0;
                })
                HStack {
                    Text("Choose Your Skin :")
                    Picker(selection: $selectSkin) {
                        ForEach(0..<objectArray.count, id:\.self){item in
                            Text("\(objectArray[item])")
                        }
                    } label: {
                        Text("Knife")
                    }
                }
                HStack{
                    Text("Image Size")
                        .padding(.horizontal)
                    Slider(value:$size,in:0.1...3){
                        
                    } minimumValueLabel: {
                        Image(systemName: "0.square")
                    } maximumValueLabel: {
                        Image(systemName: "3.square")
                    }
                }
                HStack{
                    Text("Rotation")
                        .padding(.horizontal)
                    Slider(value:$degree,in:0.0...360.0){
                    } minimumValueLabel: {
                        Text("0°")
                    } maximumValueLabel: {
                        Text("360°")
                    }
                }
                Toggle("Reverse",isOn: $isReverse)
                    .padding(.horizontal)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
