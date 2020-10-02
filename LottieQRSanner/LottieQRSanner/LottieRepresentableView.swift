//
//  LottiePreviewView.swift
//  LottieQRSanner
//
//  Created by PC Gamer on 02/10/20.
//

import SwiftUI
import Lottie

struct LottieRepresentableView: UIViewRepresentable {
    
    var strLottieURL: String

    typealias UIViewType = UIView
    
    func makeUIView(context: UIViewRepresentableContext<LottieRepresentableView>) -> UIView {
        let view = UIView(frame: CGRect.zero)
        let animationView = AnimationView()
        let _ = Animation.loadedFrom(url: URL(string: strLottieURL)!, closure: { (animation) in
                if let animation = animation {
                    animationView.animation = animation
                    animationView.contentMode = .scaleAspectFit
                    animationView.loopMode = .loop
                    animationView.play()
                    
                    animationView.translatesAutoresizingMaskIntoConstraints = false
                    view.addSubview(animationView)
                    
                    //Adding Constraints
                    let heightConstraint = animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
                    let widthConstraint = animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
                    NSLayoutConstraint.activate([heightConstraint,widthConstraint]
                    )
                }
        }, animationCache: nil)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieRepresentableView>) {
        
    }
}
