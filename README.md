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


## Spark Application Execution Script

### Description
This script is designed to automate the execution of a PySpark application in a Dockerized Spark environment. It handles the data preparation, runs the PySpark script, and validates the output format.

### Data and Script Placement
- **Data File Placement**: The `caps.csv` data file is pre-loaded into the Docker image as specified in the `cs511p1-main.Dockerfile`.
- **PySpark Script Placement**: The `spark_app.py` script is also included in the Docker image during the build process, as defined in the `cs511p1-main.Dockerfile`.

### Execution Process
1. **Output Directory Creation**: The script starts by creating an output directory within the Docker container for storing execution results.
2. **Data Preparation**: `caps.csv` is copied from the Docker image to HDFS, making it accessible for the Spark application.
3. **Spark Application Execution**: The script executes the `spark_app.py` using `spark-submit`, and the output is captured in a designated file.

### Output Validation
- A regular expression check is incorporated into the script to ensure the output matches a specific format, verifying the correctness of the results.

Regex Script Used = '(\|[[:space:]]*[[:digit:]]{4}[[:space:]]*\|[[:space:]]*[[:digit:]]+-[[:digit:]]+-[[:digit:]]+[[:space:]]*\|)'

### Usage
- Run this script just like other's in project setup. It will automatically manage the data preparation, Spark application execution, and output validation.

After you run this command the given data will be sorted and stored as "test_sort.out" in the out folder. The result after running this is included here. 

### Image Proofs

![Running all the cases for Part 1, 2 and 3](https://github.com/MasterKinjalk/cs511p1/blob/master/All%20cases%20passed.png)

![Sorted Data Caps](https://github.com/MasterKinjalk/cs511p1/blob/master/Part%203%20after%20sorting.png)
