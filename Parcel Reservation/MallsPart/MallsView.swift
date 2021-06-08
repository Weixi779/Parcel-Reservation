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
    
    @State var isShowingCamera = false
    @State private var selectedImage: UIImage?
    var body: some View {
        VStack {
            TopHead(90)
            HStack{
                HStack{
                    Image("search_icon")
                        .foregroundColor(Color.gray)
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
                Button(action: { isShowingCamera.toggle() }){
                    Image(systemName: "qrcode.viewfinder")
                        .foregroundColor(Color(themeData.Color4))
                        .padding([.horizontal])
                }

            }
            .padding(.leading, 20)
            .background(Color(themeData.Color2))
            .padding(.top,-50)
            Spacer(minLength: 0)
            MallImagesView(MallImages: Images)
        }
        .sheet(isPresented: $isShowingCamera) {
            ImagePickerView(selectedImage: $selectedImage, sourceType: .camera)
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
