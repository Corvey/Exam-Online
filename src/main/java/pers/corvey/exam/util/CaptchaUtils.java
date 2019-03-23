package pers.corvey.exam.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.util.Objects;
import java.util.concurrent.ThreadLocalRandom;

/**
 * 验证码工具类
 * @author Corvey
 */
public class CaptchaUtils {
    
	private static final int DEFAULT_LENGTH = 4;	// 验证码默认长度
	
    private static final int IMG_WIDTH = 100;   // 验证码图片宽度
    
    private static final int IMG_HEIGHT = 45;   // 验证码图片高度
    
    private static final int FONT_SIZE = 23;    // 字体大小
    
    private static final int NUM_OF_LINES = 15; // 干扰线数量
    
    private static final double NOISE_PERCENT = 0.03;   // 噪点占比
    
    private static final int MAX_ANGEL_OF_ROTATION = 30;    // 字体倾斜角度上限

    // 验证码字符集
    private static final char[] CAPTCHA_CHARSET = "3adhkmnpgwxyEFGHJKMNPRWXY".toCharArray();

    // 验证码字体集
    private static final Font[] CAPTCHA_FONT_FAMILY = {
            new Font("Georgia", Font.BOLD, FONT_SIZE),
            new Font("Garamond", Font.BOLD, FONT_SIZE),
            new Font("Verdana", Font.BOLD, FONT_SIZE),
            new Font("Arial Unicode MS", Font.BOLD, FONT_SIZE),
            new Font("Consolas", Font.BOLD, FONT_SIZE),
            new Font("MS UI Gothic", Font.BOLD, FONT_SIZE)
    };
    
    // 噪点数量
    private static final int NUM_OF_NOISE = (int) (IMG_WIDTH * IMG_HEIGHT * NOISE_PERCENT);
    
    private static final int MARGIN_HORIZONTAL = 3; // 字符水平预留空位
    
    private static final int MARGIN_VERTICAL = (int) (FONT_SIZE * 0.85);    // 字符竖直预留空位 
    
    private static final int MIN_LETTER_COLOR_VAL = 0;  // 字体颜色值下限
    
    private static final int MAX_LETTER_COLOR_VAL = 120;    // 字体颜色值上限
    
    private static final int MIN_LINE_COLOR_VAL = 150;  // 干扰线颜色值下限
    
    private static final int MAX_LINE_COLOR_VAL = 200;  // 干扰线颜色值上限
    
    private static final int MIN_BACKGROUND_COLOR_VAL = 200;    // 背景颜色值下限
    
    private static final int MAX_BACKGROUND_COLOR_VAL = 256;    // 背景颜色值上限
    
    /**
     * 生成验证码
     * @param length    验证码长度
     * @return  验证码
     */
    public static String createCaptcha(int length) {
        char[] code = new char[length];
        ThreadLocalRandom random = ThreadLocalRandom.current();
        int bound = CAPTCHA_CHARSET.length;
        for (int i=0; i<length; ++i) {
            int index = random.nextInt(bound);
            code[i] = CAPTCHA_CHARSET[index];
        }
        return new String(code);
    }
    
    /**
     * 生成验证码（默认长度为4）
     * @return  验证码
     */
    public static String createCaptcha() {
        return createCaptcha(DEFAULT_LENGTH);
    }
    
    /**
     * 生成验证码
     * @param code 验证码
     * @return 验证码对应的BufferedImage
     */
    public static BufferedImage createCaptchaImage(String code) {

        BufferedImage bufferedImg = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = bufferedImg.createGraphics();
        
        // 设置背景颜色
        setBackgroundColor(g2d);
        
        // 添加噪点
        addNoise(bufferedImg);
        
        // 添加验证码
        addCaptcha(g2d, code);
        
        // 添加干扰线
        addLine(g2d);
        
        // 图像反色
        reverseImage(bufferedImg);
        
        g2d.dispose();
        return bufferedImg;
    }

    /**
     * 验证输入的验证码是否正确
     * @param correctCaptcha 正确的验证码
     * @param inputCaptcha 输入的验证码
     * @return 输入的验证码是否正确
     */
    public static boolean checkCaptcha(String correctCaptcha, String inputCaptcha) {
        return Objects.equals(correctCaptcha.toLowerCase(), inputCaptcha.toLowerCase());
    }
    
    private static void setBackgroundColor(Graphics2D g2d) {
        Color backgroundColor = getRandomColor(MIN_BACKGROUND_COLOR_VAL, MAX_BACKGROUND_COLOR_VAL); 
        g2d.setColor(backgroundColor);
        g2d.fillRect(0, 0, IMG_WIDTH, IMG_HEIGHT);
    }
    
    private static void addNoise(BufferedImage bufferedImg) {
        ThreadLocalRandom random = ThreadLocalRandom.current();
        for (int i=0; i < NUM_OF_NOISE; ++i) {
            int x = random.nextInt(IMG_WIDTH);
            int y = random.nextInt(IMG_HEIGHT);
            int rgb = random.nextInt(256);
            bufferedImg.setRGB(x, y, rgb);
        }
    }
    
