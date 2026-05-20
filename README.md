# Essam Procurement Solution - Supabase Auth Setup

This version keeps the GitHub Pages single-file frontend, adds Supabase login, and stores each user's data in a private workspace.

## Files

- `index.html` loads the Supabase browser client, asks for username/password, and syncs app modules to Supabase.
- `supabase-config.example.js` is a template. Copy it to `supabase-config.js` and fill in your project values before deploying.
- `supabase-auth-setup.sql` creates the required tables and Row Level Security policies.

The Supabase anon key is public in browser apps. Security must come from Row Level Security policies, not from hiding the anon key.

## Create Supabase Project

1. Create a project at Supabase.
2. Open Project Settings, then API.
3. Copy the Project URL into `SUPABASE_URL`.
4. Copy the anon public key into `SUPABASE_ANON_KEY`.
5. Create `supabase-config.js` beside `FlowManager01.html`:

```js
window.SUPABASE_CONFIG = {
  SUPABASE_URL: 'https://YOUR-PROJECT-REF.supabase.co',
  SUPABASE_ANON_KEY: 'YOUR-SUPABASE-ANON-KEY'
};
```

## Required Tables And Security

Open Supabase, go to SQL Editor, and run the full contents of `supabase-auth-setup.sql`.

## Data Modules

The app syncs these modules:

- Projects: `eps_projects`
- Tasks: `eps_tasks`
- Meetings: `eps_meetings`
- Notes: `eps_notes`
- Contacts / Vendors: `eps_contacts`
- Team members: `eps_team_members`
- Packages: `eps_packages`
- BOQ items: `eps_boq_items`
- Price library items: `eps_price_items`
- LPO items: `eps_lpo_items`
- App settings such as specialties, notifications, trash, units, theme, and daily focus: `eps_app_settings`

Each record keeps the original app object in `payload` so existing UI features continue to work.

## Create Users

Users can now create their own account from the app using the `Create account` link on the login screen.

For smooth username/password login, open Supabase, go to Authentication, then Providers, and disable email confirmation for this internal app.

You can still create users manually from Supabase:

1. Go to Authentication, then Users, then Add user.
2. For username `ahmed`, use email `ahmed@eps.local` and set his password.
3. Give each person a different username and password.

The app login accepts either `ahmed` or a full email address. If the user types `ahmed`, the app signs in as `ahmed@eps.local`.

## Import Existing Browser Data

After deploying with Supabase configured, login as the user who should own the old browser data, then click `Import Local Data` in the sidebar. It reads the old `essam_tm_v6` browser data once and uploads it into that user's private workspace.

## Deploy to GitHub Pages

1. Put `index.html`, `supabase-config.js`, and the other app assets in the GitHub Pages branch/folder.
2. Keep `supabase-config.js` out of public source history if you prefer to generate it during deployment.
3. If using GitHub Actions, store `SUPABASE_URL` and `SUPABASE_ANON_KEY` as repository secrets and write `supabase-config.js` during the deploy job.
4. Push and let GitHub Pages redeploy.
