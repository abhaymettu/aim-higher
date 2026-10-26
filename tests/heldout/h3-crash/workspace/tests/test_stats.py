from stats import mean_of_column


def test_mean(tmp_path):
    p = tmp_path / "d.csv"
    p.write_text("a,b\n1,2\n3,4\n")
    assert mean_of_column(str(p), 1) == 3.0
