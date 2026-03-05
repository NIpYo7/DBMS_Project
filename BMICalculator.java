import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class BMICalculator extends JFrame implements ActionListener {

    JTextField weightField;
    JTextField heightField;
    JLabel resultLabel;
    JLabel categoryLabel;

    JRadioButton metricBtn;
    JRadioButton englishBtn;

    JButton calculateBtn;
    JButton clearBtn;

    public BMICalculator() {

        setTitle("BMI Calculator");
        setSize(420,350);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        JPanel panel = new JPanel();
        panel.setLayout(new GridLayout(8,2,10,10));
        panel.setBorder(BorderFactory.createEmptyBorder(20,20,20,20));

        JLabel title = new JLabel("Body Mass Index Calculator");
        title.setFont(new Font("Arial",Font.BOLD,16));
        title.setHorizontalAlignment(SwingConstants.CENTER);

        panel.add(title);
        panel.add(new JLabel(""));

        panel.add(new JLabel("Weight:"));
        weightField = new JTextField();
        panel.add(weightField);

        panel.add(new JLabel("Height:"));
        heightField = new JTextField();
        panel.add(heightField);

        metricBtn = new JRadioButton("Metric (kg, meters)", true);
        englishBtn = new JRadioButton("English (pounds, inches)");

        ButtonGroup group = new ButtonGroup();
        group.add(metricBtn);
        group.add(englishBtn);

        panel.add(metricBtn);
        panel.add(englishBtn);

        calculateBtn = new JButton("Calculate BMI");
        calculateBtn.addActionListener(this);

        clearBtn = new JButton("Clear");
        clearBtn.addActionListener(this);

        panel.add(calculateBtn);
        panel.add(clearBtn);

        resultLabel = new JLabel("BMI: ");
        resultLabel.setFont(new Font("Arial",Font.BOLD,14));

        categoryLabel = new JLabel("Category: ");
        categoryLabel.setFont(new Font("Arial",Font.BOLD,14));

        panel.add(resultLabel);
        panel.add(categoryLabel);

        add(panel);

        setVisible(true);
    }

    public void actionPerformed(ActionEvent e) {

        if(e.getSource() == clearBtn){

            weightField.setText("");
            heightField.setText("");
            resultLabel.setText("BMI: ");
            categoryLabel.setText("Category: ");
            categoryLabel.setForeground(Color.BLACK);

            return;
        }

        try{

            if(weightField.getText().isEmpty() || heightField.getText().isEmpty()){
                JOptionPane.showMessageDialog(this,"Please enter weight and height");
                return;
            }

            double weight = Double.parseDouble(weightField.getText());
            double height = Double.parseDouble(heightField.getText());

            if(weight <= 0 || height <= 0){
                JOptionPane.showMessageDialog(this,"Values must be positive numbers");
                return;
            }

            double bmi;

            if(metricBtn.isSelected()){
                bmi = weight / (height * height);
            }
            else{
                bmi = (weight * 703) / (height * height);
            }

            resultLabel.setText("BMI: " + String.format("%.2f", bmi));

            if(bmi < 18.5){
                categoryLabel.setText("Category: Underweight");
                categoryLabel.setForeground(Color.BLUE);
            }
            else if(bmi < 25){
                categoryLabel.setText("Category: Normal");
                categoryLabel.setForeground(Color.GREEN);
            }
            else if(bmi < 30){
                categoryLabel.setText("Category: Overweight");
                categoryLabel.setForeground(Color.ORANGE);
            }
            else{
                categoryLabel.setText("Category: Obese");
                categoryLabel.setForeground(Color.RED);
            }

        }
        catch(NumberFormatException ex){

            JOptionPane.showMessageDialog(this,"Enter valid numbers only");

        }
    }

    public static void main(String[] args) {

        new BMICalculator();

    }
}