from django.contrib.auth.tokens import PasswordResetTokenGenerator
import six

# classe per generar el token per la verificació de correu
class TokenGenerator(PasswordResetTokenGenerator):

    def _make_hash_value(self, user, timestamp):
        return (six.text_type(user.pk) + six.text_type(timestamp) + six.text_type(user.is_email_verified))


generate_token = TokenGenerator()