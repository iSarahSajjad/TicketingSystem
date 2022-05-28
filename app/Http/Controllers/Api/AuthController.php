<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\ApiBaseController;
use Illuminate\Http\Request;
use App\Models\User;

class AuthController extends ApiBaseController
{

    //Login Request
    public function login(Request $request)
    {
        $data = [
            'email' => $request->email,
            'password' => $request->password
        ];

        if (auth()->attempt($data)) {
            $token = auth()->user()->createToken('PassportAuthTicketing')->accessToken;
            return $this->Response(['token' => $token]);
        } else {
            return $this->Response(['error' => 'Unauthorised'], 401);
        }
    }

}
