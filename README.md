# To download

First time: ```git clone https://github.com/nguyenhongphat0/UserManagement```

Next times: ```git pull```

# To run

Step 1: Open with NetBeans

Step 2: Go to ```META-INF/context.xml``` and config the datasource
```xml
<Resource
    name="Datasource"
    auth="Container"
    type="javax.sql.DataSource"
    driverClassName="com.microsoft.sqlserver.jdbc.SQLServerDriver"
    url="jdbc:sqlserver://localhost:1433;databaseName=UserManagement"
    username="sa"
    password="P@ssword"
/>
```

Step 3: F6
