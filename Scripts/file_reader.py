import pandas as pd
import os


def read_file(columns):
    file_folder = os.path.join(os.getcwd(), 'Sources')

    archivo_xls = os.listdir(file_folder)[0]

    data = pd.read_excel(os.path.join(
        file_folder, archivo_xls), engine='openpyxl')

    data = data[columns]

    return data
