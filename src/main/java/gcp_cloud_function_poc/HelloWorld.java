package gcp_cloud_function_poc;

import java.io.BufferedWriter;

import com.google.cloud.functions.HttpFunction;
import com.google.cloud.functions.HttpRequest;
import com.google.cloud.functions.HttpResponse;

public class HelloWorld implements HttpFunction {

  @Override
  public void service(HttpRequest request, HttpResponse response) throws Exception {
    
    BufferedWriter writer = response.getWriter();
    writer.write("Hello World!");
  }
}
