const MartianMarket = artifacts.require("MartianMarket");

contract("Martian land token", accounts => {
  it("Token metadata should be correct", async () => {
    let contract = await MartianMarket.deployed();
    let name = await contract.name();
    let symbol = await contract.symbol();
    assert.equal(name, "MartianMarket");
    assert.equal(symbol, "MARS");
  });
});
