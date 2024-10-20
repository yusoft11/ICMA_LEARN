namespace ICMA_LEARN.Models
{
    public class BaseResponseModel
    {
        public bool Successful => !Errors.Any();
        public List<ValidationError> Errors { get; set; } = new List<ValidationError>();
        public void AddError(string error)
        {
            Errors.Add(new ValidationError(error));
        }
    }

    public class ValidationError
    {
        public string Error { get; set; }
        public string Description { get; set; }
        public ValidationError(string error, string description)
        {
            Error = error;
            Description = description;
        }
        public ValidationError(string error)
        {
            Error = error;
            Description = error;
        }
    }
    public class ResponseModel : BaseResponseModel
    {

    }
}
