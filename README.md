https://github.com/brianfrankcooper/YCSB

YCBS dataset generator
====================================
generator datasets according to different worloads, and output to file

Getting Started
---------------

1. Download Redis and install [https://github.com/redis/redis]

    ```sh
    git clone https://github.com/redis/redis
    cd redis
    make
    ```
    
2. Write wordload cnofigure file in ./workload . We can set the key distribution, key length in this file. The guidelines can be found in [https://github.com/brianfrankcooper/YCSB/wiki/Implementing-New-Workloads]

3. Generate dataset

    First, start redis server

    ```sh
    cd redis
    src/redis-server --bind 127.0.0.1 --port 6379
    ```
    Then start ycsb.sh, which needs installing java and maven 
    ```sh
    cd YCSB-generator
    ./ycsb.sh <selected_workload> <loadnum> <runnum> <loadfile> <runfile>
    ```

Changing skewness of Zipfian distribution
--------------------

YCSB doesn't support change skewness by changing some parameters, the default skewness is 0.99.

If you want to generate datasets with different skewness, please modify these files below.



