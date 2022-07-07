//
//  BackgroundKolodaAnimator.swift
//  Koloda
//
//  Created by Eugene Andreyev on 4/2/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import Koloda

class BackgroundKolodaAnimator: KolodaViewAnimator {
    
    override func applyScaleAnimation(_ card: DraggableCardView, scale: CGSize, frame: CGRect, duration: TimeInterval, completion: AnimationCompletionBlock) {

        let animator = UIViewPropertyAnimator(duration: duration, dampingRatio: 0.7) {
            card.transform = .init(scaleX: scale.width, y: scale.height)
            card.frame = frame
        }

        if let completion = completion {
            animator.addCompletion { position in
                completion(position == .end)
            }
        }
        animator.startAnimation()
    }
    
}
