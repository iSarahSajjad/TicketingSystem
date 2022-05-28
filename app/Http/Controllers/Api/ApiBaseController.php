<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;

class ApiBaseController extends Controller {

    public function Response($data = [], $status = 200)
    {
        return response()->json($data, $status);
    }

}
