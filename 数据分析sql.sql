/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [MonitorApplication_id]
      ,[MonitorChannels_id]
      ,[Room_id]
      ,[Object_id]
      ,[type]
  FROM [jmsxpt2016].[dbo].[Base_MonitorApplication]
  
  --[Base_MonitorApplication].OBJECT_ID 与[Base_RoomType].roomtype_id（关联）
  