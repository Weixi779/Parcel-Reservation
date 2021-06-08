//
//  CourierCell.swift
//  Courier
//
//  Created by 孙世伟 on 2020/10/8.
//

import SwiftUI

struct CourierCell: View {
    @ObservedObject var items:CourierItems
    
    @State var isShowing = false
    
    var body: some View {
        VStack {
            List{
                Section{
                    ForEach(items.couriers) { courier in
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text(courier.PickCode)
                                    .bold()
                                    .font(.title3)
                                    .padding(.top, 4)
                                Text(courier.CourierCompany)
                                    .foregroundColor(Color.gray)
                                    .padding(.bottom, 5)
                            }
                            
                            Spacer()
                            
                            Text(courier.CellDate)
                                .foregroundColor(Color.gray)
                            
                            Image(systemName: "arrow.right")
                                .foregroundColor(Color(themeData.Color4))
                                .imageScale(.large)
                        }
                        .padding(.leading)
                        .onTapGesture { isShowing.toggle() }
                        .sheet(isPresented: $isShowing) {
                            DetailCell(item: courier)
                        }
                    }
                    .onDelete(perform: removeItems)
                }
            }
        }
        
    }
    func removeItems(at offsets: IndexSet){
        items.couriers.remove(atOffsets: offsets)
    }
}

struct CourierCell_Previews: PreviewProvider {
    static var previews: some View {
        CourierCell(items: CourierItems())
    }
}
