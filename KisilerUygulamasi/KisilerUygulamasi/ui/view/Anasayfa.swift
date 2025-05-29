



import SwiftUI

struct Anasayfa: View {
    @State private var aramaKelimesi = ""
    
    @ObservedObject var viewModel = AnaSayfaViewModel()
    
    func sil(at offsets:IndexSet){
        let kisi = viewModel.kisilerListesi[offsets.first!]
        viewModel.sil(kisi_id: Int(kisi.kisi_id!)!)
    }
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.kisilerListesi){ kisi in
                    NavigationLink(destination: KisiDetaySayfa(kisi: kisi)){
                        KisilerSatir(kisi: kisi)
                    }
                }.onDelete(perform: sil)
            }.navigationTitle("Kişiler")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        NavigationLink(destination: KisiKayitSayfa()){
                            Image(systemName: "plus")
                        }
                    }
                }.onAppear{
                    viewModel.kisileriYukle()
                    print("Anasayfaya dönüldü")
                }
        }.searchable(text: $aramaKelimesi, prompt: "Ara")
            .onChange(of: aramaKelimesi){ s in
                viewModel.ara(aramaKelimesi: s)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Anasayfa()
    }
}





    
   /* func veritabaniKopyala(){
        let bundle = Bundle.main.path(forResource: "rehbar", ofType: ".sqlite")
        
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("rehbar.sqlite")
        
        let fm = FileManager.default
        
        if fm.fileExists(atPath: hedefYol.path){
            print("Veri tabanı daha önce kopyalandı")
        }else{
            do{
                try fm.copyItem(atPath: bundle!, toPath: hedefYol.path)
            }catch{
                print(error.localizedDescription)
            }
        }
    } */


