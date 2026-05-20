create table if not exists eps_projects (
  app_id text not null,
  id text not null,
  payload jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  primary key (app_id, id)
);

create table if not exists eps_tasks (like eps_projects including all);
create table if not exists eps_meetings (like eps_projects including all);
create table if not exists eps_notes (like eps_projects including all);
create table if not exists eps_contacts (like eps_projects including all);
create table if not exists eps_team_members (like eps_projects including all);
create table if not exists eps_packages (like eps_projects including all);
create table if not exists eps_boq_items (like eps_projects including all);
create table if not exists eps_price_items (like eps_projects including all);
create table if not exists eps_lpo_items (like eps_projects including all);

create table if not exists eps_app_settings (
  app_id text not null,
  key text not null,
  payload jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  primary key (app_id, key)
);

alter table eps_projects enable row level security;
alter table eps_tasks enable row level security;
alter table eps_meetings enable row level security;
alter table eps_notes enable row level security;
alter table eps_contacts enable row level security;
alter table eps_team_members enable row level security;
alter table eps_packages enable row level security;
alter table eps_boq_items enable row level security;
alter table eps_price_items enable row level security;
alter table eps_lpo_items enable row level security;
alter table eps_app_settings enable row level security;

drop policy if exists "eps_projects_owner_access" on eps_projects;
create policy "eps_projects_owner_access" on eps_projects for all to authenticated using (app_id = auth.uid()::text) with check (app_id = auth.uid()::text);

drop policy if exists "eps_tasks_owner_access" on eps_tasks;
create policy "eps_tasks_owner_access" on eps_tasks for all to authenticated using (app_id = auth.uid()::text) with check (app_id = auth.uid()::text);

drop policy if exists "eps_meetings_owner_access" on eps_meetings;
create policy "eps_meetings_owner_access" on eps_meetings for all to authenticated using (app_id = auth.uid()::text) with check (app_id = auth.uid()::text);

drop policy if exists "eps_notes_owner_access" on eps_notes;
create policy "eps_notes_owner_access" on eps_notes for all to authenticated using (app_id = auth.uid()::text) with check (app_id = auth.uid()::text);

drop policy if exists "eps_contacts_owner_access" on eps_contacts;
create policy "eps_contacts_owner_access" on eps_contacts for all to authenticated using (app_id = auth.uid()::text) with check (app_id = auth.uid()::text);

drop policy if exists "eps_team_members_owner_access" on eps_team_members;
create policy "eps_team_members_owner_access" on eps_team_members for all to authenticated using (app_id = auth.uid()::text) with check (app_id = auth.uid()::text);

drop policy if exists "eps_packages_owner_access" on eps_packages;
create policy "eps_packages_owner_access" on eps_packages for all to authenticated using (app_id = auth.uid()::text) with check (app_id = auth.uid()::text);

drop policy if exists "eps_boq_items_owner_access" on eps_boq_items;
create policy "eps_boq_items_owner_access" on eps_boq_items for all to authenticated using (app_id = auth.uid()::text) with check (app_id = auth.uid()::text);

drop policy if exists "eps_price_items_owner_access" on eps_price_items;
create policy "eps_price_items_owner_access" on eps_price_items for all to authenticated using (app_id = auth.uid()::text) with check (app_id = auth.uid()::text);

drop policy if exists "eps_lpo_items_owner_access" on eps_lpo_items;
create policy "eps_lpo_items_owner_access" on eps_lpo_items for all to authenticated using (app_id = auth.uid()::text) with check (app_id = auth.uid()::text);

drop policy if exists "eps_app_settings_owner_access" on eps_app_settings;
create policy "eps_app_settings_owner_access" on eps_app_settings for all to authenticated using (app_id = auth.uid()::text) with check (app_id = auth.uid()::text);
