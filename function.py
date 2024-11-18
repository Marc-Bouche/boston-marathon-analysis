# Import essential libraries
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import re
import math
import time
from datetime import datetime


# Import statistical libraries
from scipy.stats import (
    ttest_ind,
    mannwhitneyu,
    shapiro,
    kstest,
    wilcoxon
)

# Import APIs and requests with caching and retry capabilities
import requests
import requests_cache
from retry_requests import retry
from requests.adapters import HTTPAdapter
from requests.packages.urllib3.util.retry import Retry
import pytz
import openmeteo_requests  # Ensure this package is installed or needed

# Import MySQL connector
from sqlalchemy import create_engine

# Machine Learning libraries
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestRegressor

#---------------------------------------------------------------------------------------------------#

# Function 1
# Function to convert pace (mm:ss) to kph

def convert_pace_to_kph(pace):
    if pd.isna(pace) or pace == '-':
        return None
    try:
        minutes, seconds = map(int, pace.split(':')[1:])  # Get minutes and seconds
        total_seconds = minutes * 60 + seconds
        return (3600 / total_seconds) * 1.60934  # Convert to kph
    except Exception as e:
        print(f"Error processing pace {pace}: {e}")
        return None

#---------------------------------------------------------------------------------------------------#

# Function 2
# Function to convert speed (kph) to pace (H:MM:SS)

def speed_to_pace_kmh(speed):
    if speed is None or speed <= 0:
        return None
    total_seconds = (1 / speed) * 3600
    hours, remainder = divmod(total_seconds, 3600)
    minutes, seconds = divmod(remainder, 60)
    return f"{int(hours)}:{int(minutes):02}:{int(seconds):02}"
    
#---------------------------------------------------------------------------------------------------#

# Function 3
# Function to format timedelta to 'HH:MM:SS' and handle negative values

def format_timedelta(td):
    total_seconds = int(td.total_seconds())
    sign = '-' if total_seconds < 0 else ''  # Determine the sign
    total_seconds = abs(total_seconds)  # Make the total seconds positive for formatting
    
    hours = total_seconds // 3600
    minutes = (total_seconds % 3600) // 60
    seconds = total_seconds % 60
    return f"{sign}{hours:02}:{minutes:02}:{seconds:02}"

#---------------------------------------------------------------------------------------------------#

# Function 4
# Function to convert time in 'mm:ss' or 'h:mm:ss' format to total seconds

def time_to_seconds(time_str):
    # Check if the time has hours (e.g., '1:15:23') or just minutes and seconds ('15:23')
    if ':' in time_str:
        parts = time_str.split(':')
        if len(parts) == 2:  # minutes:seconds format
            minutes, seconds = parts
            return int(minutes) * 60 + int(seconds)
        elif len(parts) == 3:  # hours:minutes:seconds format
            hours, minutes, seconds = parts
            return int(hours) * 3600 + int(minutes) * 60 + int(seconds)
    return 0
    
#---------------------------------------------------------------------------------------------------#
