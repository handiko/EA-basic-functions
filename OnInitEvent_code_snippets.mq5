int OnInitEvent() {
     if(!SymbolSelect(Pair, true)) {
          Print(__FUNCTION__, " > EA Failed to select symbol ", Pair, " ...");
          return(INIT_FAILED);
     }
     trade.SetExpertMagicNumber(Magic);
     if(!trade.SetTypeFillingBySymbol(Pair)) {
          trade.SetTypeFilling(ORDER_FILLING_RETURN);
     }
     static bool isInit = false;
     if(!isInit) {
          isInit = true;
          Print(__FUNCTION__, " > EA (re)start...");
          //Print(__FUNCTION__, " > EA version ", VERSION, "...");
          for(int i = PositionsTotal() - 1; i >= 0; i--) {
               CPositionInfo pos;
               if(pos.SelectByIndex(i)) {
                    if(pos.Magic() != Magic) continue;
                    if(pos.Symbol() != Pair) continue;
                    Print(__FUNCTION__, " > Found open position with ticket #", pos.Ticket(), "...");
                    if(pos.PositionType() == POSITION_TYPE_BUY) buyPos = pos.Ticket();
                    if(pos.PositionType() == POSITION_TYPE_SELL) sellPos = pos.Ticket();
               }
          }
          for(int i = OrdersTotal() - 1; i >= 0; i--) {
               COrderInfo order;
               if(order.SelectByIndex(i)) {
                    if(order.Magic() != Magic) continue;
                    if(order.Symbol() != Pair) continue;
                    Print(__FUNCTION__, " > Found pending order with ticket #", order.Ticket(), "...");
                    if(order.OrderType() == ORDER_TYPE_BUY_STOP) buyPos = order.Ticket();
                    if(order.OrderType() == ORDER_TYPE_SELL_STOP) sellPos = order.Ticket();
               }
          }
     }

     return(INIT_SUCCEEDED);
}
