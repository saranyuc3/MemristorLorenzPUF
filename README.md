# Lorenz System Based Memristor PUF
Lorenz Circuit-assisted memristor PUF dataset and HSPICE circuit netlists

The .sp file contains the netlist for the entire circuit including the PUF. PTM 45nm library is hardcoded in the file. 

The dataset folder contains all the data used for modelling attacks. Each file is named based on their size and probability of likelihood of occurance of SDK. For example, response_mixed_5000_0.5.csv corresponds to a dataset of 5000 responses taken from CRPs which have a 50% likelihood of being SDK. The class_\*.csv datasets are labels for CRP_\*.csv dataset and labels each CRP in the later as SDK (0) or non-SDK (1).
