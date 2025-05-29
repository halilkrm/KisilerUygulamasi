//
//  KisilerSatir.swift
//  KisilerUygulamasi
//
//  Created by Halil Keremoğlu on 28.03.2025.
//

import SwiftUI

struct KisilerSatir: View {
    var kisi = Kisiler()
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            Text(kisi.kisi_ad!).font(.system(size: 25))
            Text(kisi.kisi_tel!).font(.system(size: 25)).foregroundStyle(.gray)
        }
    }
}

/*#Preview {
    KisilerSatir()
}*/
