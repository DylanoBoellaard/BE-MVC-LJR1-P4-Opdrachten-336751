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

    public function getToegewezenVoertuigen($Id)
    {
        $sql = "SELECT vo.Type, vo.Kenteken, vo.Bouwjaar, vo.Brandstof
                        ,tv.TypeVoertuig, tv.Rijbewijscategorie
                FROM Instructeur AS ins

                INNER JOIN VoertuigInstructeur AS vi
                ON ins.Id = vi.InstructeurId

                INNER JOIN Voertuig vo
                ON vi.VoertuigId = vo.Id

                INNER JOIN TypeVoertuig AS tv
                ON vo.TypeVoertuigId = tv.Id

                WHERE ins.Id = $Id
                ORDER BY tv.Rijbewijscategorie ASC";

        $this->db->query($sql);

        return $this->db->resultSet();
    }

    public function getInstructeurById($Id)
    {
        $sql = "SELECT ins.Voornaam, ins.Tussenvoegsel, ins.Achternaam, ins.DatumInDienst, ins.AantalSterren
                FROM Instructeur AS ins
                
                WHERE ins.Id = $Id";
        
        $this->db->query($sql);

        return $this->db->resultSet();
    }

    public function getBeschikbareVoertuigen()
    {
        // Text
    }
}