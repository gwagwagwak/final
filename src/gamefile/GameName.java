package gamefile;

import java.io.*;
import java.util.Scanner;

public class GameName implements GameInfo {

	@Override
	public void create(String src) {
		// TODO Auto-generated method stub
		try {
//			File fileDir = new File("C:/Users/KGITBANK/IdeaProjects/Project/src/gamefile/"+src+".txt");
			File fileDir = new File("D:/PROJECT_GAMERANK/"+src+".txt");

			BufferedReader in = new BufferedReader(
					new InputStreamReader(
							new FileInputStream(fileDir), "euc-kr"));

			String str;

			while ((str = in.readLine()) != null) {
				this.namearr.add(str);
			}

			in.close();
		}
		catch (UnsupportedEncodingException e)
		{
			System.out.println(e.getMessage());
		}
		catch (IOException e)
		{
			System.out.println(e.getMessage());
		}
		catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
	public void clear()
	{
		this.namearr.clear();
	}

}
