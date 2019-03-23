package pers.corvey.exam.other.hibernate;

import org.hibernate.boot.model.naming.Identifier;
import org.hibernate.boot.model.naming.ImplicitBasicColumnNameSource;
import org.hibernate.boot.model.naming.ImplicitEntityNameSource;
import org.hibernate.boot.model.naming.ImplicitJoinColumnNameSource;
import org.hibernate.boot.model.naming.ImplicitNamingStrategyLegacyHbmImpl;

public class MyImplicitNamingStrategy extends ImplicitNamingStrategyLegacyHbmImpl {

	private static final long serialVersionUID = 8039490212591227210L;
	
	private static final String REGEXP = "([a-z])([A-Z])";
	private static final String REPLACEMENT = "$1_$2";
	
	@Override
	public Identifier determinePrimaryTableName(ImplicitEntityNameSource source) {
		Identifier identifier = super.determinePrimaryTableName(source);
		return toIdentifier(convert(identifier.getText()), source.getBuildingContext());
	}
	
	@Override
	public Identifier determineBasicColumnName(ImplicitBasicColumnNameSource source) {
		Identifier identifier = super.determineBasicColumnName(source);
		return toIdentifier(convert(identifier.getText()), source.getBuildingContext());
	}

	@Override
	public Identifier determineJoinColumnName(ImplicitJoinColumnNameSource source) {
		String name = source.getReferencedTableName() + "_" + source.getReferencedColumnName();
		return toIdentifier(name, source.getBuildingContext());
	}
	
	private String convert(String str) {
		if (str == null) {
			return null;
		}
		return str.replaceAll(REGEXP, REPLACEMENT).toLowerCase();
	}
}
