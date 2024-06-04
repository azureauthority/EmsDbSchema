Microsoft.EntityFrameworkCore
Microsoft.EntityFrameworkCore.SqlServer
Microsoft.EntityFrameworkCore.Tools
Microsoft.EntityFrameworkCore.Relational
Microsoft.EntityFrameworkCore.Design

Scaffold-DbContext "Server=<>;Database=<>;Trusted_Connection=True;" Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models
