package graph

import "github.com/phuc-create/assignment-go/models"

type Resolverv2 struct {
	students []*models.Student
	teachers []*models.Teacher
	rooms    []*models.Room
	classes  []*models.Class
	schools  []*models.School
}
