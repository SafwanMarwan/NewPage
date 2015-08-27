module V1
  class Base < Grape::API
    # Apis
    mount V1::Users

    add_swagger_documentation  base_path: "",
                               mount_path: "/documentation/v1",
                               format: :json,
                               api_version: "v1",
                               markdown: false,
                               hide_documentation_path: true,
                               hide_format: true,
                               include_base_url: false


  end
end