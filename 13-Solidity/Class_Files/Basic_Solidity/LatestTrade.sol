pragma solidity ^0.5.0;

contract LatestTrade {
   string coin = "BTC";
   uint price;
   bool is_buy_order;

   function updateTrade(string memory newCoin, uint newPrice, bool is_buy) public {
       coin = newCoin;
       price = newPrice;
       is_buy_order = is_buy; /// is this a buy or a sell order?
   }

   function getLatestTrade() public returns (string memory, uint, bool) {
        return (coin, price, is_buy_order);
    }
}