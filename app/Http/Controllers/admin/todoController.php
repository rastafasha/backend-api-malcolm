<?php

namespace App\Http\Controllers\admin;

use App\Models\Todo;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\Todo\TodoResource;
use App\Http\Resources\Todo\TodoCollection;

class todoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // $search = $request->search;
        // $status = $request->status;
        
        // filterAdvance($search, $status)->

        $todos = Todo::orderby('id', 'desc')->get();

        return response()->json([
            "todos" => TodoCollection::make($todos)
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // $request->request->add(["user_id"=>auth('api')->user()->id]);
        $todo = Todo::create($request->all());

        return response()->json([
            "todo"=>$todo
        ]);
        
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $todo = Todo::findOrFail($id);
        return response()->json([
            'todo'=>TodoResource::make($todo)
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $todo = Todo::findOrFail($id);
        $todo->delete();
        return response()->json(["message"=>200]);
    }

    public function updateStatus(Request $request, $id)
    {
        $todo = Todo::findOrfail($id);
        $todo->status = $request->status;
        $todo->update();
        return $todo;
    }

    public function activos()
    {
        // $this->authorize('index', User::class);

        $todos = Todo::where('status', $status='activo')
        ->orderby('id', 'desc')
        ->get();
            return response()->json([
                'code' => 200,
                'status' => 'Listar todos activos',
                'todos' => $todos,
            ], 200);
    }
}

