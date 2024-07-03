def run_browser(playwright, link, df, form_settings_df, social_dict):

    df_columns = df.columns

    for index, row in df.iterrows():

        browser = playwright.chromium.launch(headless=True)

        context = browser.new_context()

        page = context.new_page()

        page.goto(link, wait_until='networkidle')

        for col in df_columns:

            field = col
            value = row[field]

            type_of_input = form_settings_df[
                form_settings_df['campo_form'] == field
            ]['type'].to_list()[0]

            if type_of_input != 'Select':
                fill_input(col, page, value)
            else:
                selection = social_dict[
                    social_dict['campo_excel'] == value
                ]['campo_form'].to_list()[0]
                fill_selector(col, page, selection)

        page.evaluate(
            """
            () => {
                document.getElementsByClassName('btn')[0].click();
                console.log('clicked!');
            }
            """
        )

        page.wait_for_selector(
            '//p[text()="GRACIAS POR SU REGISTRO"]', timeout=10000)

        page.evaluate(
            """
            () => {
                document.cookie.split(';').forEach(function(c) { 
                    document.cookie = c.trim().split("=")[0] + '=;expires=Thu, 01 Jan 1970 00:00:00 UTC;path=/'; 
                });
            }
            """
        )
        browser.close()

        print(f'{index+1} cargado')

    print('\nHe cargado todos los registros')


def fill_input(label_name, page, value):
    label_selector = f"//label[text()='{label_name}']/following-sibling::div/input"
    page.fill(label_selector, str(value))


def fill_selector(label_name, page, value):
    label_selector = f"//label[text()='{label_name}']/following-sibling::div/select"
    page.select_option(label_selector, str(value))
