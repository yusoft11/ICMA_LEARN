namespace ICMA_LEARN.Models
{
    public class SearchRequest
    {
        public int Draw { get; set; }
        public int Start { get; set; }
        public int Length { get; set; }
        public ColumnRequestItem[]? Columns { get; set; }
        public OrderRequestItem[]? Order { get; set; }
        public SearchRequestItem? Search { get; set; }
    }
    public abstract class SearchDetail
    {
        //public int SN { get; set; }
    }
    public class ColumnRequestItem
    {
        public string? Data { get; set; }
        public string? Name { get; set; }
        public bool Searchable { get; set; }
        public bool Orderable { get; set; }
        public SearchRequestItem? Search { get; set; }
    }
    public class OrderRequestItem
    {
        public int Column { get; set; }
        public string? Dir { get; set; }
    }
    public class SearchRequestItem
    {
        public string? Value { get; set; }
        public bool Regex { get; set; }
    }
    public abstract class SearchResponse<T> where T : SearchDetail
    {
        public int draw { get; set; }

        public int recordsTotal { get; set; }

        public int recordsFiltered { get; set; }

        public IList<T> data { get; set; }

        public string error { get; set; }
    }
    public static class SearchExtension
    {
        public static string AsPropertyName(this string source)
        {
            return char.ToUpper(source[0]) + source.Substring(1);
        }
        public static bool ContainsIgnoringCase(this string source, string substring)
        {
            if (string.IsNullOrEmpty(source))
            {
                return false;
            }

            return source.ToLower().Contains(substring.ToLower());
        }
    }
    public class SearchUtil
    {
        public static IList<TDetail> PageResults<TDetail>(IEnumerable<TDetail> results, SearchRequest request) where TDetail : SearchDetail
        {
            var skip = request.Start;
            var pageSize = request.Length;
            var searchResults = SearchResults(results.AsQueryable(), request);
            var orderedResults = OrderResults(searchResults, request);
            //return pageSize > 0 ? orderedResults.Skip(skip).Take(pageSize).ToList() : orderedResults.ToList();
            var serializedResults = SerializeResults(orderedResults);
            return pageSize > 0 ? serializedResults.Skip(skip).Take(pageSize).ToList() : serializedResults.ToList();

        }
        private static IEnumerable<TDetail> SerializeResults<TDetail>(IEnumerable<TDetail> results) where TDetail : SearchDetail
        {
            int sn = 1;
            foreach (var result in results)
            {
                //result.SN = sn;
                //sn++;
            };
            return results;
        }
        private static IEnumerable<TDetail> OrderResults<TDetail>(IEnumerable<TDetail> results, SearchRequest request) where TDetail : SearchDetail
        {
            if (request.Order == null)
            {
                return results;
            }

            var columnIndex = request.Order[0].Column;
            var sortDirection = request.Order[0].Dir;
            var columnName = request.Columns[columnIndex].Data.AsPropertyName();
            var prop = typeof(TDetail).GetProperty(columnName);
            return sortDirection == "asc" ? results.OrderBy(prop.GetValue) : results.OrderByDescending(prop.GetValue);
        }
        private static IEnumerable<TDetail> SearchResults<TDetail>(IQueryable<TDetail> results, SearchRequest request) where TDetail : SearchDetail
        {
            if (string.IsNullOrEmpty(request.Search.Value))
            {
                return results;
            }

            var searchColums = request.Columns.Where(a => a.Searchable).ToList();
            var searchResults = results;
            if (searchColums != null && searchColums.Count > 0)
            {
                var predicate = PredicateBuilder.False<TDetail>();
                foreach (var column in searchColums)
                {
                    //var columnName = column.Data.AsPropertyName();
                    var columnName = column.Data;
                    var prop = typeof(TDetail).GetProperty(columnName);
                    if (prop != null)
                    {
                        predicate = predicate.Or(x => (prop.GetValue(x) ?? "").ToString().ContainsIgnoringCase(request.Search.Value));
                    }
                }
                searchResults = results.Where(predicate);
            }
            return searchResults;
        }
    }
}
