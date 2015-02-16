package cn.st.code.generator;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;

import cn.st.code.generator.entity.Column;
import cn.st.code.generator.util.Constant;
import cn.st.code.generator.util.FreeMarkertUtil;

public class CodeGenerator {

    public static void main(String[] args) throws Exception {
        Map<String, Object> settingsMap = getProps2Map(Constant.PROPS_SETTINGS);
        String projectName = (String) settingsMap.get(Constant.PROJECT_NAME);
        String packageName = (String) settingsMap.get(Constant.PACKAGE);
        String packageDir = packageName.replaceAll("\\.", "/");
        String generatorSystemManager = (String) settingsMap.get(Constant.GENERATOR_SYSTEMMODULE);
        String parseDB = (String) settingsMap.get(Constant.PARSE_DB);
        String jdbcType = (String) settingsMap.get(Constant.JDBC_TYPE);
        String delPath =
                CodeGenerator.class.getClassLoader().getResource("output").getPath() + "/"
                        + projectName;
        deleteFile(new File(delPath));
        // 生成项目根目录
        String root = createDir(projectName);
        // 生成.settings文件夹
        /** settings下文件 **/
        String setttingsRoot = createDir(root, Constant.OUTPUT_SETTING);

        // 生成.jsdtscope
        createFileWithFtl(settingsMap, Constant.FTL_SETTINGS_JSDTSCOPE, setttingsRoot,
                Constant.OUTPUT_SETTINGS_JSDTSCOPE);
        // 生成 org.eclipse.core.resources.prefs
        createFileWithFtl(settingsMap, Constant.FTL_SETTINGS_ORG_ECLIPSE_CORE_RESOURCES,
                setttingsRoot, Constant.OUTPUT_SETTINGS_ORG_ECLIPSE_CORE_RESOURCES);
        // 生成org.eclipse.jdt.core.prefs
        createFileWithFtl(settingsMap, Constant.FTL_SETTINGS_ORG_ECLIPSE_JDT_CORE, setttingsRoot,
                Constant.OUTPUT_SETTINGS_ORG_ECLIPSE_JDT_CORE);
        // 生成org.eclipse.m2e.core.prefs
        createFileWithFtl(settingsMap, Constant.FTL_SETTINGS_ORG_ECLIPSE_M2E_CORE, setttingsRoot,
                Constant.OUTPUT_SETTINGS_ORG_ECLIPSE_M2E_CORE);
        // 生成org.eclipse.wst.common.component
        createFileWithFtl(settingsMap, Constant.FTL_SETTINGS_ORG_ECLIPSE_WST_COMMON_COMPONENT,
                setttingsRoot, Constant.OUTPUT_SETTINGS_ORG_ECLIPSE_WST_COMMON_COMPONENT);
        // 生成org.eclipse.wst.common.project.facet.core.xml
        createFileWithFtl(settingsMap,
                Constant.FTL_SETTINGS_ORG_ECLIPSE_WST_COMMON_PROJECT_FACET_CORE, setttingsRoot,
                Constant.OUTPUT_SETTINGS_ORG_ECLIPSE_WST_COMMON_PROJECT_FACET_CORE);
        // 生成org.eclipse.wst.jsdt.ui.superType.container
        createFileWithFtl(settingsMap,
                Constant.FTL_SETTINGS_ORG_ECLIPSE_WST_JSDT_UI_SUPERTYPE_CONTAINER, setttingsRoot,
                Constant.OUTPUT_SETTINGS_ORG_ECLIPSE_WST_JSDT_UI_SUPERTYPE_CONTAINER);
        // 生成org.eclipse.wst.jsdt.ui.superType.name
        createFileWithFtl(settingsMap,
                Constant.FTL_SETTINGS_ORG_ECLIPSE_WST_JSDT_UI_SUPERTYPE_NAME, setttingsRoot,
                Constant.OUTPUT_SETTINGS_ORG_ECLIPSE_WST_JSDT_UI_SUPERTYPE_NAME);
        // 生成org.eclipse.wst.validation.prefs
        createFileWithFtl(settingsMap, Constant.FTL_SETTINGS_ORG_ECLIPSE_WST_VALIDATION,
                setttingsRoot, Constant.OUTPUT_SETTINGS_ORG_ECLIPSE_WST_VALIDATION);
        // 生成src文件夹
        String src_main_java = createDir(root, Constant.OUTPUT_SRC_MAIN_JAVA);
        //
        if ("true".equals(generatorSystemManager)) {
            //
            String entityRoot = createDir(src_main_java, packageDir + "/entity" + "/sys");
            String daoRoot = createDir(src_main_java, packageDir + "/dao" + "/sys");
            String daoImplRoot = createDir(src_main_java, packageDir + "/dao/sys/impl");
            String serviceRoot = createDir(src_main_java, packageDir + "/service" + "/sys");
            String serviceImplRoot = createDir(src_main_java, packageDir + "/service/sys/impl");
            generateSysModule(packageName, entityRoot, daoRoot, daoImplRoot, serviceRoot,
                    serviceImplRoot, "SysUser");
            generateSysModule(packageName, entityRoot, daoRoot, daoImplRoot, serviceRoot,
                    serviceImplRoot, "SysRole");
            generateSysModule(packageName, entityRoot, daoRoot, daoImplRoot, serviceRoot,
                    serviceImplRoot, "SysResource");
            generateSysModule(packageName, entityRoot, daoRoot, daoImplRoot, serviceRoot,
                    serviceImplRoot, "SysDepartment");
            generateSysModule(packageName, entityRoot, daoRoot, daoImplRoot, serviceRoot,
                    serviceImplRoot, "SysDic");
            generateSysModule(packageName, entityRoot, daoRoot, daoImplRoot, serviceRoot,
                    serviceImplRoot, "SysLog");
            generateSysModule(packageName, entityRoot, daoRoot, daoImplRoot, serviceRoot,
                    serviceImplRoot, "SysLoginLog");

        }
        if ("true".equals(parseDB)) {
            // hibernate
            String controllerRoot = createDir(src_main_java, packageDir + "/controller");
            String entityRoot = createDir(src_main_java, packageDir + "/entity");
            String daoRoot = createDir(src_main_java, packageDir + "/dao");
            String daoImplRoot = createDir(src_main_java, packageDir + "/dao/impl");
            String serviceRoot = createDir(src_main_java, packageDir + "/service");
            String serviceImplRoot = createDir(src_main_java, packageDir + "/service/impl");

            String mapperRoot = createDir(src_main_java, packageDir + "/mapper");

            Connection conn =
                    getConn((String) settingsMap.get(Constant.JDBC_DRIVER),
                            (String) settingsMap.get(Constant.JDBC_URL),
                            (String) settingsMap.get(Constant.JDBC_USER),
                            (String) settingsMap.get(Constant.JDBC_PASSWORD),
                            (String) settingsMap.get(Constant.JDBC_REMARKSREPORTING));
            String schema = (String) settingsMap.get(Constant.JDBC_SCHEMA);
            List<String> tableList =
                    getTables(conn, schema, (String) settingsMap.get(Constant.JDBC_TABLES));
            for (String tableName : tableList) {
                System.out.println("解析" + tableName + "表");
                String className = table2Entity(tableName);
                List<Column> columns = getColumnsByTableName(conn, schema, tableName);

                Map<String, Object> controllerMap = new HashMap<String, Object>();
                Map<String, Object> entityMap = new HashMap<String, Object>();
                Map<String, Object> daoMap = new HashMap<String, Object>();
                Map<String, Object> daoImplMap = new HashMap<String, Object>();
                Map<String, Object> serviceMap = new HashMap<String, Object>();
                Map<String, Object> serviceImplMap = new HashMap<String, Object>();

                Map<String, Object> mapperEntityMap = new HashMap<String, Object>();
                Map<String, Object> mapperMapperMap = new HashMap<String, Object>();
                Map<String, Object> mapperXmlMap = new HashMap<String, Object>();

                controllerMap.put("packageName", packageName);
                controllerMap.put("tableName", tableName.toLowerCase());
                controllerMap.put("className", className);
                controllerMap.put("columns", columns);

                entityMap.put("packageName", packageName);
                entityMap.put("tableName", tableName.toLowerCase());
                entityMap.put("className", className);
                entityMap.put("columns", columns);
                entityMap.put("jdbcType", jdbcType.toLowerCase());

                daoMap.put("packageName", packageName);
                daoMap.put("className", className);

                daoImplMap.put("packageName", packageName);
                daoImplMap.put("className", className);

                serviceMap.put("packageName", packageName);
                serviceMap.put("className", className);

                serviceImplMap.put("packageName", packageName);
                serviceImplMap.put("className", className);

                mapperEntityMap.put("packageName", packageName);
                mapperEntityMap.put("tableName", tableName.toLowerCase());
                mapperEntityMap.put("className", className);
                mapperEntityMap.put("columns", columns);

                mapperMapperMap.put("packageName", packageName);
                mapperMapperMap.put("className", className);

                mapperXmlMap.put("packageName", packageName);
                mapperXmlMap.put("tableName", tableName.toLowerCase());
                mapperXmlMap.put("className", className);
                mapperXmlMap.put("columns", columns);

                createFileWithFtl(controllerMap, Constant.FTL_CONTROLLER, controllerRoot, className
                        + "Controller.java");

                createFileWithFtl(entityMap, Constant.FTL_ENTITY, entityRoot, className + ".java");
                createFileWithFtl(daoMap, Constant.FTL_DAO, daoRoot, className + "Dao.java");
                createFileWithFtl(daoImplMap, Constant.FTL_DAO_IMPL, daoImplRoot, className
                        + "DaoImpl.java");
                createFileWithFtl(serviceMap, Constant.FTL_SERVICE, serviceRoot, className
                        + "Service.java");
                createFileWithFtl(serviceImplMap, Constant.FTL_SERVICE_IMPL, serviceImplRoot,
                        className + "ServiceImpl.java");

                createFileWithFtl(mapperEntityMap, Constant.FTL_MAPPER_ENTITY, mapperRoot,
                        className + ".java");

                createFileWithFtl(mapperMapperMap, Constant.FTL_MAPPER_MAPPER, mapperRoot,
                        className + "Mapper.java");

                createFileWithFtl(mapperXmlMap, Constant.FTL_MAPPER_XML, mapperRoot, className
                        + "Mapper.xml");
            }
            conn.close();
        }

        createDir(root, Constant.OUTPUT_SRC_MAIN_RESOURCES);
        String webinfRoot = createDir(root, Constant.OUTPUT_SRC_MAIN_WEBAPP_WEBINF);

        // 生成web.xml
        createFileWithFtl(settingsMap, Constant.FTL_WEBINF_WEB, webinfRoot,
                Constant.OUTPUT_WEBINF_WEB);
        // 生成qjson.tld
        createFileWithFtl(settingsMap, Constant.FTL_WEBINF_QJSON, webinfRoot,
                Constant.OUTPUT_WEBINF_QJSON);
        // 生成src/test/java文件
        createDir(root, Constant.OUTPUT_SRC_TEST_JAVA);

        // 生成target文件夹
        createDir(root, Constant.OUTPUT_TARGET_CLASSES);
        createDir(root, Constant.OUTPUT_TARGET_M2E_WTP_WEB_RESOURCES);
        createDir(root, Constant.OUTPUT_TARGET_TEST_CLASSES);
        // 生成.classpath文件
        createFileWithFtl(settingsMap, Constant.FTL_CLASSPATH, root, Constant.OUTPUT_CLASSPATH);

        // 生成.project文件
        createFileWithFtl(settingsMap, Constant.FTL_PROJECT, root, Constant.OUTPUT_PROJECT);

        // 生成pom.xml文件
        createFileWithFtl(settingsMap, Constant.FTL_POM, root, Constant.OUTPUT_POM);
    }

