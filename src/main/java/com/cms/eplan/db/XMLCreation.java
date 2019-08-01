package com.cms.eplan.db;


import java.io.*;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.*;
import javax.xml.transform.*;
import javax.xml.transform.dom.*;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.*;

public class XMLCreation extends javax.swing.JFrame {

	public Document document = null;
	public DocumentBuilderFactory documentFactory = null;
	public DocumentBuilder documentBuilder = null;
	public TransformerFactory transformerFactory = null;
	public Transformer transformer = null;

	public XMLCreation() {
		try {
			documentFactory = DocumentBuilderFactory.newInstance();
			documentBuilder = documentFactory.newDocumentBuilder();
			document = documentBuilder.newDocument();
			transformerFactory = TransformerFactory.newInstance();
			transformer = transformerFactory.newTransformer();
		} catch (ParserConfigurationException pce) {
			pce.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void XMlGeneration1223(List<XMLGenerationClass> xmlgcss) {
		
		//public static void main(String[] args) {
			
		//}
		
		//	List<XMLGenerationClass> xmlgcss=new ArrayList<XMLGenerationClass>();
			
			
			XMLGenerationClass  xgc=new XMLGenerationClass();
			xgc.setField_ID("3333");
			xgc.setFieldID_Name("sankar");
			xgc.setCondition("sdss");
			xgc.setAnd_OR("OR");
			
			
			
			XMLGenerationClass  xgc1=new XMLGenerationClass();
			xgc1.setField_ID("44444");
			xgc1.setFieldID_Name("dddd");
			xgc1.setCondition("errrr");
			xgc1.setAnd_OR("AND");
			
			

			XMLGenerationClass  xgc2=new XMLGenerationClass();
			xgc1.setField_ID("5555");
			xgc1.setFieldID_Name("ggggg");
			xgc1.setCondition("hhhhh");
			xgc1.setAnd_OR("OR");
			
			
			xmlgcss.add(xgc2);
			xmlgcss.add(xgc1);
			xmlgcss.add(xgc);
			
		
		try {
			DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
			Document doc = docBuilder.newDocument();
			Element rootElement = doc.createElement("conditions");
			doc.appendChild(rootElement);
			Element rule = doc.createElement("Rule");
			
			for(int i=0;i<xmlgcss.size();i++ ) {
			
		
			rule.setAttribute("ID", String.valueOf(xmlgcss.get(i).getField_ID()));
			rule.setAttribute("Name", String.valueOf(xmlgcss.get(i).getFieldID_Name()));
			rule.setAttribute("Condition", String.valueOf(xmlgcss.get(i).getCondition()));
			
			rootElement.appendChild(rule);
			
			
			}
			
			

			DOMSource source = new DOMSource(doc);
			StreamResult result = new StreamResult(
					new File("C:/Users/tc1/Desktop/xml/" + xmlgcss.get(0).getField_ID() + ".xml"));
			TransformerFactory transformerFactory = TransformerFactory.newInstance();
			Transformer transformer = transformerFactory.newTransformer();
			transformer.setOutputProperty(OutputKeys.INDENT, "yes");
			transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4");
			transformer.transform(source, result);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		System.out.println("Done creating XML File");
		
		
		
	}
	public void secondXmlGeneration(SecondXMKL secxml) {

		try {
			DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
			Document doc = docBuilder.newDocument();
			Element rootElement = doc.createElement("conditions");
			doc.appendChild(rootElement);
			Element rule = doc.createElement("Rule");
			rule.setAttribute("ID", String.valueOf(secxml.getField_id()));
			rule.setAttribute("Name", String.valueOf(secxml.getField_name()));
			rule.setAttribute("Action", String.valueOf(secxml.getAction()));
			rule.setAttribute("Condition", String.valueOf(secxml.getCondition()));
			rootElement.appendChild(rule);
			DOMSource source = new DOMSource(doc);
			StreamResult result = new StreamResult(new File("C:/Users/tc1/Desktop/xml/RuleSet.xml"));
			TransformerFactory transformerFactory = TransformerFactory.newInstance();
			Transformer transformer = transformerFactory.newTransformer();
			transformer.setOutputProperty(OutputKeys.INDENT, "yes");
			transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4");
			transformer.transform(source, result);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}