package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"
	"fmt"

	"github.com/phuc-create/assignment-go/graph/generated"
	"github.com/phuc-create/assignment-go/graph/models"
)

// GetSchools is the resolver for the getSchools field.
func (r *queryResolver) GetSchools(ctx context.Context) ([]*models.School, error) {
	panic(fmt.Errorf("not implemented"))
}

// GetStudents is the resolver for the getStudents field.
func (r *queryResolver) GetStudents(ctx context.Context) ([]*models.Student, error) {
	panic(fmt.Errorf("not implemented"))
}

// GetSubjects is the resolver for the getSubjects field.
func (r *queryResolver) GetSubjects(ctx context.Context) ([]*models.Subject, error) {
	panic(fmt.Errorf("not implemented"))
}

// GetTeachers is the resolver for the getTeachers field.
func (r *queryResolver) GetTeachers(ctx context.Context) ([]*models.Teacher, error) {
	panic(fmt.Errorf("not implemented"))
}

// Query returns generated.QueryResolver implementation.
func (r *Resolver) Query() generated.QueryResolver { return &queryResolver{r} }

type queryResolver struct{ *Resolver }
