package dao;

import java.util.List;

public interface IGenericDao {
    public List<? extends Object> show();
    public void delete(int id);
    public int count();
}
