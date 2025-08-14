import sqlite3
import pandas as pd
import matplotlib.pyplot as plt

# Connect to the database
conn = sqlite3.connect("sales_data.db")

# Query to get total quantity and revenue per product
query = '''
SELECT product_name, SUM(quantity) AS total_qty, SUM(quantity*price) AS revenue
FROM sales
GROUP BY product_name
ORDER BY revenue DESC;
'''

df = pd.read_sql_query(query, conn)

# Display dataframe
print(df)

# Plot bar chart for revenue by product
plt.figure()
plt.bar(df["product_name"], df["revenue"])
plt.title("Revenue by Product")
plt.xlabel("Product")
plt.ylabel("Revenue")
plt.xticks(rotation=45)
plt.tight_layout()
plt.savefig("sales_chart.png")
plt.show()

conn.close()
