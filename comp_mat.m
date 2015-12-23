function compMat = comp_mat(mat, h, w) % h is the height, w is the width
    compMat = zeros(h, w);
    height = size(mat, 1);
    width = size(mat, 2);
    bh = ceil(height / h);
    bw = ceil(width / w);
    for i = height + 1 : h * bh
        for j = 1 : w * bw
            mat(i, j, :) = 255;
        end
    end
    for i = 1 : h * bh
        for j = width + 1 : w * bw
            mat(i, j, :) = 255;
        end
    end
    for i = 1 : h
        for j = 1 : w
            if sum(sum(sum(mat( bh * (i - 1) + 1 : bh * i , bw * (j - 1) + 1 : bw * j , : )))) < 255 * size(mat, 3) * bw * bh
                compMat(i, j) = 1;
            else
                compMat(i, j) = 0;
            end
        end
    end
end