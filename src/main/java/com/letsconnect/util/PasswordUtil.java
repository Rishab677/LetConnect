package com.letsconnect.util;

import java.nio.ByteBuffer;

import java.security.SecureRandom;
import java.security.spec.KeySpec;
import java.util.Base64;

import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

public class PasswordUtil {

    private static final int SALT_LENGTH_BYTE = 16;
    private static final int HASH_LENGTH_BYTE = 32;
    private static final int ITERATIONS = 65536;
    private static final String ALGORITHM = "PBKDF2WithHmacSHA256";

    // Generate a random salt
    private static byte[] getRandomSalt() {
        byte[] salt = new byte[SALT_LENGTH_BYTE];
        new SecureRandom().nextBytes(salt);
        return salt;
    }

    // Generate the hashed key from password and salt
    private static byte[] hashPassword(final char[] password, final byte[] salt) throws Exception {
        SecretKeyFactory factory = SecretKeyFactory.getInstance(ALGORITHM);
        KeySpec spec = new PBEKeySpec(password, salt, ITERATIONS, HASH_LENGTH_BYTE * 8);
        SecretKey secretKey = factory.generateSecret(spec);
        return secretKey.getEncoded();
    }

    // Encode (Hash) password and return salt + hash as Base64 string
    public static String hashPassword(String password) {
        try {
            byte[] salt = getRandomSalt();
            byte[] hash = hashPassword(password.toCharArray(), salt);

            ByteBuffer buffer = ByteBuffer.allocate(SALT_LENGTH_BYTE + HASH_LENGTH_BYTE);
            buffer.put(salt);
            buffer.put(hash);

            return Base64.getEncoder().encodeToString(buffer.array());
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // Verify password by decoding Base64 and comparing with hashed input
    public static boolean verifyPassword(String inputPassword, String storedPassword) {
        try {
            byte[] decoded = Base64.getDecoder().decode(storedPassword);

            byte[] salt = new byte[SALT_LENGTH_BYTE];
            byte[] hash = new byte[HASH_LENGTH_BYTE];

            ByteBuffer buffer = ByteBuffer.wrap(decoded);
            buffer.get(salt);
            buffer.get(hash);

            byte[] inputHash = hashPassword(inputPassword.toCharArray(), salt);

            // Direct array comparison (no timing attack protection)
            if (inputHash.length != hash.length) return false;

            for (int i = 0; i < hash.length; i++) {
                if (inputHash[i] != hash[i]) return false;
            }

            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
