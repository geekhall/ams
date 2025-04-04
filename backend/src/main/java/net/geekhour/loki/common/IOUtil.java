package net.geekhour.loki.common;

import java.io.*;
import java.nio.charset.StandardCharsets;

/**
 * @author Jasper Yang
 * @create 2025/02/01 15:27
 */
public class IOUtil {

    /**
     * Copy the contents of the given InputStream to the given OutputStream.
     * @param from
     * @param to
     * @throws IOException
     */
    public static void copy(InputStream from, OutputStream to) throws IOException {
        byte[] buffer = new byte[4096];
        int bytesRead;
        while ((bytesRead = from.read(buffer)) != -1) {
            to.write(buffer, 0, bytesRead);
        }
        to.flush();
    }

    /**
     * Read the contents of the given InputStream into a byte array.
     * @param in
     * @return
     * @throws IOException
     */
    public static byte[] readBytes(InputStream in) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        copy(in, out);
        return out.toByteArray();
    }

    /**
     * Read the contents of the given InputStream into a String.
     * @param in
     * @return
     * @throws IOException
     */
    public static String readString(InputStream in) throws IOException {
        return new String(readBytes(in), StandardCharsets.UTF_8);
    }

    /**
     * Copy the contents of the given Reader to the given Writer.
     * @param from
     * @param to
     * @throws IOException
     */
    public static void copy(Reader from, Writer to) throws IOException {
        char[] buffer = new char[4096];
        int charsRead;
        while ((charsRead = from.read(buffer)) != -1) {
            to.write(buffer, 0, charsRead);
        }
        to.flush();
    }

}
