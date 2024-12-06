# vim firsttest.py
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service

options = Options()
options.add_argument('--no-sandbox')
options.add_argument('--headless')
options.add_argument('--disable-dev-shm-usage')

service = Service('/usr/bin/chromedriver')  # Explicit path to chromedriver
driver = webdriver.Chrome(service=service, options=options)

#driver = webdriver.Chrome(options=options)

driver.get("https://www.selenium.dev/selenium/web/web-form.html")

title = driver.title
assert title == "Web form"

driver.implicitly_wait(0.5)

text_box = driver.find_element(by=By.NAME, value="my-text")
submit_button = driver.find_element(by=By.CSS_SELECTOR, value="button")

text_box.send_keys("Selenium")
submit_button.click()

message = driver.find_element(by=By.ID, value="message")
value = message.text
print(value)

assert value == "Received!"
driver.quit()
