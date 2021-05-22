//
//  MallsView.swift
//  Parcel Reservation
//
//  Created by 孙世伟 on 2020/11/19.
//

import SwiftUI

struct MallsView: View {
    
    @State var test: String = ""
    @ObservedObject var Images = Commodity()
    var body: some View {
        VStack {
            VStack{
                TopHead(90)
                HStack{
                    HStack{
                        Image("search_icon")
                            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                        TextField("查找商品", text: $test)
                            .font(Font.system(size: 14))
                            .foregroundColor(Color.gray)
                            .onChange(of: self.test) { value in
                                if value != "" {
                                    Images.filterCommoditys(value)
                                } else {
                                    Images.resetCommoditys()
                                }
                            }
                        if self.test != ""{
                            xmarkButton()
                        }
                        Spacer()
                    }
                    .background(
                        Color.white
                            .cornerRadius(5)
                    )
                    .frame(height: 50)
                    Image("scan_icon")
                        .padding(.leading, 20)
                        .padding(.trailing, 10)
                }
                .padding(.leading, 20)
                .background(GiveMeBackgroundColor())
                .padding(.top, -56)
            }
            MallImagesView(MallImages: Images)
            Spacer()
        }
        
    }
    
    func xmarkButton() -> some View {
        Button {
            self.test = ""
        } label: {
            Image(systemName: "xmark").foregroundColor(.black)
        }
    }
}

struct MallsView_Previews: PreviewProvider {
    static var previews: some View {
        MallsView()
    }
}
