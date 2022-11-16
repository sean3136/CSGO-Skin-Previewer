//
//  teamdata.swift
//  MOTOGP Guide
//
//  Created by 李炘杰 on 2022/10/23.
//

import Foundation
struct teamdata: Identifiable{
    let id = UUID()
    let img: String
    let name: String
    let color: String
}
extension teamdata {
    static var dt = teamdata(img: "Apriliaracing", name: "Aprilia Racing", color: "green")
}



