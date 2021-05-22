//
//  DetailCell.swift
//  Courier
//
//  Created by 孙世伟 on 2020/10/23.
//

import SwiftUI
import MapKit

struct MapPins : Identifiable {
    var id: Int
    var pin: MapPin
}
class Pins: ObservableObject{
    @Published var mappins: [MapPins] = []
    init() {
        let pin = MapPin(coordinate: .init(latitude: 39.090048, longitude: 117.710062))
        self.mappins.append(MapPins(id: self.mappins.count, pin: pin))
    }
}
struct DetailCell: View {
    
    @EnvironmentObject var courierItems: CourierItems
    
    @ObservedObject var pins = Pins()
    @State var region = MKCoordinateRegion(center: .init(latitude: 39.088000, longitude: 117.710062), latitudinalMeters: 750, longitudinalMeters: 750)
    
    var item: Courier
    
    var body: some View {
        ZStack {
            VStack{
                Map(coordinateRegion: $region, annotationItems: self.pins.mappins){ pin in
                    pin.pin
                }
                .frame(height:200)
                
                Circle_Image
                    .padding(.top,-130)
                
                VStack{
                    VStack(alignment: .leading){
                        Text("快递信息")
                            .font(.title)
                        HStack{
                            Text("快递公司:")
                                .font(.subheadline)
                            Spacer()
                            Text("\(item.CourierCompany)")
                                .font(.subheadline)
                        }
                        Divider()
                        HStack{
                            Text("快递单号:")
                                .font(.subheadline)
                            Spacer()
                            Text("SF1093737794534")
                                .font(.subheadline)
                        }
                        Divider()
                        HStack{
                            Text("收件人名称:")
                                .font(.subheadline)
                            Spacer()
                            Text("name")
                                .font(.subheadline)
                        }
                        Divider()
                        
                        HStack{
                            Text("取件码:")
                                .font(.subheadline)
                            Spacer()
                            Text("\(item.PickCode)")
                                .font(.subheadline)
                        }
                        Divider()
                        
                    }
                    VStack(alignment: .leading){
                        Text("取件信息")
                            .font(.title)
                        HStack{
                            Text("预约时间:")
                                .font(.subheadline)
                            Spacer()
                            Text("\(item.CellDate)")
                                .font(.subheadline)
                        }
                        Divider()
                        HStack{
                            Text("负责人姓名:")
                                .font(.subheadline)
                            Spacer()
                            Text("xxx")
                                .font(.subheadline)
                        }
                        Divider()
                        
                        HStack{
                            Text("负责人电话:")
                                .font(.subheadline)
                            Spacer()
                            Text("123")
                                .font(.subheadline)
                        }
                        Divider()
                        
                    }
                }
                .padding()
                Spacer()
            }
            Spacer()
            
        }
    }
    var Circle_Image: some View{
        Image("CourierPoint")
            .resizable()
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 1))
            .shadow(radius: 3)
    }
}
struct DetailCell_Previews: PreviewProvider {
    static var previews: some View {
        DetailCell(item: CourierItems().couriers[0])
    }
}
