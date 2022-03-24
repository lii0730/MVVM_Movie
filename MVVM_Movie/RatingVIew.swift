//
//  RatingVIew.swift
//  MVVM_Movie
//
//  Created by LeeHsss on 2022/03/24.
//

import SwiftUI

struct RatingVIew: View {
    
    @Binding var rating: Int?
    
    func starType(index: Int) -> String {
        if let rating = self.rating {
            return index <= rating ? "star.fill" : "star"
        } else {
            return "star"
        }
    }
    
    var body: some View {
        HStack {
            ForEach(1...10, id: \.self) { index in
                Image(systemName: starType(index: index))
                    .foregroundColor(.orange)
                    .onTapGesture {
                        self.rating = index
                    }
            }
        }
    }
}

struct RatingVIew_Previews: PreviewProvider {
    static var previews: some View {
        RatingVIew(rating: .constant(2))
    }
}
