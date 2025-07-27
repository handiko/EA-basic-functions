void CandlePatternReversal::processPos(ulong & posTicket) {
     if(posTicket <= 0) return;
     if(OrderSelect(posTicket)) return;

     CPositionInfo pos;
     if(!pos.SelectByTicket(posTicket)) {
          posTicket = 0;
          return;
     } else {
          if(pos.PositionType() == POSITION_TYPE_BUY) {
              // do something
          } else if(pos.PositionType() == POSITION_TYPE_SELL) {
              // do something
          }
     }
}
