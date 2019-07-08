package gamefile;

import java.io.FileNotFoundException;
import java.util.ArrayList;

interface GameInfo {
	public ArrayList<String> namearr = new ArrayList<>(); 
	public ArrayList<String> imgarr = new ArrayList<>(); 
	public ArrayList<String> stararr = new ArrayList<>();
	public ArrayList<String> infoarr = new ArrayList<>();
	abstract void create(String src) throws FileNotFoundException;
	abstract void clear();
}

