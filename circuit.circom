pragma circom 2.0.0;

include "circomlib/circuits/comparators.circom"; // For comparison components

// MatchMarkers component
template MatchMarkers() {
    signal input hla_d;    // Donor's HLA marker
    signal input hla_r;    // Recipient's HLA marker
    signal output is_match; // 1 if match, 0 otherwise

    component isEqual = IsEqual();
    isEqual.in[0] <== hla_d;
    isEqual.in[1] <== hla_r;
    is_match <== isEqual.out;
}

// GreaterThanEq component with parameter `n`
template GreaterThanEq(n) {
    signal input in[2]; // in[0]: total matches, in[1]: threshold
    signal output out;  // 1 if total matches >= threshold, 0 otherwise

    component lt = LessThan(n);
    lt.in[0] <== in[0]; // total matches
    lt.in[1] <== in[1]; // threshold

    out <== 1 - lt.out;
}

// Main circuit with parameters N and T
template HLAMatching(N, T, n) {
    // Inputs
    signal input HLA_d[N];  // Donor's HLA markers (private)
    signal input HLA_r[N];  // Recipient's HLA markers (private)

    // Output
    signal output result;   // 1 if at least T markers match, 0 otherwise

    // Constraints
    var total_matches = 0;

    // Declare array of components
    component match[N];

    for (var i = 0; i < N; i++) {
        // Check for Match
        match[i] = MatchMarkers();
        match[i].hla_d <== HLA_d[i];
        match[i].hla_r <== HLA_r[i];
        total_matches += match[i].is_match;
    }

    // Verify Threshold
    // Ensure total_matches >= T
    component gte = GreaterThanEq(n);
    gte.in[0] <== total_matches;
    gte.in[1] <== T;
    result <== gte.out;
}

// Instantiate the main component with specific N, T, and n values
component main = HLAMatching(10, 7, 4);
