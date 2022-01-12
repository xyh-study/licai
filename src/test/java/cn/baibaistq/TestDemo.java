package cn.baibaistq;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * @author xyh
 * @create 2022-01-12 18:54
 */
public class TestDemo {

    public static void main(String[] args) throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
        Class<Person> personClass = Person.class;
        Method sayHello = personClass.getMethod("sayHello");
        String  invoke = (String) sayHello.invoke(new Person());
        System.out.println(invoke);

        Method sayHello2 = personClass.getMethod("sayHello2");
        // 没有返回值的话就是null
        String invoke1 = (String) sayHello2.invoke(new Person());
        System.out.println(invoke1);

    }
}


class Person {
    private String username;
    private String password;

    public Person(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public Person() {
    }

    public String sayHello() {
        return "hello world";
    }

    public void sayHello2(){
        System.out.println("say hello 2");
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}