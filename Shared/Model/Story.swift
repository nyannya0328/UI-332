//
//  Story.swift
//  UI-332 (iOS)
//
//  Created by nyannyan0328 on 2021/10/17.
//

import SwiftUI

struct Story: Identifiable {
    var id = UUID().uuidString
    var image : String
    var title : String
}

var stories = [
    Story(image: "Pic1", title: "Nlack Castel"),
    Story(image: "Pic2", title: "The dreaming moon"),
    Story(image: "Pic3", title: "Fall in love"),
    Story(image: "Pic4", title: "Hounted Ground"),
    

]
