#include <algorithm>
#include <cmath>
#include <iostream>
#include <vector>

using namespace std;
using ll = long long;
const int INF = 1e9;
int N, Q;

struct Node {
  int max1, max2, cnt_max;
  ll sum;
};

class SegmentTree {
 public:
  SegmentTree(const vector<int>& v) {
    n = v.size();
    tree.resize(n * 4);
    build(v, 0, n - 1, 1);
  }

  void update(int left, int right, int k) {
    update_range(1, 0, n - 1, left, right, k);
  }

  int query_max(int left, int right) {
    return query_max(1, 0, n - 1, left, right);
  }

  ll query_sum(int left, int right) {
    return query_sum(1, 0, n - 1, left, right);
  }

 private:
  int n;
  vector<Node> tree;

  Node merge(Node a, Node b) {
    if (a.max1 == b.max1) {
      return {a.max1, max(a.max2, b.max2), a.cnt_max + b.cnt_max,
              a.sum + b.sum};
    } else if (a.max1 > b.max1) {
      return {a.max1, max(a.max2, b.max1), a.cnt_max, a.sum + b.sum};
    } else {
      return {b.max1, max(a.max1, b.max2), b.cnt_max, a.sum + b.sum};
    }
  }

  Node build(const vector<int>& v, int start, int end, int node) {
    if (start == end) {
      return tree[node] = {v[start], -INF, 1, v[start]};
    }
    int mid = (start + end) / 2;
    Node left_child = build(v, start, mid, node * 2);
    Node right_child = build(v, mid + 1, end, node * 2 + 1);
    return tree[node] = merge(left_child, right_child);
  }

  void lazy_propagation(int node, int start, int end) {
    if (start == end) return;
    for (int idx = node * 2; idx <= node * 2 + 1; ++idx) {
      if (tree[node].max1 < tree[idx].max1) {
        tree[idx].sum -=
            (ll)tree[idx].cnt_max * (tree[idx].max1 - tree[node].max1);
        tree[idx].max1 = tree[node].max1;
      }
    }
  }

  void update_range(int node, int start, int end, int left, int right, int k) {
    lazy_propagation(node, start, end);

    if (end < left || right < start || tree[node].max1 <= k) {
      return;
    }

    if (left <= start && end <= right && tree[node].max2 < k) {
      tree[node].sum -= (ll)tree[node].cnt_max * (tree[node].max1 - k);
      tree[node].max1 = k;
      lazy_propagation(node, start, end);
      return;
    }

    int mid = (start + end) / 2;
    update_range(node * 2, start, mid, left, right, k);
    update_range(node * 2 + 1, mid + 1, end, left, right, k);
    tree[node] = merge(tree[node * 2], tree[node * 2 + 1]);
  }

  int query_max(int node, int start, int end, int left, int right) {
    lazy_propagation(node, start, end);

    if (end < left || right < start) return -INF;

    if (left <= start && end <= right) {
      return tree[node].max1;
    }

    int mid = (start + end) / 2;
    return max(query_max(node * 2, start, mid, left, right),
               query_max(node * 2 + 1, mid + 1, end, left, right));
  }

  ll query_sum(int node, int start, int end, int left, int right) {
    lazy_propagation(node, start, end);

    if (end < left || right < start) return 0;

    if (left <= start && end <= right) {
      return tree[node].sum;
    }

    int mid = (start + end) / 2;
    return query_sum(node * 2, start, mid, left, right) +
           query_sum(node * 2 + 1, mid + 1, end, left, right);
  }
};

int main() {
  ios_base::sync_with_stdio(false);
  cin.tie(NULL);

  cin >> N;
  vector<int> v(N);
  for (auto& i : v) cin >> i;

  SegmentTree seg(v);

  cin >> Q;
  while (Q--) {
    int type, left, right, x;
    cin >> type;
    if (type == 1) {
      cin >> left >> right >> x;
      seg.update(left - 1, right - 1, x);
    } else if (type == 2) {
      cin >> left >> right;
      cout << seg.query_max(left - 1, right - 1) << "\n";
    } else if (type == 3) {
      cin >> left >> right;
      cout << seg.query_sum(left - 1, right - 1) << "\n";
    }
  }

  return 0;
}
