//
//  KisiDetaySayfa.swift
//  KisilerUygulamasi
//
//  Created by Halil Keremoğlu on 28.03.2025.
//

import SwiftUI

struct KisiDetaySayfa: View {
    @State private var tfKisiAd = ""
    @State private var tfKisiTel = ""
    
    var kisi = Kisiler()
    
   // @Binding var kisilerListesi: [KisilerModel]
    
    
    var viewModel = KisiDetayViewModel()
    
    var body: some View {
        VStack(spacing: 100){
            TextField("Kişi Ad",text: $tfKisiAd)
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            TextField("Kişi Tel",text: $tfKisiTel)
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            Button("GÜNCELLE"){
                viewModel.guncelle(kisi_id: Int(kisi.kisi_id!)! ,kisi_ad:tfKisiAd, kisi_tel: tfKisiTel)
            }

        }.navigationTitle("Kişi Detay")
            .onAppear(){
                tfKisiAd = kisi.kisi_ad!
                tfKisiTel = kisi.kisi_tel!
                
            }
    }
}

/* #Preview {
    KisiDetaySayfa()
}*/
