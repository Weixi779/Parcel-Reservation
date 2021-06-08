//
//  AddSheetView.swift
//  Parcel Reservation
//
//  Created by 孙世伟 on 2020/11/19.
//

import SwiftUI

struct AddSheetView: View {
    @State var company = ""
    @State var code = ""
    @State var date = Date()
    @State var showingAlert = false
    
    @EnvironmentObject var courierItems: CourierItems
    @Binding var showingSheet: Bool

    static let SectionCourierCompany = ["中通","顺风","圆通","邮政","韵达","申通"]
    
    var body: some View {
        NavigationView{
                Form{
                    Section(header: Text("快递信息")){
                        Picker("快递公司" , selection: $company){
                            ForEach(Self.SectionCourierCompany,id:\.self){
                                Text($0)
                            }
                        }
                        
                        TextField("取货码", text: $code)
                            .keyboardType(.numbersAndPunctuation)
                        
                    }
                    
                    Section(header: Text("取件详情")){
                        DatePicker("取件日期", selection: $date)
                    }
                    
                    Section{
                        Button("保存快递信息"){
                            showingAlert = IsEmpty()
                            if(showingAlert == false){
                                courierItems.AddCourier(company, date, code, dateConverted(date))
                                showingSheet.toggle()
                            }
                        }
                    }
                }
            .navigationBarTitle("来拿快递啦")
            .navigationBarItems(trailing: Button("保存"){
                showingAlert = IsEmpty()
                if(showingAlert == false){
                    courierItems.AddCourier(company, date, code, dateConverted(date))
                    showingSheet.toggle()
                }
            })
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("信息确认"), message: Text("请填写具体数据"), dismissButton: .default(Text("好的")))
            }
            
        }
    }
    func IsEmpty() -> Bool {
        if company == "" || code == "" {
            return true
        }
        return false
    }
    
}
func dateConverted(_ date:Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM-dd HH:mm"
    let convertedDate = dateFormatter.string(from: date)
    return convertedDate
}
