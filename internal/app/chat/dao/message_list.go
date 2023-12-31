// =================================================================================
// This is auto-generated by GoFrame CLI tool only once. Fill this file as you wish.
// =================================================================================

package dao

import (
	"github.com/tiger1103/gfast/v3/internal/app/chat/dao/internal"
)

// internalMessageListDao is internal type for wrapping internal DAO implements.
type internalMessageListDao = *internal.MessageListDao

// messageListDao is the data access object for table message_list.
// You can define custom methods on it to extend its functionality as you wish.
type messageListDao struct {
	internalMessageListDao
}

var (
	// MessageList is globally public accessible object for table message_list operations.
	MessageList = messageListDao{
		internal.NewMessageListDao(),
	}
)

// Fill with you ideas below.
