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
                    ForEach(items.couriers){ courier in
                        NavigationLink(destination: DetailCell(item: courier).environmentObject(items)) {
                            HStack{
                                VStack(alignment: .leading){
                                    Text(courier.CourierCompany)
                                        .bold()
                                        .padding(.top, 4)
                                    Text(courier.PickCode)
                                        .foregroundColor(Color.gray)
                                        .padding(.bottom, 5)
                                }
                                .padding(.leading,10)
                                
                                Spacer()
                                Text(courier.CellDate)
                                    .foregroundColor(Color.gray)
                                
                            }
                            .padding(.horizontal, 10)
                        }
                    }.onDelete(perform: removeItems)
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
