<?xml version="1.0"?>
<project
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd"
	xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<modelVersion>4.0.0</modelVersion>
	<#if pom_isModule=="true">
	<parent>
		<groupId>${pom_groupId}</groupId>
		<artifactId>${pom_parent_artifactId}</artifactId>
		<version>${pom_version}</version>
	</parent>
	</#if>
	<groupId>${pom_groupId}</groupId>
	<artifactId>${pom_artifactId}</artifactId>
	<version>${pom_version}</version>
	<packaging>${pom_packaging}</packaging>
	<name>${pom_name}</name>
	<url>http://maven.apache.org</url>
	<dependencies>
		<dependency>
			<groupId>${pom_groupId}</groupId>
			<artifactId>wzga-core</artifactId>
		</dependency>

		<dependency>
			<groupId>junit</groupId>
			<artifactId>junit</artifactId>
			<scope>test</scope>
		</dependency>

		<dependency>
			<groupId>javax.servlet</groupId>
			<artifactId>servlet-api</artifactId>
			<scope>provided</scope>
		</dependency>

		<dependency>
			<groupId>jstl</groupId>
			<artifactId>jstl</artifactId>
			<scope>runtime</scope>
		</dependency>

		<dependency>
			<groupId>javax.servlet.jsp</groupId>
			<artifactId>jsp-api</artifactId>
			<scope>provided</scope>
		</dependency>

		<dependency>
			<groupId>commons-fileupload</groupId>
			<artifactId>commons-fileupload</artifactId>
		</dependency>

		<dependency>
			<groupId>org.apache.cxf</groupId>
			<artifactId>cxf-rt-frontend-jaxws</artifactId>
		</dependency>

		<dependency>
			<groupId>org.apache.cxf</groupId>
			<artifactId>cxf-rt-transports-http</artifactId>
		</dependency>

		<dependency>
			<groupId>org.apache.cxf</groupId>
			<artifactId>cxf-rt-frontend-jaxrs</artifactId>
		</dependency>

		<dependency>
			<groupId>org.apache.cxf</groupId>
			<artifactId>cxf-rt-transports-http-jetty</artifactId>
		</dependency>

		<dependency>
			<groupId>org.codehaus.jackson</groupId>
			<artifactId>jackson-jaxrs</artifactId>
		</dependency>

		<!-- 数字证书 -->
		<dependency>
			<groupId>com.git.middleobject</groupId>
			<artifactId>middleobject</artifactId>
			<version>1.0.0</version>
		</dependency>

		<dependency>
			<groupId>org.jdom</groupId>
			<artifactId>jdom</artifactId>
			<version>1.1</version>
		</dependency>

		<!-- json -->
		<dependency>
			<groupId>org.codehaus.jackson</groupId>
			<artifactId>jackson-core-asl</artifactId>
			<version>1.9.9</version>
		</dependency>

		<dependency>
			<groupId>org.codehaus.jackson</groupId>
			<artifactId>jackson-mapper-asl</artifactId>
			<version>1.9.9</version>
		</dependency>

		<dependency>
			<groupId>org.mybatis</groupId>
			<artifactId>mybatis</artifactId>
		</dependency>

		<dependency>
			<groupId>org.mybatis</groupId>
			<artifactId>mybatis-spring</artifactId>
		</dependency>

		<dependency>
			<groupId>com.dragonsoft.adapter</groupId>
			<artifactId>RBSPAdapter</artifactId>
		</dependency>

		<dependency>
			<groupId>commons-codec</groupId>
			<artifactId>commons-codec</artifactId>
		</dependency>
	</dependencies>
	<build>
		<finalName>${pom_finalName}</finalName>
		<plugins>
			<#if withJetty=="true">
			<plugin>
				<groupId>org.mortbay.jetty</groupId>
				<artifactId>jetty-maven-plugin</artifactId>
				<version>8.1.8.v20121106</version>
				<configuration>
					<scanIntervalSeconds>${scanIntervalSeconds}</scanIntervalSeconds>
					<webAppConfig>
						<contextPath>${contextPath}</contextPath>
					</webAppConfig>
				</configuration>
			</plugin>
			</#if>
			<#if withCargo=="true">
			<plugin>
				<groupId>org.codehaus.cargo</groupId>
				<artifactId>cargo-maven2-plugin</artifactId>
				<version>1.4.9</version>
				<configuration>
					<container>
						<containerId>${containerId}</containerId>
						<type>${containerType}</type>
					</container>
					<configuration>
						<type>${configurationType}</type>
						<properties>
							<cargo.hostname>${cargoHostname}</cargo.hostname>
							<cargo.servlet.port>${cargoServletPort}</cargo.servlet.port>
							<cargo.remote.username>${cargoRemoteUsername}</cargo.remote.username>
							<cargo.remote.password>${cargoRemotePassword}</cargo.remote.password>
						</properties>
					</configuration>
					<deployables>
						<deployable>
							<groupId>${groupId}</groupId>
							<artifactId>${artifactId}</artifactId>
							<type>${packaging}</type>
							<properties>
								<context>${context}</context>
							</properties>
						</deployable>
					</deployables>
				</configuration>
			</plugin>
			</#if>
		</plugins>
	</build>
</project>
