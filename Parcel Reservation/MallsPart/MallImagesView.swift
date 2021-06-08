//
//  MallImages.swift
//  Parcel Reservation
//
//  Created by 孙世伟 on 2020/11/22.
//

import SwiftUI

struct MallImagesView: View {
    let LineWidth: CGFloat = 4
    let CornerRadius: CGFloat = 20
    @ObservedObject var MallImages:  Commodity
    var columns : [GridItem] = [
        GridItem(.flexible(),spacing: 2),
        GridItem(.flexible(),spacing: 5)
    ]
    var body: some View {
 
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(MallImages.commoditys){ image in
                        ImagesCellView(MallImages: image)
                    }
                    .padding([.horizontal,.top])
                }
            }
        

    }
}

struct ImagesCellView: View {
    
    var MallImages : commodity
    
    var body: some View {
        ZStack {
            VStack {
                Image(MallImages.imageString)
                    .resizable()
                    .frame(height: 150)
                Spacer(minLength: 0)
                ZStack {
                    Color.white
                        .frame(height: 40)
                    VStack(alignment: .leading) {
                        HStack {
                            Text(MallImages.imageString)
                        }
                        .padding([.horizontal])
                        Spacer(minLength: 0)
                        HStack {
                            Image("coins")
                                .resizable()
                                .frame(width: 15, height: 15)
                            Text("\(MallImages.pointCast)")
                            Spacer()
                        }
                        .padding([.horizontal])
                    }
                }

            }

        }
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.bottom)

    }

}
struct MallImages_Previews: PreviewProvider {
    static var previews: some View {
        MallImagesView(MallImages: Commodity())
    }
}
