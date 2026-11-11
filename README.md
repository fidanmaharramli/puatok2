<p align="center">
  <img src="PustokMvcApp/wwwroot/image/logo.png" alt="Pustok" width="220" />
</p>

<h1 align="center">Pustok MVC Bookstore</h1>

<p align="center">
  A bookstore learning project with a dynamic catalog, an admin panel, email-based account recovery, and real-time chat.
</p>

<p align="center">
  <strong>ASP.NET Core MVC · .NET 10 · Entity Framework Core · SQL Server · Identity · SignalR</strong>
</p>

## About

PustokMvcApp explores how an ASP.NET Core MVC application connects database models, controllers, ViewModels, and Razor views. The storefront uses the Pustok template, while the management area uses SB Admin 2.

The project is under active development. It currently implements catalog browsing, basket operations, account management, and chat; it does not provide a complete checkout or payment flow.

## Features

| Area | Implemented functionality |
| --- | --- |
| Storefront | Database-driven sliders; featured, new, discounted, and tag-based book sections |
| Book details | Author information, image gallery, tags, and up to four related books by the same author |
| Quick view | Book information loaded into a Bootstrap modal using a partial view and `fetch` |
| Basket | Cookie storage for guests, database storage for signed-in users, item quantities, removal, and formatted totals |
| Accounts | Registration, email confirmation, login/logout, and password recovery using a six-digit email code |
| Administration | Create, read, edit, and delete books, authors, sliders, and users; manage uploaded book images |
| Roles | List and create roles; assign roles and change user passwords through the admin panel |
| User protection | Users in the `Admin` role cannot be deleted through the user management action |
| Chat | Authenticated group chat, online/offline indicators, and live typing notifications |

The **Best sellers** section is selected by tag, not calculated from sales. Book reviews remain template content.

## Technology

- **Backend:** C#, ASP.NET Core MVC, Razor views, dependency injection
- **Database:** SQL Server, Entity Framework Core 10, code-first migrations
- **Authentication:** ASP.NET Core Identity with cookie authentication and roles
- **Email:** MailKit/MimeKit, SMTP with STARTTLS, HTML email templates
- **Real-time communication:** ASP.NET Core SignalR
- **Frontend:** Bootstrap, jQuery, JavaScript Fetch API, Slick sliders, SweetAlert2

## Project structure

```text
PustokApp/
├── PustokMvcApp.slnx
└── PustokMvcApp/
    ├── Areas/Manage/         # Admin controllers, ViewModels, views, and layout
    ├── Controllers/          # Home, books, basket, accounts, and chat
    ├── Data/
    │   ├── AppDbContext.cs   # Catalog and Identity database context
    │   ├── Migrations/       # Existing database migrations
    │   └── Seed/             # SQL catalog snapshots and earlier demo scripts
    ├── Hubs/                # SignalR chat hub
    ├── Models/              # Books, authors, users, basket items, settings, etc.
    ├── Services/            # Email service and shared layout data
    ├── Settings/            # SMTP configuration model
    ├── ViewModels/          # Data passed between forms, controllers, and views
    ├── Views/               # Storefront pages and reusable partial views
    ├── wwwroot/             # CSS, JavaScript, images, admin assets, email templates
    ├── ServiceRegistration.cs
    ├── Program.cs
    └── appsettings.json
```

## Run locally

### 1. Requirements

- .NET 10 SDK
- Visual Studio with .NET 10 support for the Package Manager Console commands below
- SQL Server or SQL Server Express LocalDB; LocalDB requires Windows
- SQL Server Management Studio (SSMS) to run the seed and setup SQL
- An SMTP account that supports STARTTLS for confirmation and password recovery emails

Clone the repository, open `PustokMvcApp.slnx`, and restore packages. From the repository root:

```powershell
dotnet restore PustokMvcApp/PustokMvcApp.csproj
```

### 2. Configure the database and email

Set `ConnectionStrings:DefaultConnection` in `PustokMvcApp/appsettings.json` for your SQL Server instance. A LocalDB example is:

```json
"ConnectionStrings": {
  "DefaultConnection": "Server=(localdb)\\MSSQLLocalDB;Database=PustokDb;Trusted_Connection=True;TrustServerCertificate=True;"
}
```

The email service reads these keys from the `EmailSettings` section:

| Key | Purpose |
| --- | --- |
| `From` | Sender email address |
| `SmtpHost` | SMTP server hostname |
| `SmtpPort` | Provider's STARTTLS port, commonly `587` |
| `Username` | SMTP authentication username |
| `Password` | SMTP password or provider-issued app password |

Use your own SMTP credentials. Keep real credentials out of commits. For a terminal launch, environment variables can override the settings without changing a tracked file:

```powershell
$env:EmailSettings__From = "sender@example.com"
$env:EmailSettings__SmtpHost = "smtp.example.com"
$env:EmailSettings__SmtpPort = "587"
$env:EmailSettings__Username = "sender@example.com"
$env:EmailSettings__Password = "YOUR_SMTP_APP_PASSWORD"
```

Replace these placeholders with your provider's settings, then run the app from that same terminal. An already-running Visual Studio instance does not inherit these terminal variables.

### 3. Create the database schema

In Visual Studio, set `PustokMvcApp` as the startup project and select it as the **Default project** in **Tools → NuGet Package Manager → Package Manager Console**. Run:

```powershell
Update-Database
```

This applies the existing migrations. You do not need to create a new migration just to run the project on another computer.

### 4. Import the catalog

In SSMS, connect to the same SQL Server instance, select **PustokDb**, open [SeedData.sql](PustokMvcApp/Data/Seed/SeedData.sql), and execute it.

