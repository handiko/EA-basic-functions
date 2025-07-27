StrategyClass::StrategyClass(string pair, double lots, double riskPercent, int magic, param1...,
          param2..., param3..., ...) {
     Magic = magic;
     Pair = pair;
     Lots = NormalizeDouble(lots, 2);
     RiskPercent = riskPercent;

     /* Copy param1, ... etc to GlobalVars
     examples: 
     Param1 = param1;
     Param2 = param2;
     Param3 = param3;
     ....
     */

     // do something
     
     pairPoint = SymbolInfoDouble(Pair, SYMBOL_POINT);
     pairDigits = (int)SymbolInfoInteger(Pair, SYMBOL_DIGITS);
}
