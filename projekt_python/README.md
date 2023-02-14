Create Jupyter environment:

```bash
conda create --name ENVProjectPython python=3.10
```

Activate it:
- for Windows:
```bash
activate ENVProjectPython
```
- for MacOS:
```bash
source activate ENVProjectPython
```

Install packages:
```bash
conda install numpy
conda install pandas
conda install matplotlib
conda install seaborn
conda install cartopy
conda install folium
conda install plotly
```

Save Jupyter environment to file:
```bash
conda list --explicit >ENVProjectPython.txt
```

Restore virtual Jupyter environment on another computer:
```bash
conda create --name ENVProjectPython --file ENVProjectPython.txt
```
