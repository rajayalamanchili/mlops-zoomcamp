import mlflow

EXPERIMENT_NAME = "random-forest-hyperopt"
mlflow.set_tracking_uri("http://127.0.0.1:5000")

current_experiment = dict(mlflow.get_experiment_by_name(EXPERIMENT_NAME))
current_experiment_id = current_experiment["experiment_id"]

print(f"MLFLOW Experiment name: {EXPERIMENT_NAME}, Experiment id: {current_experiment_id}")

best_run_df = mlflow.search_runs([current_experiment_id], order_by=["metrics.rmse ASC"])

print(f"Q5. Best rmse: {best_run_df.filter(like="rmse").loc[0,:].values}")