    private static void generateSysModule(String packageName, String entityRoot, String daoRoot,
            String daoImplRoot, String serviceRoot, String serviceImplRoot, String className)
            throws Exception {
        Map<String, Object> modulMap = new HashMap<String, Object>();
        modulMap.put("packageName", packageName);
        createFileWithFtl(modulMap, "system/" + className + ".ftl", entityRoot, className + ".java");
        createFileWithFtl(modulMap, "system/" + className + "Dao.ftl", daoRoot, className
                + "Dao.java");
        createFileWithFtl(modulMap, "system/" + className + "DaoImpl.ftl", daoImplRoot, className
                + "DaoImpl.java");
        createFileWithFtl(modulMap, "system/" + className + "Service.ftl", serviceRoot, className
                + "Service.java");
        createFileWithFtl(modulMap, "system/" + className + "ServiceImpl.ftl", serviceImplRoot,
                className + "ServiceImpl.java");
    }

    public static void createFileWithFtl(String config, String ftl, String dir, String output)
            throws Exception {
        Properties p = new Properties();
        p.load(CodeGenerator.class.getClassLoader().getResourceAsStream("configs/" + config));
        Map<Object, Object> pomMap = new HashMap<Object, Object>();
        for (Entry<Object, Object> entry : p.entrySet()) {
            pomMap.put(entry.getKey(), entry.getValue());
        }
        String path = dir + "/" + output;
        OutputStream ops = null;
        ops = new FileOutputStream(path);
        FreeMarkertUtil.analysisTemplate(ftl, "utf-8", pomMap, ops);
        System.err.println("生成" + output);
    }

