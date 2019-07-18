package com.cms.eplan.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MSAccess {

	public MSAccess() {

	}

	public static void main(String[] args) {
		List<RuleSetClass> list = new ArrayList<RuleSetClass>();

		// variables
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;

		// Step 1: Loading or registering Oracle JDBC driver class
		try {

			Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
		} catch (ClassNotFoundException cnfex) {

			System.out.println("Problem in loading or " + "registering MS Access JDBC driver");
			cnfex.printStackTrace();
		}

		// Step 2: Opening database connection

		try {
			String msAccDB = "C:/Users/tc2/Desktop/xml/LVD_ConfigurationDb.accdb";
			String dbURL = "jdbc:ucanaccess://" + msAccDB;

			// Step 2.A: Create and get connection using DriverManager class
			connection = DriverManager.getConnection(dbURL);

			// Step 2.B: Creating JDBC Statement
			statement = connection.createStatement();

			// Step 2.C: Executing SQL and retrieve data into ResultSet
			resultSet = statement.executeQuery("SELECT * FROM RuleSet");

			System.out.println("ID\tRuleSetId\tXMLRule\t\t\tRuleCondition");
			System.out.println(
					"==\t=========\t========\t\t==============                                                                                                                                                                                                                                 ");

			// processing returned data and printing into console
			while (resultSet.next()) {
				RuleSetClass rset = new RuleSetClass();
				rset.setId(resultSet.getInt(1));
				rset.setRuleSetId(resultSet.getString(2));
				rset.setXmlRule(resultSet.getString(3));
				rset.setRuleCondition(resultSet.getString(4));

				list.add(rset);

				System.out.println(resultSet.getInt(1) + "\t" + resultSet.getString(2) + "\t" + resultSet.getString(3)
						+ "\t" + resultSet.getString(4));

				System.out.println(
						"===========================================================================================");
			}

		} catch (SQLException sqlex) {
			sqlex.printStackTrace();
		} finally {
			// Step 3: Closing database connection
			try {
				if (null != connection) {
					// cleanup resources, once after processing
					resultSet.close();
					statement.close();

					// and then finally close connection
					connection.close();
				}
			} catch (SQLException sqlex) {
				sqlex.printStackTrace();
			}

		}

	}
}
