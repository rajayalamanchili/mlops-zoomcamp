
conda create -n mlopszoomcamp python -y

conda init bash
conda activate mlopszoomcamp

conda install --yes --file requirements.txt

echo "Q1. $(mlflow --version)"

mkdir -p input_data
export MLFLOW_HW2_INPUT_DIR="$(pwd)/input_data"
echo $MLFLOW_HW2_INPUT_DIR

wget -N -P $MLFLOW_HW2_INPUT_DIR "https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2023-01.parquet"
wget -N -P $MLFLOW_HW2_INPUT_DIR "https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2023-02.parquet"
wget -N -P $MLFLOW_HW2_INPUT_DIR "https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2023-03.parquet"

python preprocess_data.py --raw_data_path $MLFLOW_HW2_INPUT_DIR --dest_path ./output

echo "Q2. number of files in output folder: $(ls -1q ./output | wc -l)"

python q3_solution.py


conda deactivate #mlopszoomcamp