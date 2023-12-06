<?php

namespace App\Models\Course;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class CourseClasse extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable =[
        'course_section_id',
        'name',
        'description',
        'vimeo_id',
        'time',
        'state',

    ];

    public function setCreateAttribute($value){
        date_default_timezone_set("America/Caracas"); 
        $this->attribute['created_at']= Carbon::now();
    }

    public function setUpdateAttribute($value){
        date_default_timezone_set("America/Caracas"); 
        $this->attribute['updated_at']= Carbon::now();
    }
    // relaciones
    public function course_section(){
        return $this->belongsTo(CourseSection::class);
    }

    public function files(){
        return $this->hasMany(CourseClasseFile::class, "course_clase_id");
    }

    function AddTimes($horas)
        {
            $total = 0;
            foreach($horas as $h) {
                $parts = explode(":", $h);
                $total += $parts[2] + $parts[1]*60 + $parts[0]*3600;
            }
            $hours = floor($total / 3600);
            $minutes = floor(($total / 60) % 60);
            $seconds = $total % 60;

            return $hours." hrs ".$minutes." mins";
    }

    public function getTimeClasseAttribute(){
        $times = [];
        array_push($times,$this->time);
        
        return $this->AddTimes($times);
        
    }
}
