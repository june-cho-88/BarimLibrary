public struct BarimLibrary {
    public init() {}
    
    public func getAddress() throws -> String {
        do {
            let privateKey: PrivateKey = .init()
            let publicKey: PublicKey = .init(privateKey: privateKey)
            let legacyAddress: LegacyAddress = try .init(publicKey: publicKey, scriptFormat: .p2pkh)
            let cashAddress: CashAddress = .init(legacy: legacyAddress, network: .mainnet)
            
            return cashAddress.string
        } catch {
            throw AddressError.failed(error: error)
        }
    }
    
    public func getAddress(with seed: String) throws -> String {
        do {
            let privateKey: PrivateKey = try .init(seedString: seed)
            let publicKey: PublicKey = .init(privateKey: privateKey)
            let legacyAddress: LegacyAddress = try .init(publicKey: publicKey, scriptFormat: .p2pkh)
            let cashAddress: CashAddress = .init(legacy: legacyAddress, network: .mainnet)
            
            return cashAddress.string
        } catch {
            throw AddressError.failed(error: error)
        }
    }
    
    func getAddress(from privateKey: PrivateKey) throws -> String {
        do {
            let publicKey: PublicKey = .init(privateKey: privateKey)
            let legacyAddress: LegacyAddress = try .init(publicKey: publicKey, scriptFormat: .p2pkh)
            let cashAddress: CashAddress = .init(legacy: legacyAddress, network: .mainnet)
            
            return cashAddress.string
        } catch {
            throw AddressError.failed(error: error)
        }
    }
    
    func getAddress(from publicKey: PublicKey) throws -> String {
        do {
            let legacyAddress: LegacyAddress = try .init(publicKey: publicKey, scriptFormat: .p2pkh)
            let cashAddress: CashAddress = .init(legacy: legacyAddress, network: .mainnet)
            
            return cashAddress.string
        } catch {
            throw AddressError.failed(error: error)
        }
    }
    
    func getAddress(from legacyAddress: LegacyAddress) throws -> String {
        let cashAddress: CashAddress = .init(legacy: legacyAddress, network: .mainnet)
        return cashAddress.string
    }
}
