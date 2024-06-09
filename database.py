from sqlalchemy import create_engine, text

# MySQL database details
hostname = "bnmxmc1oa4gjmdzpizlf-mysql.services.clever-cloud.com"
db_name = "bnmxmc1oa4gjmdzpizlf"
username = "ut66dkwvd5yvmkwg"
password = "uWfo0yELOLwLRF4vE603"
port = 3306

# Create engine
engine = create_engine(f'mysql+pymysql://{username}:{password}@{hostname}:{port}/{db_name}?charset=utf8mb4')

# Test the connection
# with engine.connect() as connection:
#     result = connection.execute(text("SELECT 1"))
#     print("Connection successful!" if result.fetchone()[0] == 1 else "Connection failed!")