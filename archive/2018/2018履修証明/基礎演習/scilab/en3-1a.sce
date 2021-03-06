clear;

x=[3 2; 3 4; 5 4; 5 6];
[n d] = size(x);
// 元データの表示
subplot(2,1,1);
plot2d(x(:,1), x(:,2), style=-9, rect=[0,0,8,8])

// 標準化
m = mean(x, 'r');   // mはd次元ベクトル
s = stdev(x, 'r');  // sはd次元ベクトル

normX = [];
for i = 1:n
    for j = 1:d
        normX(i,j) = (x(i,j) - m(j)) / s(j);
    end
end

//normX = (x - repmat(m,[r,1])) ./ repmat(s, [r,1]);

// 標準化後のデータの表示
subplot(2,1,2);
plot2d(normX(:,1), normX(:,2), style=-10, rect=[-2,-2,2,2])

// 主成分分析
[lambda, facpr, comprinc] = pca(normX);
z = normX * facpr(:,1);
disp(z)
