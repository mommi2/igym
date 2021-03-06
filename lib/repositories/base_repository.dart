abstract class BaseRepository<K, T> {
  Future<T> insert(T model);
  Future<int> update(T model);
  Future<void> delete(K id);
  Future<List<T>> findAll();
}