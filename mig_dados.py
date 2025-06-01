import mysql.connector
import pandas as pd
import json
import getpass

user = input("Utilizador MySQL: ")
password = getpass.getpass("Password MySQL: ")

# === 1. Conexão com a base de dados MySQL ===
conn = mysql.connector.connect(
    host="localhost",
    user=user,        
    password=password,         
    database="pm_veículos"     
)
cursor = conn.cursor()

# === 2. Executar instruções do ficheiro povoamento.sql ===
with open("dados/PovoamentoPM.sql", "r", encoding="utf-8") as f:
    sql_script = f.read()
    for statement in sql_script.split(';'):
        if statement.strip():
            cursor.execute(statement)
    conn.commit()
    print("Script SQL executado com sucesso.")

# === 3. Inserir dados de ficheiros CSV ===
def inserir_csv_em_tabela(caminho, tabela):
    df = pd.read_csv(caminho)
    cols = ", ".join(df.columns)
    placeholders = ", ".join(["%s"] * len(df.columns))
    sql = f"INSERT INTO {tabela} ({cols}) VALUES ({placeholders})"
    for row in df.itertuples(index=False):
        cursor.execute(sql, tuple(row))
    conn.commit()
    print(f"Dados inseridos do CSV em '{tabela}'")

inserir_csv_em_tabela("dados/clientes.csv", "Cliente")
inserir_csv_em_tabela("dados/funcionarios.csv", "Funcionario")

# === 4. Inserir dados de ficheiros JSON ===
def inserir_json_em_tabela(caminho, tabela):
    with open(caminho, "r", encoding="utf-8") as f:
        dados = json.load(f)
    if not dados:
        return
    colunas = dados[0].keys()
    placeholders = ", ".join(["%s"] * len(colunas))
    sql = f"INSERT INTO {tabela} ({', '.join(colunas)}) VALUES ({placeholders})"
    for linha in dados:
        cursor.execute(sql, tuple(linha.values()))
    conn.commit()
    print(f"Dados inseridos do JSON em '{tabela}'")

inserir_json_em_tabela("dados/veiculos.json", "Veiculo")
inserir_json_em_tabela("dados/alugueres.json", "Aluguer")

# === 5. Fechar conexão ===
cursor.close()
conn.close()
print("Migração concluída com sucesso.")
