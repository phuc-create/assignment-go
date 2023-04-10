//go:generate go run github.com/99designs/gqlgen generate
package graph

import "github.com/phuc-create/assignment-go/graph/models"

type Resolver struct {
	schools  []*models.School
	students []*models.Student
	subjects []*models.Subject
	teachers []*models.Teacher

	newTeacher *models.NewTeacher
	newSchool  *models.NewSchool
	newStudent *models.NewStudent
	newSubject *models.NewSubject
}
