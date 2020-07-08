#!/bin/bash
if [ "$1" == "" ]; then
	echo "Usage: $0 <selected_workload> <loadnum> <runnum> <loadfile> <runfile> "
	echo "Example: $0 workloada 100 100 /home/a_100_load /home/a_100_run"
	exit
fi

selected_workload="$1"
load_num="$2"
run_num="$3" 
load_file="$4"
run_file="$5"

cd redis/src/main/java/site/ycsb/db
sed -i "66cpublic static final String file=\"$load_file\";" RedisClient.java
cd - 
mvn -pl site.ycsb:redis-binding -am clean package -Dcheckstyle.skip=true
cd redis/target
tar xfvz ycsb-redis-binding-0.18.0-SNAPSHOT.tar.gz
cd -
cd redis/target/ycsb-redis-binding-0.18.0-SNAPSHOT/workloads
sed -i "24crecordcount=$load_num" $selected_workload
sed -i "25coperationcount=$run_num" $selected_workload
cd -
cd redis/target/ycsb-redis-binding-0.18.0-SNAPSHOT
./bin/ycsb load redis -s -P workloads/$selected_workload -p "redis.host=127.0.0.1" -p "redis.port=6379" >outputLoad.txt

cd -
cd redis/src/main/java/site/ycsb/db
sed -i "66cpublic static final String file=\"$run_file\";" RedisClient.java
cd - 
mvn -pl site.ycsb:redis-binding -am clean package -Dcheckstyle.skip=true
cd redis/target
tar xfvz ycsb-redis-binding-0.18.0-SNAPSHOT.tar.gz
cd -
cd redis/target/ycsb-redis-binding-0.18.0-SNAPSHOT/workloads
sed -i "24crecordcount=$load_num" $selected_workload
sed -i "25coperationcount=$run_num" $selected_workload
cd -
cd redis/target/ycsb-redis-binding-0.18.0-SNAPSHOT
./bin/ycsb run redis -s -P workloads/$selected_workload -p "redis.host=127.0.0.1" -p "redis.port=6379" >outputLoad.txt
