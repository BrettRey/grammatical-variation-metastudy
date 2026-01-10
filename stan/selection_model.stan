// Joint selection–outcome model with correlated random intercepts
// Selection: tested
// Outcome: found (conditional on tested)

functions {
}

data {
  int<lower=1> N;
  int<lower=0,upper=1> tested[N];
  int<lower=0,upper=1> found[N];
  int<lower=1> K;
  matrix[N, K] X;
  int<lower=1> J_paper;
  int<lower=1> J_author;
  int<lower=1> J_language;
  int<lower=1, upper=J_paper> paper_id[N];
  int<lower=1, upper=J_author> author_id[N];
  int<lower=1, upper=J_language> language_id[N];
}

parameters {
  vector[K] beta_s;
  vector[K] beta_o;
  real alpha_s;
  real alpha_o;

  // Random intercepts per grouping with correlation across stages
  cholesky_factor_corr[2] Lcorr_paper;
  vector<lower=0>[2] sd_paper;
  matrix[2, J_paper] z_paper;

  cholesky_factor_corr[2] Lcorr_author;
  vector<lower=0>[2] sd_author;
  matrix[2, J_author] z_author;

  cholesky_factor_corr[2] Lcorr_language;
  vector<lower=0>[2] sd_language;
  matrix[2, J_language] z_language;
}

transformed parameters {
  matrix[2, J_paper] u_paper;
  matrix[2, J_author] u_author;
  matrix[2, J_language] u_language;

  u_paper = diag_pre_multiply(sd_paper, Lcorr_paper) * z_paper;
  u_author = diag_pre_multiply(sd_author, Lcorr_author) * z_author;
  u_language = diag_pre_multiply(sd_language, Lcorr_language) * z_language;
}

model {
  vector[N] eta_s;
  vector[N] eta_o;

  // Priors
  alpha_s ~ normal(0, 1.0);
  alpha_o ~ normal(0, 1.0);
  beta_s ~ normal(0, 0.5);
  beta_o ~ normal(0, 0.5);

  sd_paper ~ exponential(3);
  sd_author ~ exponential(3);
  sd_language ~ exponential(3);

  Lcorr_paper ~ lkj_corr_cholesky(2);
  Lcorr_author ~ lkj_corr_cholesky(2);
  Lcorr_language ~ lkj_corr_cholesky(2);

  to_vector(z_paper) ~ normal(0, 1);
  to_vector(z_author) ~ normal(0, 1);
  to_vector(z_language) ~ normal(0, 1);

  // Linear predictors
  for (n in 1:N) {
    eta_s[n] = alpha_s + X[n] * beta_s
      + u_paper[1, paper_id[n]]
      + u_author[1, author_id[n]]
      + u_language[1, language_id[n]];

    eta_o[n] = alpha_o + X[n] * beta_o
      + u_paper[2, paper_id[n]]
      + u_author[2, author_id[n]]
      + u_language[2, language_id[n]];
  }

  // Likelihood
  tested ~ bernoulli_logit(eta_s);
  for (n in 1:N) {
    if (tested[n] == 1) {
      found[n] ~ bernoulli_logit(eta_o[n]);
    }
  }
}

generated quantities {
  corr_matrix[2] Corr_paper;
  corr_matrix[2] Corr_author;
  corr_matrix[2] Corr_language;

  Corr_paper = multiply_lower_tri_self_transpose(Lcorr_paper);
  Corr_author = multiply_lower_tri_self_transpose(Lcorr_author);
  Corr_language = multiply_lower_tri_self_transpose(Lcorr_language);
}
