package Controller;

import net.sourceforge.jFuzzyLogic.FIS;
import net.sourceforge.jFuzzyLogic.rule.Rule;
import net.sourceforge.jFuzzyLogic.*;

/**
 * Test parsing an FCL file
 * @author pcingola@users.sourceforge.net
 */
public class TestTipper {
    public static void main(String[] args) throws Exception {
        // Load from 'FCL' file
        String fileName = "tipper.fcl";
        FIS fis = FIS.load(fileName,true);
        // Error while loading?
        if( fis == null ) { 
            System.err.println("Can't load file: '" 
                                   + fileName + "'");
            return;
        }else
        	System.out.println("File name"+fileName);

        // Show 
        fis.chart();

        // Set inputs
        fis.setVariable("age", 25);
		fis.setVariable("jobclass", 1);
		fis.setVariable("smokingstatus", 1);
		fis.setVariable("illness", 6);
		fis.setVariable("monthlypayment", 150);
		fis.setVariable("gender", 3);
				
		for(Rule r : fis.getFunctionBlock("tipper").getFuzzyRuleBlock("No1").getRules())
			System.out.println(r);
        // Evaluate
        fis.evaluate();

        // Show output variable's chart 
        fis.getVariable("package").chartDefuzzifier(true);

        // Print ruleSet
        //System.out.println(fis);
    }
}