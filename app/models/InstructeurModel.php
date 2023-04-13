<?php

class InstructeurModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getInstructeurs()
    {
        $sql = "SELECT * FROM Instructeur ORDER BY AantalSterren DESC"; // TO DO: change * to column names

        $this->db->query($sql);

        return $this->db->resultSet();
    }
}