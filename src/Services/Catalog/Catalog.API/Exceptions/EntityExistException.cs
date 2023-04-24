using System.Runtime.Serialization;

namespace Catalog.API.Exceptions
{
    [Serializable]
    public class EntityExistException : Exception
    {
        public EntityExistException(string message) : base(message)
        {
        }

        public EntityExistException(Type type, object id) : this($"{type.Name} with id {id} already exist")
        {
        }

        protected EntityExistException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}
