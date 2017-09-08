# Data file
# RIG,1504881464,riglx01,6,161.476,162.170,16404,0,,,,,930,1263800
# tmp file
# 1504881464,riglx01,6,161.476,162.170,16404,0,,,,,930,1263800

LOAD DATA LOCAL INFILE './tmp/rig_status.tmp'
INTO TABLE rigdata.status_rig
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
(@var1, rig_name, working_gpus, current_hashrate_eth, average_hashrate_eth, total_shares_eth, total_rej_shares_eth, current_hashrate_dcoin, average_hashrate_dcoin, total_shares_dcoin, total_rej_shares_dcoin, power_usage, mining_time) SET time = FROM_UNIXTIME(@var1);

# Data file
# GPU,1504881464,riglx01/0,27.198,2804,25,,,,74,55
# tmp file
# 1504881464,riglx01/0,27.198,2804,25,,,,74,55

LOAD DATA LOCAL INFILE './tmp/gpu_status.tmp'
INTO TABLE rigdata.status_gpu
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
(@var1, rig_gpu_id, gpu_hashrate_eth, gpu_shares_eth, gpu_inc_shares_eth, gpu_hashrate_dcoin, gpu_shares_dcoin, gpu_inc_shares_dcoin, gpu_temp, gpu_fan) SET time = FROM_UNIXTIME(@var1);

