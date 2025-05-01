This repository houses the MC536 Database Design and Management project at Unicamp, providing a hands-on pipeline from raw data to a fully realized relational database schema. 
GitHub
It organizes raw CSV archives, ER diagrams, SQL build scripts, and Jupyter notebooks to walk you through preprocessing, schema design, and database construction.

## Why

We saw first-hand how **sprawling** is open educational data (from enrollments to class profiles and partnership records) from São Paulo public schools: these datasets **gather a lot of essential information, but lack a unified perspective**. To empower educators and policymakers with actionable insights, we devised a clean, reproducible pipeline: preprocessed these raw CSVs, modeled a relational schema, and populated a PostgreSQL database prepared for further analysis.

At its core, our work advances **United Nations Sustainable Development Goal 4: Quality Education**, which “aims to ensure inclusive and equitable quality education and promote lifelong learning opportunities for all.” By structuring enrollment, class profile, and partnership data into a robust relational schema and offering Jupyter-driven analysis, **this project facilitates evidence-based monitoring of key indicators (enrollment trends, class distributions and partnership efficacy), which are vital for SDG 4 progress**.

## Datasets
- **Municipal School Enrollment Microdata**  
  Description: Contains enrollment records in São Paulo’s Municipal Education Network across all levels—from early childhood to adult education—spanning 2000–2018, with a README, data dictionary, and annual CSV archives.  
  URL: http://dados.prefeitura.sp.gov.br/th/dataset/microdados-matriculas/

- **Operational Profile of Classes and Educational Units**  
  Description: Semiannual (June & December) snapshots since 2013 of enrolled students, class counts, shifts, and special-needs statistics, broken down by school and regional education board.  
  URL: http://dados.prefeitura.sp.gov.br/th/dataset/perfil-das-turmas-e-unidades-educacionais-em-funcionamento

- **Early Childhood Education Partnerships**  
  Description: Transparency dataset detailing early-childhood units maintained by partner organizations, including contract values (monthly transfers, rent, IPTU) and contracted nursery and classroom slots.  
  URL: http://dados.prefeitura.sp.gov.br/th/dataset/parcerias-ed-infantil/

## Prerequisites
- **Python 3.8+** for running preprocessing notebooks.
- **Jupyter Notebook** for interactive data exploration.
- **PostgreSQL 12+** for executing the SQL build script.

## Repository Structure
- **`datasets/raw_data/`**: Original CSV files for enrollment, class profiles, and partnership data.
- **`diagrams/`**: Conceptual (`conceptual.drawio`) and logical ER (`logical.drawio`) diagrams.
- **`utils/build_script.sql`**: SQL script that drops and creates all tables (`distrito`, `osc`, `parceria`, etc.) and defines the relational schema.
- **`preprocessing.ipynb`**: Jupyter notebook for data cleaning using Python and Pandas.
- **`db_building.ipynb`**: Jupyter notebook to load the cleaned data into PostgreSQL and run sample queries.

## Setup & Installation
1. **Clone the repository**  
   ```bash
   git clone https://github.com/biabuarque/MC536.git
   ```
2. **Install dependencies**  
   ```bash
   pip install notebook pandas psycopg2-binary
   ```
3. **Create the server**  

   After that, replace server data at `db_building.ipynb` and `example_queries.ipynb`
4. **Run notebooks**  
   ```bash
   jupyter notebook
   ```
   - Open `preprocessing.ipynb` to clean and prepare data.
   - Then run `db_building.ipynb` to load data and test queries.
5. **View diagrams**  
   Open the files in **`diagrams/`** to visualize the conceptual and ER models.

## Usage
After setup, create SQL queries to analyze enrollment trends, class distributions, and partnership impacts. 

We prototyped 5 example SQL queries and generated visualizations at **`example_queries.ipynb`**.

## Contributing
For now, contributions are closed for the project's evaluation at the discipline. After that, contributions (whether issues, feature requests, or pull requests) are welcome! Please fork the repo and open a pull request with your improvements.

## Project Group
- Ana Beatriz Silva Buarque
- Lucas Ribeiro Bortoletto
- Leticia Silva Brito

For questions or feedback, open an issue on GitHub.
