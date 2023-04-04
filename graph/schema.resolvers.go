package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"
	"crypto/rand"
	"fmt"
	"math/big"

	"github.com/phuc-create/assignment-go/cmd/config"
	"github.com/phuc-create/assignment-go/graph/generated"
	"github.com/phuc-create/assignment-go/graph/models"
)

// AddTeacher is the resolver for the addTeacher field.
func (r *mutationResolver) AddTeacher(ctx context.Context, teacher models.NewTeacher) (*models.Teacher, error) {
	// random ID
	uuid, _ := rand.Int(rand.Reader, big.NewInt(100))
	fmt.Println(uuid)

	insertTeacherIntoDB := `INSERT INTO teachers (id,name,phone,email) VALUES($1,$2,$3,$4)`
	data, err := config.DB.Exec(insertTeacherIntoDB, uuid, teacher.Name, teacher.Phone, teacher.Email)
	if err != nil {
		fmt.Println(data)
		fmt.Println("message:", err.Error())
		// panic(err)
	}
	return nil, nil
}

// DeleteTeacher is the resolver for the deleteTeacher field.
func (r *mutationResolver) DeleteTeacher(ctx context.Context, teacherID string) (bool, error) {
	panic(fmt.Errorf("not implemented"))
}

// AddSchool is the resolver for the addSchool field.
func (r *mutationResolver) AddSchool(ctx context.Context, school models.NewSchool) (*models.School, error) {
	panic(fmt.Errorf("not implemented"))
}

// DeleteSchool is the resolver for the deleteSchool field.
func (r *mutationResolver) DeleteSchool(ctx context.Context, schoolID string) (bool, error) {
	panic(fmt.Errorf("not implemented"))
}

// AddStudent is the resolver for the addStudent field.
func (r *mutationResolver) AddStudent(ctx context.Context, student models.NewStudent) (*models.Student, error) {
	uuid, _ := rand.Int(rand.Reader, big.NewInt(100))
	new := &models.Student{
		ID:    fmt.Sprintf("T%d", uuid),
		Name:  student.Name,
		Email: student.Email,
		Phone: student.Phone,
	}
	r.students = append(r.students, new)
	return new, nil
}

// DeleteStudent is the resolver for the deleteStudent field.
func (r *mutationResolver) DeleteStudent(ctx context.Context, studentID string) (bool, error) {
	panic(fmt.Errorf("not implemented"))
}

// AddSubject is the resolver for the addSubject field.
func (r *mutationResolver) AddSubject(ctx context.Context, subject models.NewSubject) (*models.Subject, error) {
	panic(fmt.Errorf("not implemented"))
}

// DeleteSubject is the resolver for the deleteSubject field.
func (r *mutationResolver) DeleteSubject(ctx context.Context, subjectID string) (bool, error) {
	panic(fmt.Errorf("not implemented"))
}

// GetSchools is the resolver for the getSchools field.
func (r *queryResolver) GetSchools(ctx context.Context) ([]*models.School, error) {
	panic(fmt.Errorf("not implemented"))
}

// GetStudents is the resolver for the getStudents field.
func (r *queryResolver) GetStudents(ctx context.Context) ([]*models.Student, error) {
	return r.students, nil
}

// GetSubjects is the resolver for the getSubjects field.
func (r *queryResolver) GetSubjects(ctx context.Context) ([]*models.Subject, error) {
	panic(fmt.Errorf("not implemented"))
}

// GetTeachers is the resolver for the getTeachers field.
func (r *queryResolver) GetTeachers(ctx context.Context) ([]*models.Teacher, error) {
	panic(fmt.Errorf("not implemented"))
}

// Mutation returns generated.MutationResolver implementation.
func (r *Resolver) Mutation() generated.MutationResolver { return &mutationResolver{r} }

// Query returns generated.QueryResolver implementation.
func (r *Resolver) Query() generated.QueryResolver { return &queryResolver{r} }

type mutationResolver struct{ *Resolver }
type queryResolver struct{ *Resolver }
