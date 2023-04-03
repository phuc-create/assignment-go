package graph

import (
	"context"

	"github.com/99designs/gqlgen/graphql"
	"github.com/phuc-create/assignment-go/models"
	"github.com/vektah/gqlparser/v2/ast"
)

func NewExecutableSchema(cfg Config) graphql.ExecutableSchema {
	return &executableSchemaV2{
		resolvers:  cfg.Resolvers,
		directives: cfg.Directives,
		complexity: cfg.Complexity,
	}
}

type Config struct {
	Resolvers  ResolverRootV2
	Directives DirectiveRootV2
	Complexity ComplexityRootV2
}

type ResolverRootV2 interface {
	Mutation() MutationResolverV2
	Query() QueryResolverV2
}

type DirectiveRootV2 struct {
}

type ComplexityRootV2 struct {
	Mutation struct {
		AddNewStudent func(childComplexity int, input models.AddNewStudent) int
	}

	Query struct {
		Students func(childComplexity int) int
	}

	Student struct {
		ID    func(childComplexity int) int
		Name  func(childComplexity int) int
		Phone func(childComplexity int) int
		Email func(childComplexity int) int
	}
}

type MutationResolverV2 interface {
	AddNewStudent(ctx context.Context, input models.AddNewStudent) (*models.Student, error)
}

type QueryResolverV2 interface {
	Students(ctx context.Context) ([]*models.Student, error)
}

type executableSchemaV2 struct {
	resolvers  ResolverRootV2
	directives DirectiveRootV2
	complexity ComplexityRootV2
}

// Complexity implements graphql.ExecutableSchema
func (*executableSchemaV2) Complexity(typeName string, fieldName string, childComplexity int, args map[string]interface{}) (int, bool) {
	panic("unimplemented")
}

// Exec implements graphql.ExecutableSchema
func (*executableSchemaV2) Exec(ctx context.Context) graphql.ResponseHandler {
	panic("unimplemented")
}

// Schema implements graphql.ExecutableSchema
func (*executableSchemaV2) Schema() *ast.Schema {
	panic("unimplemented")
}

type executionContext struct {
	*graphql.OperationContext
	*executableSchemaV2
}