    public static void createFileWithFtl(Map<String, Object> map, String ftl, String dir,
            String output) throws Exception {
        String path = dir + "/" + output;
        OutputStream ops = null;
        ops = new FileOutputStream(path);
        FreeMarkertUtil.analysisTemplate(ftl, "utf-8", map, ops);
        System.err.println("生成" + output);
    }

    public static String createDirWithConfig(String config) throws Exception {
        Properties p = new Properties();
        p.load(CodeGenerator.class.getClassLoader().getResourceAsStream("configs/" + config));
        String projectName = p.getProperty("name");
        String path =
                CodeGenerator.class.getClassLoader().getResource("output").getPath() + "/"
                        + projectName;
        File file = new File(path);
        file.mkdirs();
        System.err.println("生成" + projectName);
        return path;
    }

    /**
     * 创建目录
     * 
     * @param name
     * @return
     * @throws Exception
     */
    public static String createDir(String name) throws Exception {

        String path =
                CodeGenerator.class.getClassLoader().getResource("output").getPath() + "/" + name;
        File file = new File(path);
        file.mkdirs();
        System.err.println("生成" + name);
        return path;
    }

    public static String createDir(String root, String dir) throws Exception {
        String path = root + "/" + dir;
        File file = new File(path);
        file.mkdirs();
        System.err.println("生成" + dir);
        return path;
    }

