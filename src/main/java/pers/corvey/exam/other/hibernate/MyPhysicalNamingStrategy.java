package pers.corvey.exam.other.hibernate;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.boot.model.naming.Identifier;
import org.hibernate.boot.model.naming.PhysicalNamingStrategy;
import org.hibernate.engine.jdbc.env.spi.JdbcEnvironment;

public class MyPhysicalNamingStrategy implements PhysicalNamingStrategy {

	private static final String REGEX = "([a-z])([A-Z])";
	private static final String REPLACEMENT = "$1_$2";
	
	@Override
    public Identifier toPhysicalCatalogName(Identifier identifier, JdbcEnvironment jdbcEnv) {
        return convert(identifier);
    }

    @Override
    public Identifier toPhysicalColumnName(Identifier identifier, JdbcEnvironment jdbcEnv) {
        return convert(identifier);
    }

    @Override
    public Identifier toPhysicalSchemaName(Identifier identifier, JdbcEnvironment jdbcEnv) {
        return convert(identifier);
    }

    @Override
    public Identifier toPhysicalSequenceName(Identifier identifier, JdbcEnvironment jdbcEnv) {
        return convert(identifier);
    }

    @Override
    public Identifier toPhysicalTableName(Identifier identifier, JdbcEnvironment jdbcEnv) {
        return convert(identifier);
    }
    
    private Identifier convert(Identifier identifier) {
        if (identifier == null || StringUtils.isBlank(identifier.getText())) {
            return identifier;
        }
        return Identifier.toIdentifier(convert(identifier.getText()));
    }

    private String convert(String str) {
    	if (str == null) {
    		return null;
    	}
        String newStr = str.replaceAll(REGEX, REPLACEMENT).toLowerCase();
        return newStr;
    }
}
