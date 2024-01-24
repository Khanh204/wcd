package com.dao;

import com.entities.Student;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO implements DAOInterface<Student> {

    @Override
    public List<Student> get() {
        String sql = "SELECT * FROM student"; // JPQL
        ArrayList<Student> list = new ArrayList<>();
        try {
            Database db = Database.getInstance();
            ResultSet rs = db.getStatement().executeQuery(sql);
            while (rs.next()){
                list.add(new Student(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("address")
                ));
            }
        }catch (Exception e){

        }
        return list;
    }

    @Override
    public boolean create(Student student) {
        String sql = "INSERT INTO student (`name`,` email`,` address`) VALUES (?, ?, ?)";

        try {
            Database db = Database.getInstance();
            PreparedStatement statement = db.getPreparedStatement(sql);
            statement.setString(1, student.getName());
            statement.setString(2, student.getEmail());
            statement.setString(3, student.getAddress());

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            // Consider logging the error or throwing a custom exception
            return true;
        }
    }

    @Override
    public boolean update(Student student) {
        return false;
    }

    @Override
    public boolean delete(Student student) {
        return false;
    }

    @Override
    public <K> Student find(K id) {
        return null;
    }
}