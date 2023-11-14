package testRunner;

import org.junit.runner.RunWith;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

@RunWith(Cucumber.class)
@CucumberOptions(
		features="C:\\Users\\falco\\eclipse-workspace\\testeoprueba\\src\\test\\resources\\features\\testcaseUser1.feature",
		glue={"/testeoprueba/src/test/java/stepDefinition"},
		plugin =  {"pretty","html:target/cucumber-reports"},
		monochrome = true,
		strict = true,
		dryRun = false
		)

public class TestRunnerCaseUser1 {

}
