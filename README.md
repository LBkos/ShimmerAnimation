# Задание

Создать список с изображением и текстом, добавить возможность удалять элементы. Создать кнопку вправом углу navigation бара с возможностью активации анимации редактирования.

# Решение

Инициализируем переменную с данными для представления в **List**

```swift

@State var list: [Int] = Array(stride(from: 1, to: 30, by: 1))

```

Создаем список с данными

```swift

List {
                ForEach(list, id: \.self) { item in
                    HStack(spacing: 16) {
                        Image(systemName: "person.circle.fill")
                            .font(.title)
                        Text("Item \(item)")
                            .fontWeight(.bold)
                    }
			.padding()

```

Для режима редактирования и удаления элементов добавляем модификаторы

```swift

    .redacted(reason: isRedacted ? .placeholder : [])
                }
                .onDelete(perform: onDelete(_:))

```
Модификатор можно добавить только к тексту или картинке, тогда будет преобразован один из элементов.

Для создания кнопки используем **.toolbar**

```swift

.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Button") {
                        isRedacted.toggle()
                    }
                }
```

Для того что бы кнока появилась оборачиваем **List** в **NavigationView**