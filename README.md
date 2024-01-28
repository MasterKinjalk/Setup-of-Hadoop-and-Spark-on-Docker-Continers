# CS 511: Project 1 HDFS/Spark

Please refer to the instructions at [https://ddkang.github.io/teaching/2024-spring/p1](https://ddkang.github.io/teaching/2024-spring/p1).

To get started, spin up the cluster.
```bash
bash start-all.sh
```

Test HDFS deployment.
```bash
bash test_hdfs.sh
```

Test Spark deployment.
```bash
bash test_spark.sh
```
### Additional Material for Part 3: 

```bash
bash test_sort.sh
```

After you run this command the given data will be sorted and stored as "test_sort.out" in the out folder. The result after running this is included here. 

Apart from this in the sorting folder the datafile caps.csv and spark_app.py(the app that sorts the csv file inside the docker) is present. It uses pyspark. 

### Image Proofs

![Running all the cases for Part 1, 2 and 3](https://github.com/MasterKinjalk/cs511p1/blob/master/All%20cases%20passed.png)

![Sorted Data Caps](https://github.com/MasterKinjalk/cs511p1/blob/master/Part%203%20after%20sorting.png)
