# Setup

Python code relies heavily on external libraries. Because external libraries update regularly, it is highly recommended to keep track of versions of packages you are using in a given project. This will ensure that you are not introducing bugs when updating a package (e.g. for a different project). 

Creating a virtual environment is perhaps the most efficient way to implement this. In this tutorial, we will create a virtual environment and work exclusively in this virtual environment. 

Many of these material are based on [Sebastian Hohmann's GIS course](https://github.com/sebastianhohmann/gis_course). 

## 1 Conda
- Go [here](https://docs.conda.io/en/latest/miniconda.html) and download the installer appropriate for your system (choose Python 3.9). **IMPORTANT: Do NOT choose the latest one, but scroll down a bit to the one called "Python 3.9"**
- Keep the defaults for installation (adjust the path if you want to, keep conda as default python ticked, dont add to PATH).
- Once installed, `Start -> Anaconda3 (64-bit) -> Anaconda Prompt (Miniconda3)` (you can add the conda command prompt to your task bar for easy access).
- Run the following command in the conda prompt:

```
conda update conda
```

## 2 Creating a virtual environment
- Create a folder where you would like to keep your virtual environment
- Then run the following:

```
conda create --prefix="/path/to/your/folder/envpygis"
conda activate "/path/to/your/course/folder/envpygis"
```

- This will create a virtual enviroment in your folder called `envpygis` which will not have any dependencies installed yet.

## 3 Installing packages
- Within the conda prompt with the `envpygis` actiavted, run the following:

```
conda install pygeos --channel conda-forge
conda install numpy pandas matplotlib shapely geopandas -c conda-forge
conda install -c conda-forge nodejs
conda install -c conda-forge jupyterlab
conda install -c conda-forge rasterstats
conda install -c plotly plotly 
conda install --channel conda-forge esda
conda install geopy -c conda-forge
conda install contextily -c conda-forge
conda install mapclassify -c conda-forge
conda install networkx -c conda-forge
```

## 4 Open Jupyterlab
- Jupyter (Lab & Notebook) offers an interactive environment for Python coding. It allows you to run code partially (cells) and see output immediately.
- To open a jupyter lab enviroment run the following within the conda prompt:

```
jupyter lab --notebook-dir="path/to/your/course/folder/"
```
- If Jupyter Lab/Notebook do not open, you can install them using Anaconda Navigator
- Open Anaconda navigator -> "Run Applications on:" -> `envpygis`
- Install Jupyter Notebook/Lab

## 5 Import your packages
- You can load packages by typing the following within the Jupyter Lab/Notebook:

```
import pandas as pd
import geopandas as gpd
```

## 6 Loading shapefiles
- A common object you will be working with is a shapefile (`.shp`).
- Here's an example of loading a shapefile and plotting it:

```
#you might want to adjust the path name:
file_path = './data/ne_10m_admin_0_countries/ne_10m_admin_0_countries.shp' 
world = gpd.read_file(file_path)
world.plot(figsize=(10, 6))
```

## 7 Useful references
- [Getting started with conda guide](https://docs.conda.io/projects/conda/en/latest/user-guide/getting-started.html)
- [conda cheetsheat](https://docs.conda.io/projects/conda/en/4.6.0/_downloads/52a95608c49671267e40c689e0bc00ca/conda-cheatsheet.pdf)
- [Working with Virtual Environments](https://realpython.com/python-virtual-environments-a-primer/)