--This function defines three partitions based on dates: 
--one for data before 2022, one for 2022, one for 2023, and one for 2024 onwards.

CREATE PARTITION FUNCTION [MyPartitionFunction](DATETIME)
AS RANGE RIGHT FOR VALUES ('2022-01-01', '2023-01-01', '2024-01-01');
