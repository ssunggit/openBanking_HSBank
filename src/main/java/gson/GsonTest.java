package gson;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class GsonTest {
	public static void main(String[] args) {
		
		Gson gson1 = new Gson();
		
		Gson gson2 = new GsonBuilder().create();
		Gson gson3 = new GsonBuilder().setPrettyPrinting().create();
		
	}
}


