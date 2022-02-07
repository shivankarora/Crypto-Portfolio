import Foundation
import Combine

class CoinListViewModel: ObservableObject {
    @Published var coins = [CoinViewMode]()
    
    private let coinSevice = CoinSevice()
    
    var cancellable: AnyCancellable?
    
    func getCoins() {
        guard let getCoins = coinSevice.getCoins() else {
            print("no data")
            return
        }
        
        cancellable = getCoins.sink(receiveCompletion: {err in
            print(err)
        }) { coinRes in
            self.coins = coinRes.data.coins.map { CoinViewModel($0)}
        }
            
    }
}