module.exports = function (sequelize, DataTypes) {
  return sequelize.define('achievement', {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    sequence: {
      type: DataTypes.INTEGER,
      allowNull: false,
      unique: true
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true
    },
    distance: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    title: {
      type: DataTypes.STRING
    },
    subtitle: {
      type: DataTypes.STRING
    },
    description: {
      type: DataTypes.TEXT
    },
    media: {
      type: DataTypes.TEXT
    },
    icon_name: {
      type: DataTypes.STRING
    },
    map_image: {
      type: DataTypes.STRING
    },
    content: {
      type: DataTypes.TEXT
    }
  }, {
    tableName: 'achievement'
  })
}
