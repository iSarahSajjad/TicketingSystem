<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class TicketTypeTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('ticket_types')->insert([

            [
                'name' => 'Silver,',
                'price' => '20.40',
            ],
            [
                'name' => 'Gold,',
                'price' => '25.00',
            ],
            [
                'name' => 'Platinum',
                'price' => '20.40',
            ],
        ]);
    }
}
