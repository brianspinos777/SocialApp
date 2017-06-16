Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'

#
# If you are seeing the following error:
#    “The bucket you are attempting to access must be addressed using the
#     specified endpoint. Please send all future requests to this endpoint.”
#     Try setting the specified endpoint with the s3_host_name config var.
#
#Paperclip::Attachment.default_options[:s3_host_name] = 's3-us-west-2.amazonaws.com'