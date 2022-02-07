import Foundation
import Foundation
import Combine

// https://data.messari.io/api/v1/assets?fields=id,slug,symbol,metrics/market_data/price_usd

final class CoinService {
    let url = URL(string:"https://data.messari.io/api/v1/assets?fields=id,slug,symbol,metrics/market_data/price_usd")
    
    
    func getCoins() -> AnyPublisher<CoinResponse, Error>? {
        guard let url = urlComonents.url else { return nil }
        
        print(url)
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: CoinResponse.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }