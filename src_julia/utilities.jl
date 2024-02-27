using LinearAlgebra

function nearest_pd_matrix(A::Matrix)

    if isposdef(A)
        return A
    end
    
    # symmetrize A into B
    B = (A + transpose(A)) / 2;

    # compute the symmetric polar factor H of B; H is SPD.
    svd_obj = svd(B);
    s, V = svd_obj.S, svd_obj.V;
    H = V * diagm(s) * transpose(V);

    # get a symmetric A2 which can be PD
    A2 = (B + H) / 2;
    A3 = (A2 + transpose(A2)) / 2;

    if isposdef(A3)
        return A3
    end

    # if still not PD, tweak it just a bit using the minimum eigenvalue
    spacing = eps(norm(A));
    i_mat = Matrix(I, size(A, 1), size(A, 1));
    _k = 1;
    while !isposdef(A3)
        mineig = minimum(real.(eigvals(A3)));
        A3 += i_mat * (-mineig * _k^2 + spacing);
        _k += 1;
        if _k > 100
            ErrorException("max iteration reached")
        end
    end

    return A3

end