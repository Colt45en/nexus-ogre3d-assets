#ifndef BULLET_PHYSICS_WRAPPER_H
#define BULLET_PHYSICS_WRAPPER_H

// Bullet Physics Integration Header for OGRE 3D
// Example wrapper for common Bullet physics operations

#include <btBulletDynamicsCommon.h>
#include <OgreVector3.h>
#include <OgreQuaternion.h>

namespace NexusPhysics
{
    /**
     * @brief Utility class for converting between OGRE and Bullet types
     */
    class BulletOgreConverter
    {
    public:
        /// Convert OGRE Vector3 to Bullet btVector3
        static btVector3 toBullet(const Ogre::Vector3& ogreVec)
        {
            return btVector3(ogreVec.x, ogreVec.y, ogreVec.z);
        }
        
        /// Convert Bullet btVector3 to OGRE Vector3
        static Ogre::Vector3 toOgre(const btVector3& bulletVec)
        {
            return Ogre::Vector3(bulletVec.x(), bulletVec.y(), bulletVec.z());
        }
        
        /// Convert OGRE Quaternion to Bullet btQuaternion
        static btQuaternion toBullet(const Ogre::Quaternion& ogreQuat)
        {
            return btQuaternion(ogreQuat.x, ogreQuat.y, ogreQuat.z, ogreQuat.w);
        }
        
        /// Convert Bullet btQuaternion to OGRE Quaternion
        static Ogre::Quaternion toOgre(const btQuaternion& bulletQuat)
        {
            return Ogre::Quaternion(bulletQuat.w(), bulletQuat.x(), bulletQuat.y(), bulletQuat.z());
        }
    };
    
    /**
     * @brief Physics world manager for Bullet integration
     */
    class PhysicsWorld
    {
    private:
        btDefaultCollisionConfiguration* m_collisionConfiguration;
        btCollisionDispatcher* m_dispatcher;
        btDbvtBroadphase* m_broadphase;
        btSequentialImpulseConstraintSolver* m_solver;
        btDiscreteDynamicsWorld* m_dynamicsWorld;
        
    public:
        PhysicsWorld();
        ~PhysicsWorld();
        
        /// Initialize the physics world
        bool initialize();
        
        /// Step the physics simulation
        void stepSimulation(float timeStep, int maxSubSteps = 1);
        
        /// Add a rigid body to the world
        void addRigidBody(btRigidBody* body);
        
        /// Remove a rigid body from the world
        void removeRigidBody(btRigidBody* body);
        
        /// Get the dynamics world
        btDiscreteDynamicsWorld* getDynamicsWorld() { return m_dynamicsWorld; }
    };
}

#endif // BULLET_PHYSICS_WRAPPER_H