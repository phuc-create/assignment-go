package models

type Student struct {
	ID    int    `json:"id"`
	Name  string `json:"name"`
	Phone string `json:"phone"`
	Email string `json:"email"`
}

type Subject struct {
	ID   int    `json:"id"`
	Name string `json:"name"`
}

type Teacher struct {
	ID    int    `json:"id"`
	Name  string `json:"name"`
	Phone string `json:"phone"`
	Email string `json:"email"`
}

type Room struct {
	ID        int    `json:"id"`
	StudentID string `json:"student_id"`
	TeacherID string `json:"teacher_id"`
	SeatNum   string `json:"seat_num"`
}

type Class struct {
	ID        int    `json:"id"`
	Name      string `json:"name"`
	SubjectID string `json:"subject_id"`
	RoomID    string `json:"room_id"`
}

type School struct {
	ID    int    `json:"id"`
	Name  string `json:"name"`
	Email string `json:"email"`
}

type AddNewStudent struct {
	Name  string `json:"name"`
	Phone string `json:"phone"`
	Email string `json:"email"`
}
