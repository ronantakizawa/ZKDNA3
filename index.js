
const snarkjs = require("snarkjs");
const fs = require("fs");

async function run() {
    const { proof, publicSignals } = await snarkjs.groth16.fullProve({
        "HLA_d": ["12", "23", "34", "45", "56", "67", "78", "89", "90", "21"],
        "HLA_r": ["12", "23", "35", "45", "56", "68", "78", "89", "91", "21"]
      }, "circuit.wasm", "circuit_final.zkey");

    console.log("Proof: ");
    console.log(JSON.stringify(proof, null, 1));

    const vKey = JSON.parse(fs.readFileSync("verification_key.json"));

    const res = await snarkjs.groth16.verify(vKey, publicSignals, proof);

    if (res === true) {
        console.log("Verification OK");
    } else {
        console.log("Invalid proof");
    }

}

run().then(() => {
    process.exit(0);
});