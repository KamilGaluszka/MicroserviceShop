using Catalog.API.Entities;
using Catalog.API.Exceptions;
using Catalog.API.Repositories;

namespace Catalog.API.Test.Tests.Repositories.ProductCommandRepositoryTests
{
    internal class DeleteProductTests : DatabaseSetup
    {
        private IProductCommandRepository _repository;

        [SetUp]
        public void SetUp()
        {
            _repository = new ProductCommandRepository(Context);
        }

        [Test]
        public void Should_throw_Entity_Not_Found_Exception_when_there_is_no_entity_with_given_id()
        {
            //Arrange
            Guid id = Guid.NewGuid();

            //Act & Assert
            Assert.ThrowsAsync<EntityNotFoundException>(() => _repository.DeleteAsync(id));
        }

        [Test]
        public void Should_delete_product_with_given_id()
        {
            //Arrange
            Guid id = Guid.NewGuid();
            Context.Products.InsertOne(new Product { Id = id });

            //Act & Assert
            Assert.DoesNotThrowAsync(() => _repository.DeleteAsync(id));
        }
    }
}
