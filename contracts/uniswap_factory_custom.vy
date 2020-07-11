interface Exchange():
    def setup(token_addr: address, token_id: uint256): modifying

exchangeTemplate: public(address)
tokenCount: public(uint256)
token_to_exchange: address[uint256]
exchange_to_token: address[address]
id_to_token: address[uint256]

@public
def initializeFactory(template: address):
    assert self.exchangeTemplate == ZERO_ADDRESS
    assert template != ZERO_ADDRESS
    self.exchangeTemplate = template

@public
def createExchange(token: address) -> address:
    assert token != ZERO_ADDRESS
    assert self.exchangeTemplate != ZERO_ADDRESS
    # assert self.token_to_exchange[token] == ZERO_ADDRESS
    exchange: address = create_with_code_of(self.exchangeTemplate)
    Exchange(exchange).setup(token, self.tokenCount)
    self.token_to_exchange[self.tokenCount] = exchange        # Change to index by uint256 instead of token address
    self.exchange_to_token[exchange] = token
    token_id: uint256 = self.tokenCount + 1
    self.tokenCount = token_id
    self.id_to_token[token_id] = token
    return exchange

@public
@constant
def getExchange(token: uint256) -> address:
    return self.token_to_exchange[token]

@public
@constant
def getToken(exchange: address) -> address:
    return self.exchange_to_token[exchange]

@public
@constant
def getTokenWithId(token_id: uint256) -> address:
    return self.id_to_token[token_id]
