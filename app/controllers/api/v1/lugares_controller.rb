module Api
    module V1
        class LugaresController < ApplicationController

            def index
                # Obtengo todos los lugares
                lugares = Lugare.order('created_at DESC')
                render json: {codigo: 200, mensaje: 'Estos son todos los lugares ingresados en la base de datos', data: lugares},status: :ok

            end

            def show
                begin
                    # Encuentra lugar por id
                    lugar = Lugare.find(params[:id])
                    render json: {codigo: 200, mensaje: 'Lugar encontrado', data: lugar},status: :ok
                rescue ActiveRecord::RecordNotFound
                    # No encuentra el lugar por id 
                    render json: {codigo: 404, mensaje: 'Lugar NO encontrado'},status: :not_found 
                end
            end

            def create
                lugar = Lugare.new(lugar_parametros)
                if lugar.save
                    render json: {codigo: 200, mensaje: 'Lugar creado', data: lugar}, status: :created 
                else
                    render json: {codigo: 422, mensaje: 'Lugar no ha podido ser creado', data: lugar.errors}, status: :unprocessable_entity
                end
            end

            def destroy
                begin
                    # Encuentra lugar por id
                    lugar = Lugare.find(params[:id])
                    lugar.destroy
                    render json: {codigo: 200, mensaje: 'Lugar eliminado', data: lugar},status: :ok
                rescue ActiveRecord::RecordNotFound
                    # No encuentra el lugar por id 
                    render json: {codigo: 404, mensaje: 'Lugar NO encontrado'},status: :not_found 
                end
            end


            def update
                begin
                    # Encuentra lugar por id
                    lugar = Lugare.find(params[:id])
                    # intenta actualizar
                    if lugar.update_attributes(lugar_parametros)
                        render json: {codigo: 200, mensaje: "Lugar actualizado exitosamente", data: lugar}, status: :ok
                    else
                        render json: {codigo: 400, mensaje: "No se pudo actualizar el lugar", data: lugar.errors}, status: :bad_request 
                    end
                rescue ActiveRecord::RecordNotFound
                    # No encuentra el lugar por id 
                    render json: {codigo: 404, mensaje: 'Lugar NO encontrado'},status: :not_found 
                end

            end

            private
            def lugar_parametros
                params.permit(:nombre, :latitud, :longitud, :urlmapa)
            end



        end
    end
end
        