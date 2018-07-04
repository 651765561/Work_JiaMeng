/*
Base_RoomType.bittype
控申为民服务中心=控申（为民）
(自侦办案区+刑检办案区)= 办案中心
机关重要场所=机关安保

*/
SELECT *FROM Base_MonitorServer

/*行政区获取*/
  SELECT Base_Unit_id,* FROM base_unit 
  WHERE parent_unit_id IN('0','e2c79c56-5b58-4c62-b2a9-3bb7492c')
  ORDER BY Base_Unit_id DESC
  
  SELECT * FROM base_unit WHERE parent_unit_id IN('648f2750-505e-4a34-9b71-f4ea5861')
  ORDER BY Base_Unit_id DESC
  
  /*获取不同类型通道信息*/
  
  SELECT * FROM  dbo.Base_MonitorApplication
  SELECT * FROM dbo.Base_RoomType
    SELECT a.* FROM  dbo.Base_MonitorApplication AS a, Base_RoomType AS r
    WHERE a.Object_id=r.RoomType_id AND  r.bigtype IN ('自侦办案区','刑检办案区')
    /*获取不同行政单位不同的通道id*/
    SELECT MAX(u.unit) AS unit,COUNT(u.Base_Unit_id) AS num  ,MAX(u.Base_Unit_id)
    FROM dbo.Base_Unit AS u , dbo.Base_MonitorServer AS s,
    dbo.Base_MonitorChannels AS c ,dbo.Base_MonitorApplication AS a,
    Base_RoomType AS t
    WHERE u.Base_Unit_id =s.Unit_id  AND s.MonitorServer_id=c.MonitorServer_id
    AND c.MonitorChannels_id=a.MonitorChannels_id  AND t.RoomType_id=a.Object_id
   AND t.bigtype IN ('自侦办案区','刑检办案区')
    AND u.parent_unit_id IN('0','e2c79c56-5b58-4c62-b2a9-3bb7492c')
    GROUP BY u.Base_Unit_id
    ORDER BY u.Base_Unit_id
    
    /*获取指定地市级所属的县区级指定通道信息统计*/
SELECT MAX(u.unit) AS unit,COUNT(u.Base_Unit_id) AS num  ,MAX(u.Base_Unit_id)
    FROM dbo.Base_Unit AS u , dbo.Base_MonitorServer AS s,
    dbo.Base_MonitorChannels AS c ,dbo.Base_MonitorApplication AS a,
    Base_RoomType AS t
    WHERE u.Base_Unit_id =s.Unit_id  AND s.MonitorServer_id=c.MonitorServer_id
    AND c.MonitorChannels_id=a.MonitorChannels_id  AND t.RoomType_id=a.Object_id
   AND t.bigtype IN ('自侦办案区','刑检办案区')
   AND u.parent_unit_id IN('8031f191-75f9-40b1-aded-ab45aa7392e0')
   GROUP BY u.parent_unit_id
    --办案中心  办案中心
    SELECT * FROM dbo.Base_RoomType  WHERE bigtype IN ('自侦办案区','刑检办案区')