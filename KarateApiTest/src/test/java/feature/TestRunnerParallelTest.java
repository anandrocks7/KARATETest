package feature;

import static org.junit.Assert.assertTrue;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.apache.commons.io.FileUtils;
import org.junit.Test;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;


public class TestRunnerParallelTest {


  @Test
  public void testParallel() {
    // System.setProperty("karate.env", "demo"); // ensure reset if other tests (e.g. mock) had set env in CI
    Results results = Runner.path("classpath:feature").tags("~@ignore").parallel(2); // Here feature is the package name
    //Ignore a feature file by mentioning ignore tag i feature file like i mentioned in "ReadnCall feature file"
    
    generateReport(results.getReportDir());
    
    System.out.println("Directory---" + results.getReportDir());
    assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
  }

  public static void generateReport(String karateOutputPath) {
    Collection<File> jsonFiles =
        FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
    List<String> jsonPaths = new ArrayList<String>(jsonFiles.size());
    jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
    Configuration config = new Configuration(new File("target"), "feature");
    ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
    reportBuilder.generateReports();
  }


}
