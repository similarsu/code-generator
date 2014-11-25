<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
"http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="${packageName}.mapper.${className}Mapper">
	<resultMap type="${className}" id="${className}Mapper">
		<#list columns as column>
			<#if column.isPrivate==1>
		<id column="${column.columnName}" property="${column.propName}"/>
			<#else>
		<result column="${column.columnName}" property="${column.propName}"/>
			</#if>	
		</#list>
	</resultMap>
	
	<select id="findAll" parameterType="${className}" resultMap="${className}Mapper">
		<if test="isPager==true">
			<![CDATA[
				select * from(
				select r1.*,rownum as rn from(
			]]>
		</if>
		<![CDATA[
				select * from ${tableName}
		]]>
		<if test="isPager==true">
			<![CDATA[
				) r1 where rownum<=(${r"#{"}offset${r"}"}+${r"#{"}size${r"}"})
				) where rn>${r"#{"}offset${r"}"}
			]]>
		</if>
	</select>
	
	<select id="getCount" parameterType="${className}" resultType="int">
		<![CDATA[
			select count(*) from ${tableName}
		]]>
	</select>
	
	<insert id="add" parameterType="${className}">
		<selectKey order="BEFORE" keyProperty="id" resultType="long">
			select s_${tableName}.nextval from dual
		</selectKey>
		<![CDATA[
			insert into ${tableName}(<#list columns as column>${column.columnName}<#if column_has_next>,</#if></#list>) values(<#list columns as column>${r"#{"}${column.propName}${r"}"}<#if column_has_next>,</#if></#list>)
		]]>
	</insert>
	
	<delete id="delete" parameterType="long">
		<![CDATA[	
			delete from ${tableName} where id=${r"#{"}id${r"}"}
		]]>
	</delete>
	
	<update id="update" parameterType="${className}">
		<![CDATA[
			update ${tableName} set <#list columns as column><#if column.isPrivate!=1>${column.columnName}=${r"#{"}${column.propName}${r"}"}<#if column_has_next>,</#if></#if></#list> where id=${r"#{"}id${r"}"}
		]]>
	</update>
	
	<select id="load" parameterType="long" resultMap="${className}Mapper">
		<![CDATA[
			select * from ${tableName} where id=${r"#{"}id${r"}"}
		]]>
	</select>
</mapper>
