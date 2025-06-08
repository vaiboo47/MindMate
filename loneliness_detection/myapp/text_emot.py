# import re
# from collections import Counter
# from sklearn.model_selection import train_test_split
# from sklearn.metrics import accuracy_score
# from sklearn.svm import SVC
# from sklearn.svm import LinearSVC
# from sklearn.ensemble import RandomForestClassifier
# from sklearn.tree import DecisionTreeClassifier
#
# def read_data(file):
#     data = []
#     with open(file, 'r')as f:
#         for line in f:
#             line = line.strip()
#             label = ' '.join(line[1:line.find("]")].strip().split())
#             text = line[line.find("]")+1:].strip()
#             data.append([label, text])
#     return data
#
# file = '/kaggle/input/text-dataset-for-text-emotion-detection/text.txt'
# data = read_data(file)
# print("Number of instances: {}".format(len(data)))

import nltk
nltk.download('omw-1.4')