abstract class Repository<T, K> {

  Future<List<T>> getAll();

  Future<T> findById(K id);
  Future<T>  create(T entity);
  Future<T>  update(T entity);
  Future<T>  delete(T entity);

}
