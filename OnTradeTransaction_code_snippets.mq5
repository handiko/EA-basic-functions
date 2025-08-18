void OnTradeTransactionEvent(
     const MqlTradeTransaction&    trans,
     const MqlTradeRequest&        request,
     const MqlTradeResult&         result
) {

     if(trans.type == TRADE_TRANSACTION_ORDER_ADD) {
          COrderInfo order;
          if(order.Select(trans.order)) {
               if(order.Magic() == Magic) {
                    if(order.OrderType() == ORDER_TYPE_BUY_STOP) {
                    //or
                    //if(order.OrderType() == ORDER_TYPE_BUY_LIMIT) {
                         buyPos = order.Ticket();
                    } else if(order.OrderType() == ORDER_TYPE_SELL_STOP) {
                    //or
                    //} else if(order.OrderType() == ORDER_TYPE_SELL_LIMIT) {
                         sellPos = order.Ticket();
                    }
               }
          }
     }
}
