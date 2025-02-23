package router

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func SetupRouter() *gin.Engine {
	router := gin.Default()

	router.GET("/", home)
	router.GET("/status", healthCheck)

	return router
}

func home(c *gin.Context) {
	c.String(http.StatusOK, "home sweet home")
}

func healthCheck(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"status": "up",
	})
}
	