# Apache Superset dashboard SQL
A repository for storing Apache Superset queries and chart instructions

## Dashboard: IGF

### Project counts
  * SQL query: [igf_project_counts.sql](igf_project_counts.sql)

### Sequencing runs per month
  * SQL query: [igf_sequencing_runs_per_months.sql](igf_sequencing_runs_per_months.sql)

### Sequncing flowcell type per month
  * SQL query: [igf_sequencing_flowcell_types_per_month.sql](igf_sequencing_flowcell_types_per_month.sql)

### Avg PCT Occupied per run
  * SQL query: [igf_avg_pct_occupied_per_run.sql](igf_avg_pct_occupied_per_run.sql)

### Yield
  * SQL query: [igf_yield.sql](igf_yield.sql)

### Reads per month
  * SQL query: [igf_reads_per_month.sql](igf_reads_per_month.sql)

## De-multiplexing pipeline runs per week
  * SQL query: [igf_demultiplexing_pipeline_runs_per_week.sql](igf_demultiplexing_pipeline_runs_per_week.sql)

### Analyses runs per week
  * SQL query: [igf_analyses_runs_per_week.sql](igf_analyses_runs_per_week.sql)

### Analysis pipeline usage - 365 days
  * SQL query: [igf_analyses_pipeline_usage_365_days.sql](igf_analyses_pipeline_usage_365_days.sql)

### Analysis pipeline counts - 365 days
  * SQL query: [igf_analysis_pipeline_counts_365_days.sql](igf_analysis_pipeline_counts_365_days.sql)

### Nextflow Tower

#### NF Tower access
  * SQL query: [igf_nf_tower_accesss.sql](igf_nf_tower_accesss.sql)

#### NF Workflow Counts
  * SQL query: [igf_nf_workflow_counts.sql](igf_nf_workflow_counts.sql)

#### NF core pipeline usage
  * SQL query: [igf_nfcore_pipeline_usage.sql](igf_nfcore_pipeline_usage.sql)

#### NF Failed jobs
  * SQL query: [igf_nf_failed_jobs.sql](igf_nf_failed_jobs.sql)

### Apache Airflow

#### Airflow run status per week
  * SQL query: [igf_airflow_run_status_per_week.sql](igf_airflow_run_status_per_week.sql)

#### Airflow pipeline failures - last 4 months
  * SQL query: [igf_airflow_pipeline_failures_last_4_months.sql](igf_airflow_pipeline_failures_last_4_months.sql)

#### Airflow failed pipelines - 30 days
  * SQL query: [igf_airflow_failed_pipelines_30_days.sql](igf_airflow_failed_pipelines_30_days.sql)


## Dashboard: IGF_Pipeline

### Total sequencing runs generated is last 365 days
  * SQL query: [igf_pipeline_total_sequencing_runs_generated_is_last_365_days.sql](igf_pipeline_total_sequencing_runs_generated_is_last_365_days.sql)

### Test de-multiplexing pipeline triggered in 365 days
  * SQL query: [igf_pipeline_test_de-multiplexing_pipeline_triggered_in_365_days.sql](igf_pipeline_test_de-multiplexing_pipeline_triggered_in_365_days.sql)

### De-multiplexing pipeline trigger counts in 365 days
  * SQL query: [igf_pipeline_de-multiplexing_pipeline_trigger_counts_in_365_days.sql](igf_pipeline_de-multiplexing_pipeline_trigger_counts_in_365_days.sql)

### Top 5 most triggered sequencing runs
  * SQL query: [igf_pipeline_top_5_most_triggered_sequencing_runs.sql](igf_pipeline_top_5_most_triggered_sequencing_runs.sql)

### Total analysis and projects processed in 365 days
  * SQL query: [igf_pipeline_total_analysis_and_projects_processed_in_365_days.sql](igf_pipeline_total_analysis_and_projects_processed_in_365_days.sql)

### Trigger counts per analysis pipeline in 365 days
  * SQL query: [igf_pipeline_trigger_counts_per_analysis_pipeline_in_365_days.sql](igf_pipeline_trigger_counts_per_analysis_pipeline_in_365_days.sql)


## Dashboard: COSMX

### CosMx - Mean transcript per cell per tissue
  * SQL query: [CosMx_Mean_transcript_per_cell_per_tissue.sql](CosMx_Mean_transcript_per_cell_per_tissue.sql)

### COSMX slide per platform
  * SQL query: [COSMX_slide_per_platform.sql](COSMX_slide_per_platform.sql)

### CosMX slide run per quarter
    * SQL query: [CosMX_slide_run_per_quarter.sql](CosMX_slide_run_per_quarter.sql)

### CosMx Slide Panels
    * SQL query: [CosMx_Slide_Panels.sql](CosMx_Slide_Panels.sql)

### Total FOV distribution per COSMX panel
    * SQL query: [COSMX_Total_FOV_distribution_per_panel.sql](COSMX_Total_FOV_distribution_per_panel.sql)

### Slides per project
    * SQL query: [COSMX_Slides_per_project.sql](COSMX_Slides_per_project.sql)

### Empty Fovs
    * SQL query: [COSMX_Empty_Fovs.sql](COSMX_Empty_Fovs.sql)
