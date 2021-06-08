pragma solidity ^0.5.0;

contract TradeController{

    uint public previous_price;
    string public trade_type;

    function makeTrade(uint current_price, bool buy_anyway) public {
        if (current_price < previous_price || buy_anyway) {
                trade_type = "Buy";
                previous_price = current_price;
        }else if (current_price > previous_price) {
                trade_type = "Sell";
                previous_price = current_price;
        } else {
          trade_type = "Hold";
        }
    }
}
