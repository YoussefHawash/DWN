# DWN on FPGA: reproduction and fault injection

Research on Differentiable Weightless Neural Networks (DWN): training the paper's MNIST and JSC models, exporting them to Verilog, synthesising them for FPGA, and measuring how hardware faults affect accuracy.

## Contents

| Path | What it is |
| --- | --- |
| `Final_DWN.ipynb` | Trains the DWN models (paper Table 14 settings), checks the Verilog against PyTorch, and runs Yosys and Vivado synthesis. All options are in the first code cell. |
| `DWN_Fault_Injection.ipynb` | Fault injection campaigns: LUT bit flips, stuck LUT outputs, stuck LUT inputs, count register faults, and random bit flips at a given bit error rate. |
| `hw/` | Generated Verilog (`*.v`), model specs (`*_spec.pkl`), Yosys stats, and `results.csv` comparing accuracy, LUTs and FFs with the paper. |
| `hw/ct/` | Verilog variants used for the fault experiments. |
| `hw/vivado/` | Per-model Vivado scripts and timing/utilisation reports, summarised in `vivado_results.csv`. |
| `faults/` | Fault campaign results (CSV) and figures for `mnist_sm` and `jsc_sm10`. |
| `run_2/` | A second training run: Verilog, specs, `results.csv` and `run_info.json` with its settings. |

## Results (Vivado, after implementation)

| Model | Accuracy % | Paper % | LUTs | Paper LUTs | FFs | Paper FFs | Fmax (MHz) |
| --- | --- | --- | --- | --- | --- | --- | --- |
| mnist_sm | 97.67 | 97.1 | 2217 | 692 | 1724 | 422 | 261.3 |
| mnist_lg | 98.18 | 98.3 | 4427 | 4082 | 3342 | 3385 | 258.2 |
| jsc_sm10 | 71.00 | 71.1 | 26 | 20 | 41 | 22 | 630.9 |
| jsc_sm50 | 73.82 | 74.0 | 110 | 110 | 105 | 72 | 322.6 |
| jsc_md | 75.61 | 75.6 | 901 | 720 | 498 | 457 | 285.2 |
| jsc_lg | 76.31 | 76.3 | 6185 | 4972 | 2952 | 3305 | 201.7 |

The paper used a Virtex UltraScale+ part (xcvu9p); these runs used Artix-7, so LUT and FF counts are roughly comparable but Fmax is not.

## Setup

```bash
pip install -r requirements.txt
```

Datasets download automatically (MNIST via torchvision, JSC via OpenML). Model checkpoints (`*.pt`), datasets and full synthesis logs are not in the repository because of their size; rerun `Final_DWN.ipynb` to regenerate them.