    /**
     * 将properties文件转化为map
     * 
     * @param config
     * @return
     * @throws Exception
     */
    public static Map<String, Object> getProps2Map(String config) throws Exception {
        Properties p = new Properties();
        p.load(CodeGenerator.class.getClassLoader().getResourceAsStream("configs/" + config));
        Map<String, Object> pomMap = new HashMap<String, Object>();
        for (Entry<Object, Object> entry : p.entrySet()) {
            String key = (String) entry.getKey();
            String value = (String) entry.getValue();
            if (value.startsWith("{")) {
                String newKey = value.substring(1, value.length() - 1);
                value = p.getProperty(newKey);
            }
            pomMap.put(key, value);
        }
        p.clear();
        return pomMap;
    }

    public static Connection getConn(String driver, String url, String user, String password,
            String remarksReporting) throws Exception {
        Class.forName(driver);
        Properties info = new Properties();
        info.setProperty("user", user);
        info.setProperty("password", password);
        info.setProperty("remarksReporting", remarksReporting);
        if ("sys".equals(user)) {
            info.setProperty("internal_logon", "sysdba");
        }
        Connection conn = DriverManager.getConnection(url, info);
        return conn;
    }

    public static List<String> getTables(Connection conn) throws Exception {
        return getTables(conn, null);
    }

    public static List<String> getTables(Connection conn, String schema) throws Exception {
        return getTables(conn, schema, null);
    }

    public static List<String> getTables(Connection conn, String schema, String tables)
            throws Exception {
        List<String> tableList = new ArrayList<String>();
        if (tables != null && !tables.equals("")) {
            for (String table : tables.split(",")) {
                tableList.add(table.toUpperCase());
            }
        } else {
            DatabaseMetaData dbmd = conn.getMetaData();

            ResultSet rs = null;
            String[] typeList = new String[] {"TABLE", "VIEW"};
            if (schema == null || "".equals(schema)) {
                schema = dbmd.getUserName();
            }
            rs = dbmd.getTables(null, schema.toUpperCase(), null, typeList);
            for (boolean more = rs.next(); more; more = rs.next()) {
                String s = rs.getString("TABLE_NAME");
                String type = rs.getString("TABLE_TYPE");
                if ((type.equalsIgnoreCase("table") || type.equalsIgnoreCase("view"))
                        && s.indexOf("$") == -1) tableList.add(s);
            }
            rs.close();
        }
        return tableList;
    }

