package com.bharath.training.template_table_5;

import java.sql.SQLException;

import com.adventnet.db.persistence.metadata.MetaDataException;
import com.adventnet.db.persistence.metadata.TableDefinition;
import com.adventnet.db.persistence.metadata.util.MetaDataUtil;
import com.adventnet.db.persistence.metadata.util.test.TemplateMetaHandlerTest;
import com.adventnet.persistence.DataAccess;
import com.adventnet.persistence.DataAccessException;

public class ImplementationClass extends TemplateMetaHandlerTest{
	private static int uniqueIdGenerator = 1;
	public boolean createTemplateTableInstance(){
		
		try {
			TableDefinition tableDefinition = MetaDataUtil.getTableDefinitionByName("BHARATH_SAMPLE_DD");
			this.addTemplate("TemplateTable", tableDefinition);
			DataAccess.createTableInstance("BHARATH_SAMPLE_DD", ""+(uniqueIdGenerator++), null);
			return true;
		} catch (MetaDataException | DataAccessException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
}
