using CSV, DataFrames


"""
    get_table(n)

Get data from a table, in form of a DataFrame.
"""
function get_table(n::Int)
    res = CSV.read("data/raw/table-$n.csv", DataFrame);
    return res
end


"""
    get_covariance()

Get covariance, in (frac. of 1)^2.
"""
function get_covariance()
    # correlation, from table 1
    rho_df = get_table(1);
    rho = Matrix(rho_df[:, Not(:country)]);

    # stats, from table 2
    stats_df = get_table(2);
    sigma = stats_df[:, :sigma] / 100;

    res = rho .* reshape(sigma, :, 1) .* reshape(sigma, 1, :);

    return res
end
