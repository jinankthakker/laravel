<?php

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Model::unguard();
        DB::table('posts')->delete();
        for($i=0;$i<5;$i++){
            \App\Posts::create(['title' => "first post {$i}",'description'=>"this is a {$i} post description","content"=>"this is a {$i} post content"]);
        }
    }
}
