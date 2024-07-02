from settings_ import get_settings
from playwright.sync_api import sync_playwright
from web_side import run_browser
from file_reader import read_file


def run():
    settings = get_settings()
    
    link = settings['link']

    form_settings_df = settings['form_settings_df']

    form_settings_df = form_settings_df[~(
        form_settings_df['campo_excel'] == 'NA')]
    
    social_dict = settings['channel_settings_df']

    df_columns = form_settings_df['campo_excel'].to_list()

    df = read_file(df_columns)
    
    df.columns = form_settings_df['campo_form'].to_list()

    with sync_playwright() as playwright:
        run_browser(playwright, link, df, form_settings_df, social_dict)


    input('Press any key to close...')

if __name__ == '__main__':
    run()
