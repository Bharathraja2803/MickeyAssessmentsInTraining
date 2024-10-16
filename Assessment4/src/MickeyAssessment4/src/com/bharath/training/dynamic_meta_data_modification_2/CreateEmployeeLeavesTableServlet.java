package com.bharath.training.dynamic_meta_data_modification_2;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adventnet.db.persistence.metadata.ColumnDefinition;
import com.adventnet.db.persistence.metadata.MetaDataException;
import com.adventnet.db.persistence.metadata.PrimaryKeyDefinition;
import com.adventnet.db.persistence.metadata.TableDefinition;
import com.adventnet.persistence.DataAccess;
import com.adventnet.persistence.DataAccessException;

/**
 * This servlet is used to create the bharath_employee_leaves table
 */
@WebServlet("/CreateEmployeeLeavesTableServlet")
public class CreateEmployeeLeavesTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String newTable = "BHARATH_EMPLOYEE_LEAVES";
		TableDefinition tableDefinition = new TableDefinition(false);
		tableDefinition.setTableName(newTable);

		ColumnDefinition empIdColumnDefinition = new ColumnDefinition();
		empIdColumnDefinition.setTableName(newTable);
		empIdColumnDefinition.setColumnName("EMPLOYEE_ID");
		empIdColumnDefinition.setDataType("INTEGER");
		empIdColumnDefinition.setNullable(false);
		empIdColumnDefinition.setKey(true);
		tableDefinition.addColumnDefinition(empIdColumnDefinition);
		
		ColumnDefinition sickLeaveColumnDefinition = new ColumnDefinition();
		sickLeaveColumnDefinition.setTableName(newTable);
		sickLeaveColumnDefinition.setColumnName("SICK_LEAVE");
		sickLeaveColumnDefinition.setDataType("INTEGER");
		sickLeaveColumnDefinition.setNullable(false);
		try {
			sickLeaveColumnDefinition.setDefaultValue(new Integer(0));
		} catch (MetaDataException e1) {
			e1.printStackTrace();
		}
		sickLeaveColumnDefinition.setMaxLength(4);
		tableDefinition.addColumnDefinition(sickLeaveColumnDefinition);
		
		ColumnDefinition earnLeaveColumnDefinition = new ColumnDefinition();
		earnLeaveColumnDefinition.setTableName(newTable);
		earnLeaveColumnDefinition.setColumnName("EARN_LEAVE");
		earnLeaveColumnDefinition.setDataType("INTEGER");
		earnLeaveColumnDefinition.setNullable(false);
		try {
			earnLeaveColumnDefinition.setDefaultValue(new Integer(0));
		} catch (MetaDataException e1) {
			e1.printStackTrace();
		}
		earnLeaveColumnDefinition.setMaxLength(3);
		tableDefinition.addColumnDefinition(earnLeaveColumnDefinition);
		
		
		PrimaryKeyDefinition primaryKeyDefinition = new PrimaryKeyDefinition();
		primaryKeyDefinition.setName(newTable+"_PK");
		primaryKeyDefinition.setTableName(newTable);
		primaryKeyDefinition.addColumnName("EMPLOYEE_ID");

		tableDefinition.setPrimaryKey(primaryKeyDefinition);
		try {
			DataAccess.createTable("BharathAssessment4",tableDefinition);
		} catch (DataAccessException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
