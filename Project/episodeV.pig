inputFile = LOAD 'hdfs:///user/root/episodesV_dialogues.txt' USING PigStorage('\t') AS (name:chararray,dial:chararray);
GroupByName = GROUP inputFile BY name;
CountDia = FOREACH GroupByName GENERATE $0 as name, COUNT($1) AS CountVal;
name_order = ORDER CountDia BY CountVal DESC;
STORE name_order INTO 'hdfs:///user/root/pigOutputEpisodeV' USING PigStorage('\t');