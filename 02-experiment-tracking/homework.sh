
conda create -n mlopszoomcamp python -y

conda init bash
conda activate mlopszoomcamp

# conda install --yes --file requirements.txt
pip install -r requirements.txt

echo "" |> hw2_answers.txt
echo "Q1. $(mlflow --version)" >> hw2_answers.txt

mkdir -p input_data
export MLFLOW_HW2_INPUT_DIR="$(pwd)/input_data"
echo $MLFLOW_HW2_INPUT_DIR

wget -N -P $MLFLOW_HW2_INPUT_DIR "https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2023-01.parquet"
wget -N -P $MLFLOW_HW2_INPUT_DIR "https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2023-02.parquet"
wget -N -P $MLFLOW_HW2_INPUT_DIR "https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2023-03.parquet"

python preprocess_data.py --raw_data_path $MLFLOW_HW2_INPUT_DIR --dest_path ./output

echo " " >> hw2_answers.txt
echo "Q2. number of files in output folder: $(ls -1q ./output | wc -l)" >> hw2_answers.txt

echo " " >> hw2_answers.txt
echo "$(python q3_solution.py)" >> hw2_answers.txt

mkdir -p artifacts

mlflow server --host 127.0.0.1 --port 5000 --backend-store-uri sqlite:///mlflow.db --artifacts-destination artifacts

echo " " >> hw2_answers.txt
echo "Q4. argument to mlflow server: artifacts-destination" >> hw2_answers.txt

python hpo.py

echo " " >> hw2_answers.txt
echo "$(python q5_solution.py)" >> hw2_answers.txt

python register_model.py

echo " " >> hw2_answers.txt
echo "$(python q6_solution.py)" >> hw2_answers.txt

conda deactivate #mlopszoomcamp