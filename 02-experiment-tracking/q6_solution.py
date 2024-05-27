import mlflow

EXPERIMENT_NAME = "random-forest-best-models"
mlflow.set_tracking_uri("http://127.0.0.1:5000")

current_experiment = dict(mlflow.get_experiment_by_name(EXPERIMENT_NAME))
current_experiment_id = current_experiment["experiment_id"]

print(f"MLFLOW Experiment name: {EXPERIMENT_NAME}, Experiment id: {current_experiment_id}")

runs_df = mlflow.search_runs([current_experiment_id], order_by=["metrics.test_rmse ASC"])


print(f"Q6, Best test rmse: {runs_df.filter(like="test_rmse").loc[0,:].values}")

