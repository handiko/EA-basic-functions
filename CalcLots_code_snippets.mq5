double calcLots(double slPoints) {
     double risk = AccountInfoDouble(ACCOUNT_BALANCE) * RiskPercent / 100;

     double ticksize = SymbolInfoDouble(Pair, SYMBOL_TRADE_TICK_SIZE);
     double tickvalue = SymbolInfoDouble(Pair, SYMBOL_TRADE_TICK_VALUE);
     double lotstep = SymbolInfoDouble(Pair, SYMBOL_VOLUME_STEP);

     double moneyPerLotstep = slPoints / ticksize * tickvalue * lotstep;
     double lots = MathFloor(risk / moneyPerLotstep) * lotstep;

     lots = MathMin(lots, SymbolInfoDouble(Pair, SYMBOL_VOLUME_MAX));
     lots = MathMax(lots, SymbolInfoDouble(Pair, SYMBOL_VOLUME_MIN));

     return lots;
}
