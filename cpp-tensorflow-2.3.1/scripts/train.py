import numpy as np
import tensorflow as tf

print(tf.version.VERSION)

def conv2d(x, ch):
    x = tf.keras.layers.Convolution2D(ch
        , activation=tf.nn.relu, kernel_size=(3, 3), strides=(1, 1), padding='same'
        , use_bias=True, bias_initializer='zeros'
        )(x)
    return x

class Trainer:
    def __init__(self):
        self.model = self.define_model()
        self.model.compile(
              loss = "sparse_categorical_crossentropy"
            , optimizer = tf.keras.optimizers.SGD(learning_rate=0.01, momentum=0.9, nesterov=True, name="SGD_momentum") 
            , metrics = tf.keras.metrics.SparseCategoricalAccuracy())
            
    def define_model(self):
        x_in = x = tf.keras.layers.Input((28, 28, 1))
        x = tf.keras.layers.MaxPool2D(pool_size=(2, 2), strides=None, padding="valid")(x)
        x = conv2d(x, ch=64)
        x = conv2d(x, ch=128)
        x = tf.keras.layers.GlobalAveragePooling2D()(x)
        x = tf.keras.layers.Dense(10)(x)
        y = tf.keras.layers.Activation("softmax")(x)
        return tf.keras.Model(inputs=x_in, outputs=y)
    
    def train(self, X_train, y_train, X_test, y_test):
        self.model.fit(X_train, y_train
            , validation_data=(X_test, y_test)
            , epochs=10, batch_size=50
            )

def main():
    (X_train, y_train), (X_test, y_test) = tf.keras.datasets.mnist.load_data()
    X_train = X_train.astype(np.float32).reshape(-1, 28, 28, 1) / 255.0
    X_test = X_test.astype(np.float32).reshape(-1, 28, 28, 1) / 255.0

    trainer = Trainer()
    trainer.train(X_train, y_train, X_test, y_test)

    val_loss, val_acc = trainer.model.evaluate(X_test, y_test, batch_size=50)
    print(val_loss, val_acc)

if(__name__=="__main__"):
    main()