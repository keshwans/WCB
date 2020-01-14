module.exports = function (sequelize, DataTypes) {
  return sequelize.define('notification', {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    message: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: false
    },
    message_date: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Date.now()
    },
    expiry_date: {
      type: DataTypes.DATE,
      allowNull: true
    },
    priority: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue: 10,
      validate: {
        min: 0,
        max: 10
      }
    },
    event_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue: 0
    }
  }, {
    tableName: 'notification'
  })
}