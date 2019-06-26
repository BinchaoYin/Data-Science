import random
import os
# clean up
#if os.path.exists("training_iris.data"):
#    os.remove("training_iris.data")
#if os.path.exists("test_iris.data"):
#    os.remove("test_iris.data")
# open source
original_file = open("Raw_data/iris.data", "r")
# create output (w+, create new one anyway)
training_file = open("training_iris.data", "w+")
test_file = open("test_iris.data", "w+")
# select: 1/3 - test ; 2/3 - training
for i in original_file:
    seed = random.randint(1, 100000000000)
    if seed % 3 == 0:
        test_file.write(i)
    else:
        training_file.write(i)
# close files
original_file.close()
training_file.close()
test_file.close()