    private static void addCaptcha(Graphics2D g2d, String code) {
        int unitWidth = IMG_WIDTH / code.length();
        char[] codeChars = code.toCharArray();
        ThreadLocalRandom random = ThreadLocalRandom.current();
        for (int i=0; i<code.length(); ++i) {
            int x = MARGIN_HORIZONTAL + i * unitWidth;
            int y = MARGIN_VERTICAL + random.nextInt(FONT_SIZE);
            double theta = Math.toRadians(
                    random.nextInt(-MAX_ANGEL_OF_ROTATION, MAX_ANGEL_OF_ROTATION));
            g2d.setColor(getRandomColor(MIN_LETTER_COLOR_VAL, MAX_LETTER_COLOR_VAL));
            g2d.setFont(getRandomFont());
            g2d.rotate(theta, x, y);    // 旋转
            g2d.drawChars(codeChars, i, 1, x, y);
            g2d.rotate(-theta, x, y);   // 复原旋转
        }
    }
    
    private static void addLine(Graphics2D g2d) {
        ThreadLocalRandom random = ThreadLocalRandom.current();
        for (int i=0; i<NUM_OF_LINES; ++i) {
            int x1 = random.nextInt(IMG_WIDTH);
            int y1 = random.nextInt(IMG_HEIGHT);
            int x2 = random.nextInt(IMG_WIDTH);
            int y2 = random.nextInt(IMG_HEIGHT);
            Color color = getRandomColor(MIN_LINE_COLOR_VAL, MAX_LINE_COLOR_VAL);
            g2d.setColor(color);
            g2d.drawLine(x1, y1, x2, y2);
        }
    }
    
    private static void reverseImage(BufferedImage bufferedImg) {
        ThreadLocalRandom random = ThreadLocalRandom.current();
        if (random.nextBoolean()) {
            int rgb;
            for (int i=0; i<IMG_WIDTH; ++i) {
                for (int j=0; j<IMG_HEIGHT; ++j) {
                    rgb = bufferedImg.getRGB(i, j);
                    bufferedImg.setRGB(i, j, 0xFFFFFF - rgb);
                }
            }
        }
    }
    
    private static Color getRandomColor(int minVal, int maxVal) {
        ThreadLocalRandom random = ThreadLocalRandom.current();
        int r = random.nextInt(minVal, maxVal);
        int g = random.nextInt(minVal, maxVal);
        int b = random.nextInt(minVal, maxVal);
        return new Color(r, g, b);
    }
    
    private static Font getRandomFont() {
        ThreadLocalRandom random = ThreadLocalRandom.current();
        int bound = CAPTCHA_FONT_FAMILY.length;
        int index = random.nextInt(bound);
        return CAPTCHA_FONT_FAMILY[index];
    }
    
// 扭曲图像
//  private static void twistVertical(Graphics2D g) {
//      ThreadLocalRandom random = ThreadLocalRandom.current();
//      double start = random.nextDouble(0.45);
//      double end = random.nextDouble(0.55, 1);
//      double len = end - start;
//      double luocha = random.nextDouble(IMG_WIDTH * 0.3, IMG_WIDTH * 0.6);
//      for (int i=0; i<IMG_HEIGHT; ++i) {
//          double d = luocha * Math.sin(start + i * len * 2 * Math.PI / IMG_HEIGHT);
//          int dx = (int) d;
//          try {
//              g.copyArea(0, i, IMG_WIDTH, 1, dx, 0);
//          } catch (Exception e) {
//              System.out.printf("i: %d, dx: %d\n", i, dx);
//              e.printStackTrace();
//          }
//          if (dx > 0) {
//              g.drawLine(0, i, dx, i);
//          } else {
//              g.drawLine(IMG_WIDTH + dx, i, IMG_WIDTH, i);
//          }
//      }
//  }
//  
//  private static void twistHorizontal(Graphics2D g) {
//      ThreadLocalRandom random = ThreadLocalRandom.current();
//      double start = random.nextDouble(0.45);
//      double end = random.nextDouble(0.55, 1);
//      double len = end - start;
//      double luocha = random.nextDouble(IMG_HEIGHT * 0.3, IMG_HEIGHT * 0.5);
//      for (int i=0; i<IMG_WIDTH; ++i) {
//          double d = luocha * Math.sin(start + i * len * 2 * Math.PI / IMG_WIDTH);
//          int dy = (int) d;
//          g.copyArea(i, 0, 1, IMG_HEIGHT, 0, dy);
//          if (dy > 0) {
//              g.drawLine(i, 0, i, dy);
//          } else {
//              g.drawLine(i, IMG_HEIGHT + dy, i, IMG_HEIGHT);
//          }
//      }
//  }
}
