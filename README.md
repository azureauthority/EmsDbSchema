- Install-Package Microsoft.EntityFrameworkCore
- Install-Package Microsoft.EntityFrameworkCore.SqlServer
- Install-Package Microsoft.EntityFrameworkCore.Tools
- Install-Package Microsoft.EntityFrameworkCore.Relational
- Install-Package Microsoft.EntityFrameworkCore.Design

Scaffold-DbContext "Server=<>;Database=<>;Trusted_Connection=True;TrustServerCertificate=True" Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models

Scaffold-DbContext "Server=<>;Database=<>;User Id=<>;Password=<>;TrustServerCertificate=True" Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models

Scaffold-DbContext "Server=<>;Database=<>;Trusted_Connection=True;TrustServerCertificate=True" Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models -DataAnnotations -ContextDir <> -Context <>
