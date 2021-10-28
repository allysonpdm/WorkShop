<?php

namespace App\Http\Requests;

use App\Exceptions\RespostaValidacaoException;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;

class BaseRequest extends FormRequest
{

    protected $saving;
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function __construct()
    {
        $this->saving = $this->isSaving();
        parent::__construct();
    }

    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [];
    }

    public function messages()
    {
        return [];
    }

    /**
     * Handle a failed validation attempt.
     *
     * @param  \Illuminate\Contracts\Validation\Validator  $validator
     * @return void
     *
     * @throws \Exceptions\RespostaValidacaoException
     */
    protected function failedValidation(Validator $validator): void
    {
        throw (new RespostaValidacaoException($validator));
    }

    public function getService()
    {
        return $this->route()->controller->getService();
    }

    protected function isSaving(): bool
    {
        $requestMethod = $this->method ?? $_SERVER['REQUEST_METHOD'];
        return $requestMethod == 'POST';
    }
}
