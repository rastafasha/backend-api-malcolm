<?php

namespace App\Http\Controllers;

use App\Models\Contact;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Requests\ContactFormRequest;

class ContactFormController extends Controller
{

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function contactStore(ContactFormRequest $request)
    {
        try {
            DB::beginTransaction();

            $contact = new Contact();

            $input = $this->contactInput();
            $contact->fill($input)->save();

            DB::commit();
            return response()->json([
                'message' => 'Contact created successfully',
                'contact' => $contact,
            ], 201);
        } catch (\Throwable $exception) {
            DB::rollBack();
            return response()->json([
                'message' => 'Error no crated',
            ], 500);
        }
        // return Contact::create($request->all());
    }


    /**
     * Función protegida para guardar los datos
     *
     * @return array
     */
    protected function contactInput(): array {
        return [
            "name" => request("name"),
            "lastname" => request("lastname"),
            "phone" => request("phone"),
            "whatsapp" => request("whatsapp"),
            "email" => request("email"),
            "subject" => request("subject"),
            "comment" => request("comment"),
            "status" => request("status"),
        ];
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $contacts = Contact::get();

        return response()->json([
            'code' => 200,
            'status' => 'List contacts',
            'contacts' => $contacts,
        ], 200);
    }

    public function show(Contact $contact)
    {

        if (!$contact) {
            return response()->json([
                'message' => 'contact not found.'
            ], 404);
        }

        return response()->json([
            'code' => 200,
            'status' => 'success',
            'contact' => $contact,
        ], 200);
    }

}
