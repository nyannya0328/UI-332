//
//  BlureView.swift
//  UI-332 (iOS)
//
//  Created by nyannyan0328 on 2021/10/17.
//

import SwiftUI

struct BlureView: UIViewRepresentable {
    let style : UIBlurEffect.Style
    func makeUIView(context: Context) -> UIVisualEffectView {
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        
        return view
        
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}