    public static List<Column> getColumnsByTableName(Connection conn, String schema,
            String tableName) throws Exception {
        DatabaseMetaData dbmd = conn.getMetaData();
        if (schema == null || "".equals(schema)) {
            schema = dbmd.getUserName();
        }
        ResultSet colRet = dbmd.getColumns(null, schema.toUpperCase(), tableName, "%");
        List<Column> columns = new ArrayList<Column>();
        while (colRet.next()) {
            String columnName = colRet.getString("COLUMN_NAME").toLowerCase();
            String columnType = colRet.getString("TYPE_NAME").toLowerCase();
            int datasize = colRet.getInt("COLUMN_SIZE");
            // int digits = colRet.getInt("DECIMAL_DIGITS");
            // int nullable = colRet.getInt("NULLABLE");
            String remarks = colRet.getString("REMARKS");
            Column column = new Column();
            column.setColumnName(columnName);
            if ("id".equals(columnName)) {
                column.setIsPrivate(1);
            }
            String propType = null;
            if ("number".equals(columnType) || "int".equals(columnType)
                    || "decimal".equals(columnType)) {
                if (datasize == 32) {
                    propType = "Long";
                } else {
                    propType = "Integer";
                }
            } else if ("varchar2".equals(columnType) || "varchar".equals(columnType)) {
                propType = "String";
            } else if ("date".equals(columnType) || "datetime".equals(columnType)) {
                propType = "Date";
            } else if ("clob".equals(columnType)) {
                propType = "byte[]";
            } else {
                propType = columnType;
            }
            column.setPropType(propType);
            column.setPropName(column2Prop(columnName));
            column.setComment(remarks);
            columns.add(column);
        }
        colRet.close();
        return columns;
    }

    public static String table2Entity(String tableName) {
        tableName = tableName.toLowerCase();
        String[] components = tableName.split("_");
        StringBuffer sb = new StringBuffer();
        int i = 0;
        for (String component : components) {
            if (i == 0) {
                if (!"tbl".equals(component)) {
                    sb.append(first2Upper(component));
                }
            } else {
                sb.append(first2Upper(component));
            }
            i++;
        }
        return sb.toString();
    }

    public static String column2Prop(String columnName) {
        columnName = columnName.toLowerCase();
        String[] components = columnName.split("_");
        StringBuffer sb = new StringBuffer();
        int i = 0;
        for (String component : components) {
            if (i == 0) {
                sb.append(component);
            } else {
                sb.append(first2Upper(component));
            }
            i++;
        }
        return sb.toString();
    }

    public static String first2Upper(String letter) {
        if (letter.length() == 0) throw new IllegalArgumentException("参数异常");
        return letter.substring(0, 1).toUpperCase() + letter.substring(1);
    }

    public static void generatorModule(String className, String packageName, String tableName,
            String root, String module, String ftl, String dir) throws Exception {
        Map<String, Object> entityMap = new HashMap<String, Object>();
        Map<String, Object> daoMap = new HashMap<String, Object>();
        Map<String, Object> daoImplMap = new HashMap<String, Object>();
        Map<String, Object> serviceMap = new HashMap<String, Object>();
        Map<String, Object> serviceImplMap = new HashMap<String, Object>();
        entityMap.put("packageName", packageName);
        entityMap.put("tableName", tableName.toLowerCase());
        entityMap.put("className", className);
        // entityMap.put("columns", columns);
        daoMap.put("packageName", packageName);
        daoMap.put("className", className);
        daoImplMap.put("packageName", packageName);
        daoImplMap.put("className", className);
        serviceMap.put("packageName", packageName);
        serviceMap.put("className", className);
        serviceImplMap.put("packageName", packageName);
        serviceImplMap.put("className", className);
        createFileWithFtl(entityMap, Constant.FTL_ENTITY, dir, className + ".java");
        createFileWithFtl(daoMap, Constant.FTL_DAO, root, className + "Dao.java");
        createFileWithFtl(daoImplMap, Constant.FTL_DAO_IMPL, root, className + "DaoImpl.java");
        createFileWithFtl(serviceMap, Constant.FTL_SERVICE, root, className + "Service.java");
        createFileWithFtl(serviceImplMap, Constant.FTL_SERVICE_IMPL, root, className
                + "ServiceImpl.java");
    }

    public static void deleteFile(File file) {
        if (file.isDirectory()) {
            File[] files = file.listFiles();
            for (File f : files) {
                deleteFile(f);
            }
        }
        file.delete();
    }

}
