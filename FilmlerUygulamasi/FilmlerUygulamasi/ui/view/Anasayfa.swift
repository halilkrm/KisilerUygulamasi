//
//  Anasayfa.swift
//  FilmlerUygulamasi
//
//  Created by Halil Keremoğlu on 2.04.2025.
//

import SwiftUI

struct Anasayfa: View {
    @ObservedObject var viewModel = AnaSayfaViewModel()
    

    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.kategorilerListesi){ kategori in
                    NavigationLink(destination: FilmSayfa(kategori: kategori)){
                        KategoriItem(kategori: kategori)
                    }
                   
                }
            }.navigationTitle("Kategoriler")
                .onAppear{
                    veritabanıKopyala()
                    viewModel.kategorileriYukle()
                }
        }
    }
    
    func veritabanıKopyala(){
        let bundle = Bundle.main.path(forResource: "filmler", ofType: ".sqlite")
        
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! //bilgisayardaki masaüstü klasörü gibi
        
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("filmler .sqlite")
        
        let fm = FileManager.default
        
        if fm.fileExists(atPath: hedefYol.path){
            print("Veritabanı daha önce kopyalandı")
        }
        else{
            do{
                try fm.copyItem(atPath: bundle!, toPath: hedefYol.path)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    Anasayfa()
}
