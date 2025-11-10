## 📋 **JSON Format Template for Truck Data**

### **🎯 Complete Structure Example:**

```json
{
  "trucks": {
    "light-duty": {
      "category": "Light Duty Trucks",
      "description": "Compact and efficient trucks for urban and light commercial applications (4.5T≤GCW≤25T)",
      "series": {
        "SERIES_NAME": {
          "seriesName": "Series Display Name",
          "description": "Series description text",
          "models": [
            {
              "id": "unique-truck-id",
              "name": "Truck Display Name",
              "fileName": "HTML-File-Name.html",
              "mainImage": "../assets/path/to/main/image.webp",
              "gallery": [
                "../assets/path/to/image1.webp",
                "../assets/path/to/image2.webp"
              ],
              "specifications": {
                "gvw": "Weight specification",
                "engine": "Engine type",
                "transmission": "Transmission type",
                "customSpec1": "Custom specification 1",
                "customSpec2": "Custom specification 2"
              },
              "features": [
                "Feature 1 description",
                "Feature 2 description",
                "Feature 3 description",
                "Feature 4 description"
              ],
              "applications": [
                "Application 1",
                "Application 2",
                "Application 3",
                "Application 4"
              ]
            }
          ]
        }
      }
    },
    "medium-duty": {
      "category": "Medium Duty Trucks",
      "description": "Robust trucks for medium commercial and industrial applications (12T≤GCW≤60T)",
      "series": {
        "SERIES_NAME": {
          "seriesName": "Series Display Name",
          "description": "Series description text",
          "models": [
            // Same structure as above
          ]
        }
      }
    },
    "heavy-duty": {
      "category": "Heavy Duty Trucks",
      "description": "Powerful trucks for heavy industrial and commercial applications (18T≤GCW≤100T)",
      "series": {
        "SERIES_NAME": {
          "seriesName": "Series Display Name",
          "description": "Series description text",
          "models": [
            // Same structure as above
          ]
        }
      }
    }
  }
}
```

### **🔧 Field Explanations:**

#### **Required Fields:**

- `id`: Unique identifier (lowercase, hyphenated)
- `name`: Display name for the truck
- `fileName`: Exact HTML file name (case-sensitive)
- `mainImage`: Path to main truck image
- `specifications`: Object with truck specs
- `features`: Array of key features (strings)
- `applications`: Array of use cases (strings)

#### **Optional Fields:**

- `gallery`: Array of additional images
- `description`: Custom truck description (falls back to series description)

### **📝 Example Entry for Missing Truck:**

```json
{
  "id": "x9-4x4-dump-truck",
  "name": "X9 4X4 Dump Truck",
  "fileName": "X9-4X4-Dump-Truck.html",
  "mainImage": "../assets/back2.jpeg",
  "gallery": ["../assets/back2.jpeg"],
  "specifications": {
    "gvw": "Under 25T",
    "driveType": "4X4 All-Wheel Drive",
    "engine": "Turbocharged Diesel",
    "transmission": "Manual/Automatic",
    "dumpCapacity": "8-12 cubic meters"
  },
  "features": [
    "All-terrain capability",
    "Enhanced traction control",
    "Heavy-duty dump body",
    "Rugged construction"
  ],
  "applications": [
    "Off-road construction",
    "Mining operations",
    "Rough terrain transport",
    "Construction site work"
  ]
}
```

### **🎨 Specifications Examples:**

#### **For Dump Trucks:**

```json
"specifications": {
  "gvw": "Weight range",
  "dumpCapacity": "X-Y cubic meters",
  "engine": "Engine type",
  "transmission": "Manual/Automatic",
  "wheelbase": "Xmm"
}
```

#### **For Mixer Trucks:**

```json
"specifications": {
  "gvw": "Weight range",
  "mixingCapacity": "X-Y cubic meters",
  "engine": "Engine type",
  "transmission": "Manual/Automatic",
  "drumRotation": "Speed info"
}
```

#### **For Cargo/Van Trucks:**

```json
"specifications": {
  "gvw": "Weight range",
  "cargoVolume": "X-Y cubic meters",
  "engine": "Engine type",
  "transmission": "Manual/Automatic",
  "loadCapacity": "X-Y tons"
}
```

#### **For Specialized Trucks:**

```json
"specifications": {
  "gvw": "Weight range",
  "specialCapacity": "Relevant capacity",
  "engine": "Engine type",
  "transmission": "Manual/Automatic",
  "specialFeature": "Unique specification"
}
```

### **📂 Series Structure:**

#### **Light Duty Categories:**

- **X9**: X9-Tow-Truck.html, X9-4X4-Dump-Truck.html, etc.
- **E9**: E9-Refrigerated-Truck.html, E9-Dump-Truck.html, etc.
- **X7**: X7-Concrete-Mixer-Truck.html, X7-Dump-Truck.html, etc.
- **E3**: E3-Cement-Mixer-Truck.html, E3-Dump-Truck.html, etc.

#### **Medium Duty Categories:**

- **X6**: X6-AWD-Cargo-Truck.html, X6-Dump-Truck.html, etc.
- **E6**: E6-Cement-Mixer-Truck.html, E6-Dump-Truck.html, etc.

#### **Heavy Duty Categories:**

- **9**: 9-Series-Cement-Mixer-Truck.html, 9-Series-Garbage-Truck.html, etc.
- **6**: 6-Series-Cement-Mixer-Truck.html, 6-Series-Garbage-Truck.html, etc.
- **3**: 3-Series-Cement-Mixer-Truck.html
- **Z3**: Z3-Dump-Truck.html
- **i9**: i9-New-Series.html
- **E1st**: E1st-Tractor.html

### **💡 Tips for Adding Data:**

1. **Copy the structure** from existing entries
2. **Match fileName exactly** to HTML file names
3. **Use consistent specifications** within each series
4. **Keep features concise** (4-6 items)
5. **List relevant applications** (4-6 items)
6. **Use placeholder images** (`../assets/back2.jpeg`) initially
7. **Maintain proper JSON syntax** (commas, quotes, brackets)

This format will allow the generation scripts to create complete, consistent truck pages with all the necessary content!
