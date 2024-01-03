"""lecture .env file"""
import os
from dotenv import load_dotenv, find_dotenv

load_dotenv(find_dotenv())

DB_HOST = os.getenv("DB_HOST")
DB_PASSWORD=os.getenv("DB_PASSWORD")
DB_USERNAME=os.getenv("DB_USER")
DB_DATABASE=os.getenv("DB_DATABASE")
DB_DSN=os.getenv("DB_DSN")
