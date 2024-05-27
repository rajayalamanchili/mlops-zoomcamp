import mlflow

EXPERIMENT_NAME = "random-forest-train"

current_experiment = dict(mlflow.get_experiment_by_name(EXPERIMENT_NAME))
current_experiment_id = current_experiment["experiment_id"]

print(f"MLFLOW Experiment name: {EXPERIMENT_NAME}, Experiment id: {current_experiment_id}")

latest_run_df = mlflow.search_runs([current_experiment_id], order_by=["attributes.created DESC"])

print(f"MLFLOW Run id: {current_experiment_id}")
print(latest_run_df.filter(like="min_samples_split").loc[0,:])

