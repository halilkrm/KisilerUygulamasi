//
//  DetaySayfa.swift
//  FilmlerUygulamasi
//
//  Created by Halil Keremoğlu on 2.04.2025.
//

import SwiftUI

struct DetaySayfa: View {
    var film = Filmler()
    
    var body: some View {
        VStack(spacing: 50){
            AsyncImage(url:  URL(string: "http://kasimadalan.pe.hu/filmler/resimler/\(film.film_resim!)"))
            Text(film.yonetmen!.yonetmen_adi!).font(.system(size: 30))
            Text(String(film.film_yil!)).font(.system(size: 50)).foregroundStyle(.blue)
            
            Button("Sepete Eklendi"){
                print("Detay Sayfa: \(film.film_ad!) filmi sepete eklendi")
            }.foregroundStyle(.white)
                .frame(width: 250,height: 50)
                .background(.indigo)
                .cornerRadius(10)
        }.navigationTitle(film.film_ad!)
    }
}

/*#Preview {
    DetaySayfa()
}*/
