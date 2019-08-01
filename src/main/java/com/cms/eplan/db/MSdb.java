package com.cms.eplan.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MSdb {
	public Connection connection = null;
	public Statement statement = null;
	public ResultSet resultSet = null;

	public MSdb() {
		try {
			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
		} catch (ClassNotFoundException cnfex) {
			System.out.println("Problem in loading or " + "registering MS Access JDBC driver");
			cnfex.printStackTrace();
		}
	}

	public List<Attribute> getAllData() {
		List<Attribute> list = new ArrayList<Attribute>();
		try {
			String msAccDB = "C:/Users/tc2/Desktop/xml/LVD_ConfigurationDb.accdb";
			String dbURL = "jdbc:ucanaccess://" + msAccDB;
			connection = DriverManager.getConnection(dbURL);
			statement = connection.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM Attributes");
			while (resultSet.next()) {
				Attribute att = new Attribute();
				att.setId(resultSet.getInt(1));
				att.setFieldId(resultSet.getString(2));
				att.setFieldName(resultSet.getString(3));
				att.setFieldType(resultSet.getString(4));
				list.add(att);
			}
		} catch (SQLException sqlex) {
			sqlex.printStackTrace();
		} finally {
			try {
				if (null != connection) {
					resultSet.close();
					statement.close();
					connection.close();
				}
			} catch (SQLException sqlex) {
				sqlex.printStackTrace();
			}
		}
		return list;
	}

	public List getAllAttributeData(String fieldid) {
		List list1 = new ArrayList();
		try {
			String msAccDB = "C:/Users/tc2/Desktop/xml/LVD_ConfigurationDb.accdb";
			String dbURL = "jdbc:ucanaccess://" + msAccDB;
			connection = DriverManager.getConnection(dbURL);
			statement = connection.createStatement();
			resultSet = statement.executeQuery(
					"SELECT VALUENAME,VALUEID FROM VALUENAMES WHERE VALUEID IN(SELECT VALUEID FROM FIELDVALUERELATION  WHERE FIELDID='"
							+ fieldid + "')");
			while (resultSet.next()) {
				//System.out.println(resultSet.getString(1));
				list1.add(resultSet.getString(1));
			}
		} catch (SQLException sqlex) {
			sqlex.printStackTrace();
		} finally {
			try {
				if (null != connection) {
					resultSet.close();
					statement.close();
					connection.close();
				}
			} catch (SQLException sqlex) {
				sqlex.printStackTrace();
			}
		}
		return list1;
	}

	public List<String> ActionConnection() {
		List<String> list = new ArrayList<String>();
		try {
			String msAccDB = "C:/Users/tc2/Desktop/xml/LVD_ConfigurationDb.accdb";
			String dbURL = "jdbc:ucanaccess://" + msAccDB;
			connection = DriverManager.getConnection(dbURL);
			statement = connection.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM Actions");
			while (resultSet.next()) {
				list.add(resultSet.getString(2));
				//System.out.println(resultSet.getInt(1) + "\t" + resultSet.getString(2));
			}
		} catch (SQLException sqlex) {
			sqlex.printStackTrace();
		} finally {
			try {
				if (null != connection) {
					resultSet.close();
					statement.close();
					connection.close();
				}
			} catch (SQLException sqlex) {
				sqlex.printStackTrace();
			}
		}
		return list;
	}
}
