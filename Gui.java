package com.company;


import javax.swing.*;
import javax.swing.border.Border;
import java.awt.*;
import java.io.File;
import java.io.PrintWriter;

public class Gui extends JFrame {


    // Buttons for course + room
    // Text fields
    // Radio buttons for room



    JFrame frame;
    JPanel basePanel;
    ActionPanel actionPanel;
    Model model;
    JPanel topPanel;
    File file;
    String hello = new String("Welcome! Let's schedule!");


public void makeGui(){

    makeFrame();
    makeMenu();
    sayHello(hello);

}


public void makeFrame(){

    // BASE FRAME
    JFrame frame = new JFrame("Scheduler");
    frame.setDefaultCloseOperation(EXIT_ON_CLOSE);
    frame.setSize(400, 400);
    //frame.pack();
    frame.setLocationRelativeTo(null);
    frame.setVisible(true);


    //BASE PANEL
    JPanel basePanel = new JPanel();
    basePanel.setLayout(new BorderLayout());
    frame.add(basePanel);


    //ACTION PANEL
    actionPanel = new ActionPanel(model);
    actionPanel.setBackground(Color.white);
    basePanel.add(actionPanel, BorderLayout.CENTER);


    //TOPPANEL
    JPanel topPanel = new JPanel();
    topPanel.setLayout(new FlowLayout());
    basePanel.add(topPanel, BorderLayout.NORTH);
}


public void sayHello(String hello) {

    //POP UP WELCOME
    JOptionPane.showMessageDialog(frame, hello, "Welcome", JOptionPane.PLAIN_MESSAGE);
}



public void makeMenu(){

    JMenuBar mainMenu = new JMenuBar();
    topPanel.add(mainMenu);


}

}


