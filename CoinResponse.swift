import Foundation

struct CoinResponse: Decodable {
    let status: String
    let data: CoinData
}
