import java.io.File;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XMLTest2 {
	public static void PrintNode(Node n) {
		//Node의 자식 노드들을 전부 출력하는 기능
		NodeList list = n.getChildNodes();
		for(int i=0;i<list.getLength();i++) {
			Node t = list.item(i);
			if(t.getNodeType() == Node.ELEMENT_NODE) {
				if(t.getChildNodes().getLength() > 1) {
					PrintNode(t);
				}else {
					System.out.println(t.getNodeName()+" : "+t.getTextContent());
				}
				
			}
		}
		System.out.println();
	}

	public static void main(String[] args) throws Exception {
			
		File file = new File("test.xml");
		//System.out.println(file.exists());
		DocumentBuilderFactory f = DocumentBuilderFactory.newDefaultInstance();
		DocumentBuilder dBuilder = f.newDocumentBuilder();
		Document doc = dBuilder.parse(file);
		doc.getDocumentElement().normalize();
		
		String root = doc.getDocumentElement().getNodeName();
		System.out.println("root: " + root+"\n");
		
		NodeList list = doc.getElementsByTagName(root); //company 선택
		
		PrintNode(list.item(0));
	}

}
