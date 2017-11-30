package Controller;

import net.sourceforge.*;
import net.sourceforge.jFuzzyLogic.FIS;
import net.sourceforge.jFuzzyLogic.rule.Rule;

public class Zzz {
	
	public static void main(String[] args) throws Exception{
		
		FIS fis = FIS.load("tipper.fcl", true);
		fis.setVariable("age", 1);
		fis.setVariable("jobclass", 8);
		fis.evaluate();
		
		System.out.println("Output value :"+fis.getVariable("package").getValue());
		
		Double value = fis.getVariable("package").getValue();
		
		System.out.println("tEST value ="+value);
		
		for(Rule r : fis.getFunctionBlock("tipper").getFuzzyRuleBlock("No1").getRules())
			System.out.println(r);
	}

}