The snapshot contains **21 authors, 4 tags, 43 books, 4 sliders**, and their image/tag relationships. It inserts missing IDs without overwriting existing records. Use this snapshot on its own; do not also run the older `FrontendSeed.sql` and `HomeSectionsSeed.sql` scripts.

The snapshot is dated **2026-11-03**. It does not automatically include later edits made in another computer's database. It also does not include users, passwords, roles, baskets, or layout settings. Keep the corresponding image files under `wwwroot` when moving the project.

### 5. Add the required layout settings and roles

The shared layout expects five keys in `Settings`. Startup does not populate them automatically. For a fresh local database, run this example in SSMS with **PustokDb** selected:

```sql
INSERT INTO dbo.Settings ([Key], [Value])
SELECT s.[Key], s.[Value]
FROM (VALUES
    (N'logo', N'logo.png'),
    (N'footer-logo', N'logo--footer.png'),
    (N'phone', N'+000000000'),
    (N'address', N'Your bookstore address'),
    (N'email', N'contact@example.com')
) AS s([Key], [Value])
WHERE NOT EXISTS (
    SELECT 1 FROM dbo.Settings AS existing WHERE existing.[Key] = s.[Key]
);

INSERT INTO dbo.AspNetRoles (Id, Name, NormalizedName, ConcurrencyStamp)
SELECT CONVERT(nvarchar(36), NEWID()), r.Name, r.NormalizedName,
       CONVERT(nvarchar(36), NEWID())
FROM (VALUES (N'Admin', N'ADMIN'), (N'Member', N'MEMBER'))
    AS r(Name, NormalizedName)
WHERE NOT EXISTS (
    SELECT 1 FROM dbo.AspNetRoles AS existing
    WHERE existing.NormalizedName = r.NormalizedName
);
```

The logo values are filenames relative to `wwwroot/image`. Replace the sample contact details with your own. The `Member` role must exist before public registration assigns it to a new account.

### 6. Start the application

From the repository root, using the terminal where you configured SMTP:

```powershell
dotnet dev-certs https --trust
dotnet run --project PustokMvcApp/PustokMvcApp.csproj --launch-profile https
```

Open **https://localhost:7195**. You can also use the `https` launch profile in Visual Studio after configuring email for that process.

### 7. Access the admin panel

There is no automatic first-admin setup at startup. For your fresh local database:

1. Register an account at `/Account/Register` and confirm its email.
2. In SSMS, select **PustokDb** and assign that account the existing `Admin` role using the SQL below. Replace the example email with the account you just registered.
3. Sign out, then sign in at `/Manage/AdminAccount/Login` using that account's **username and password**.

```sql
INSERT INTO dbo.AspNetUserRoles (UserId, RoleId)
SELECT u.Id, r.Id
FROM dbo.AspNetUsers AS u
CROSS JOIN dbo.AspNetRoles AS r
WHERE u.NormalizedEmail = UPPER(N'your-admin@example.com')
  AND u.EmailConfirmed = 1
  AND r.NormalizedName = N'ADMIN'
  AND NOT EXISTS (
      SELECT 1 FROM dbo.AspNetUserRoles AS ur
      WHERE ur.UserId = u.Id AND ur.RoleId = r.Id
  );
```

This is a local bootstrap step, not a public registration feature. Once an admin is available, use the admin panel to manage user roles. Admin accounts use the separate admin login page; the storefront login rejects accounts in the `Admin` role.

## Main routes

| Route | Purpose | Access |
| --- | --- | --- |
| `/` | Storefront home page | Public |
| `/Books/Details/{id}` | Book details and related books | Signed-in users |
| `/Account/Register` | Account registration | Public |
| `/Account/Login` | Customer login | Public |
| `/Account/ForgotPassword` | Request a password recovery code | Public |
| `/Chat` | Group chat | Signed-in users |
| `/Manage/AdminAccount/Login` | Admin login | Public login form |
| `/Manage` | Admin dashboard | Admin role |
| `/Manage/Book` | Book management | Admin role |
| `/Manage/Author` | Author management | Admin role |
| `/Manage/Slider` | Slider management | Admin role |
| `/Manage/User` | User management | Admin role |
| `/Manage/Role` | Role management | Admin role |

## How the main flows work

- **Catalog:** `HomeController` loads book groups and sliders into `HomeVm`; Razor views render the sections and shared book cards.
- **Quick view:** JavaScript requests a book partial and inserts the returned HTML into a Bootstrap modal.
- **Basket removal:** A POST form sends the book ID and antiforgery token. The server updates the user's basket and returns a partial containing the new list and total.
- **Password recovery:** A six-digit code is emailed and stored with a 15-minute expiry. Requesting another code updates the existing record. A valid code is exchanged for an Identity password-reset token.
- **Chat:** Browsers connect to `/chatHub`. The hub broadcasts messages under the authenticated username, and typing events update the page without a reload.

To test chat with two accounts, use a normal browser window and an InPrivate/incognito window, or two different browsers. Ordinary tabs in the same browser profile share login cookies.

## Current scope

- Checkout, payments, and order processing are not implemented; some template navigation links remain placeholders.
- Chat messages are not stored. Reloading the page clears the visible conversation, and the current online-status tracking stores one connection ID per account.
- The SQL catalog snapshot is a development data export, not a full database backup. Migrations create the schema; they do not restore another machine's accounts or uploaded files.

To check compilation from the repository root:

```powershell
dotnet build PustokMvcApp/PustokMvcApp.csproj
```
