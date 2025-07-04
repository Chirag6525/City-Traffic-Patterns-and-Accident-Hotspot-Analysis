import pandas as pd
import numpy as np

# Load and explore datasets
crashes = pd.read_csv('../data/raw/crashes.csv')
vehicles = pd.read_csv('../data/raw/vehicles.csv')
persons = pd.read_csv('../data/raw/persons.csv')

# Basic exploration
print(f"Crashes shape: {crashes.shape}")
print(f"Vehicles shape: {vehicles.shape}")
print(f"Persons shape: {persons.shape}")

# Check columns
print("\nCrashes columns:")
print(crashes.columns.tolist())

# Check data types and missing values
print("\nMissing values in crashes:")
print(crashes.isnull().sum())

# Date range
print(f"\nDate range: {crashes['CRASH DATE'].min()} to {crashes['CRASH DATE'].max()}")