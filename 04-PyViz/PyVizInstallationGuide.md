# PyViz Installation Guide

PyViz is a Python visualization package that provides a single platform to access multiple visualization packages, including Matplotlib, Plotly Express, hvPlot, Panel, D3.js, etc.

Follow the steps below to install and set up PyViz in your Python environment.

**NOTE:** Make sure that you are using your conda environment that has anaconda installed. Create a new environment using:

```shell
conda create -n pyvizenv python=3.7 anaconda
conda activate pyvizenv
```

Before installing the PyViz dependencies, you need to install a couple of libraries. First, install the `python-dotenv` library using `pip` to work with environment variables.

```shell
pip install python-dotenv
```

Next, install the `nb_conda` package that will allow you to switch between virtual environments in Jupyter lab.

```shell
conda install -c anaconda nb_conda
```

Follow the next steps to install PyViz and all its dependencies in your Python virtual environment.

1. Download the PyViz dependencies **nodejs** and **npm** (included in nodejs).

    ```shell
    conda install -c conda-forge nodejs
    ```

2. Use the `conda install` command to install the following packages. Note: On some of these installs, you may get a message that says that the requested packages are already installed. That is fine.

    ```shell
    conda install -c pyviz holoviz
    conda install -c pyviz hvplot
    conda install -c plotly plotly
    conda install -c pyviz panel
    conda install -c pyviz pyviz
    ```

3. PyViz installation also requires the installation of Jupyter Lab extensions. These extensions are used to render PyViz plots in Jupyter Lab. Execute the below commands to install the necessary Jupyter Lab extensions for PyViz and Plotly Express.

    * Avoid "JavaScript heap out of memory" errors during extension installation

      ```shell
      # (OS X/Linux)
      export NODE_OPTIONS=--max-old-space-size=4096

      # (Windows)
      set NODE_OPTIONS=--max-old-space-size=4096
      ```

    * Install the Jupyter Lab extensions

      ```shell
      jupyter labextension install @jupyter-widgets/jupyterlab-manager --no-build

      jupyter labextension install jupyterlab-plotly@4.6.0 --no-build

      jupyter labextension install plotlywidget@4.6.0 --no-build

      jupyter labextension install @pyviz/jupyterlab_pyviz --no-build
      ```

    * Build the extensions (This may take a few minutes)

      ```shell
      jupyter lab build
      ```

    * After the build, unset the node options that you used above.

      ```shell
      # Unset NODE_OPTIONS environment variable
      # (OS X/Linux)
      unset NODE_OPTIONS

      # (Windows)
      set NODE_OPTIONS=
      ```

4. Use the `conda list package_name` command, substituting `package_name` for each of the installed packages, `holoviz`, `hvplot` and `panel` to confirm installation of all PyViz packages. Look for version numbers with at least the following versions:

    ```shell
    conda list holoviz
    conda list hvplot
    conda list panel
    ```

    ```text
    holoviz                   0.11.3
    hvplot                    0.5.2
    panel                     0.9.5
    ```

5. Use the `conda list plotly` function to confirm proper Plotly package installation.

  * Make sure that you have the following version installed:

    ```shell
    conda list plotly
    ```

    ```text
    plotly                    4.6.0
    ```

6. You will also need to register for a public mapbox API key. You can find detailed installation instructions on [Plotly's documentation page](https://plotly.com/python/scattermapbox/#mapbox-access-token-and-base-map-configuration).

Now you're all set to get started creating visual masterpieces using PyViz technologies!

---

## Troubleshooting

If you experience blank plots rendering in your Jupyter Lab preview, try the following steps:

1. First, make sure you are not importing `hvplot.pandas` before a `pn.extension()`.  Loading `hvplot.pandas` first initializes a Holoviews extension and causes the Panel extension to fail.

2. Next, clear your browser cache.

    - If using Chrome, you can do this by right clicking and choosing `Inspect` from the drop menu.

    - Next, hold down click on the browser reload button which will cause another drop down menu to appear.  From this menu select `Empty Cache and Hard Reload`.

3. Then clear the Kernel cache:

    - Click the `Kernel` drop down menu inside Jupyter Lab.  From this menu, click `Restart Kernel and Clear Outputs`.

4. After these steps are completed, re-run your notebook.

If you have issues with PyViz or Jupyter Lab, you may need to update your Conda environment. Follow the steps below to update the environment and then go back to the install guide to complete a fresh installation of PyViz.

1. Deactivate your current Conda environment. This is required in order to update the global Conda environment. Be sure to quit any running applications such as Jupyter prior to deactivating the environment.

    ```shell
    conda deactivate
    ```

2. Update Conda.

    ```shell
    conda update conda
    ```

3. Create a fresh Conda environment to use with PyViz.

    ```shell
    conda create -n pyvizenv python=3.7 anaconda
    ```

4. Activate the new environment.

    ```shell
    conda activate pyvizenv
    ```

5. Install the PyViz dependencies following the guide above.

---

© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
