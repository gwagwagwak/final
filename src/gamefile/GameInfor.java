package gamefile;

import java.io.*;

public class GameInfor implements GameInfo {
    @Override
    public void create(String src){

        try {
//            File fileDir = new File("C:/Users/KGITBANK/IdeaProjects/Project/src/gamefile/"+src+".txt");
            File fileDir = new File("D:/PROJECT_GAMERANK/"+src+".txt");

            BufferedReader in = new BufferedReader(
                    new InputStreamReader(
                            new FileInputStream(fileDir), "UTF-8"));

            String str;

            while ((str = in.readLine()) != null) {
                this.infoarr.add(str);
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

    @Override
    public void clear() {
        this.infoarr.clear();
    }
}
