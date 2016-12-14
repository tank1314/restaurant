
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `${tabletop}${objectNameLower}`
-- ----------------------------
DROP TABLE IF EXISTS `${tabletop}${objectNameLower}`;
CREATE TABLE `${tabletop}${objectNameUpper}` (
 		`${objectNameLower}_id` varchar(100) NOT NULL,
	<#list fieldList as var>
		<#if var[1] == 'Integer'>
		`${var[0]}` int(${var[5]}) NOT NULL COMMENT '${var[2]}',
		<#else>
		`${var[0]}` varchar(${var[5]}) DEFAULT NULL COMMENT '${var[2]}',
		</#if>
	</#list>
  		PRIMARY KEY (`${objectNameLower}_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
