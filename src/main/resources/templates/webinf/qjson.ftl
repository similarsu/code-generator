<?xml version="1.0" encoding="UTF-8" ?>
<taglib xmlns="http://java.sun.com/xml/ns/j2ee" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://java.sun.com/xml/ns/j2ee http://java.sun.com/xml/ns/j2ee/web-jsptaglibrary_2_0.xsd"
	version="2.0">

	<description>QUI JSON Maker</description>
	<tlib-version>1.0</tlib-version>
	<short-name>qjson</short-name>
	<uri>/qjsonTag</uri>
	<tag>
		<name>roleJSON</name>
		<tag-class>${package}.taglib.sys.RoleTag</tag-class>
		<body-content>empty</body-content>
		<attribute>
			<name>type</name>
			<required>true</required>
			<rtexprvalue>true</rtexprvalue>
		</attribute>
	</tag>
	
	<tag>
		<name>resJSON</name>
		<tag-class>${package}.taglib.sys.ResTag</tag-class>
		<body-content>empty</body-content>
		<attribute>
			<name>type</name>
			<required>true</required>
			<rtexprvalue>true</rtexprvalue>
		</attribute>
	</tag>
	
	<tag>
		<name>dicJSON</name>
		<tag-class>${package}.taglib.sys.DicTag</tag-class>
		<body-content>empty</body-content>
		<attribute>
			<name>type</name>
			<required>true</required>
			<rtexprvalue>true</rtexprvalue>
		</attribute>
		
		<attribute>
			<name>dicType</name>
			<required>false</required>
			<rtexprvalue>true</rtexprvalue>
		</attribute>
		
		<attribute>
			<name>dicKey</name>
			<required>false</required>
			<rtexprvalue>true</rtexprvalue>
		</attribute>
	</tag>
	
	<tag>
		<name>departmentJSON</name>
		<tag-class>${package}.taglib.sys.DepartmentTag</tag-class>
		<body-content>empty</body-content>
		<attribute>
			<name>deptCode</name>
			<required>false</required>
			<rtexprvalue>true</rtexprvalue>
		</attribute>
	</tag>
</taglib>  