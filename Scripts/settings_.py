from openpyxl import load_workbook
import os
import pandas as pd


def get_settings():

    try:

        settings_folder = os.path.join(os.getcwd(), 'Settings')

        settings_file = 'Settings.xlsx'

        # variables del Excel como la hoja
        workbook = load_workbook(filename=os.path.join(
            settings_folder, settings_file))
        sheet = workbook['Settings']

        link = sheet['C3'].value

        # Variables que indican cuando parar en el bucle
        campos_form_limit = sheet['C5'].value
        form_settings_df = bucle_settings(campos_form_limit, sheet, 'B', 'C', 'D')

        # Variables que indican cuando parar en el bucle
        channel_limit = sheet['H5'].value
        channel_settings_df = bucle_settings(channel_limit, sheet, 'G', 'H', 'I')

        return {
            'link': link,
            'form_settings_df': form_settings_df,
            'channel_settings_df': channel_settings_df
        }

    except Exception as e:
        print('Error in settings.py')
        print(e)


def bucle_settings(limit, sheet, letter1, letter2, letter3):
    data_list = []
    # Bucle para recorrer la tabla de fields en el archivo settings
    for i in range(8, int(limit)+8):

        register = {
            'campo_form': sheet[f'{letter2}{i}'].value,
            'campo_excel': sheet[f'{letter1}{i}'].value,
            'type': sheet[f'{letter3}{i}'].value
        }

        data_list.append(register)

    df = pd.DataFrame(data_list)

    return df
