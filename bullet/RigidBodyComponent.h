#ifndef RIGID_BODY_COMPONENT_H
#define RIGID_BODY_COMPONENT_H

// Rigid Body Component for OGRE 3D entities with Bullet physics
// Example component-based physics integration

#include <btBulletDynamicsCommon.h>
#include <OgreSceneNode.h>
#include <memory>

namespace NexusPhysics
{
    /**
     * @brief Component that adds physics simulation to OGRE scene nodes
     */
    class RigidBodyComponent
    {
    private:
        btRigidBody* m_rigidBody;
        btCollisionShape* m_collisionShape;
        btDefaultMotionState* m_motionState;
        Ogre::SceneNode* m_sceneNode;
        
    public:
        RigidBodyComponent(Ogre::SceneNode* sceneNode);
        ~RigidBodyComponent();
        
        /// Create a box collision shape
        bool createBoxShape(const Ogre::Vector3& halfExtents, float mass = 1.0f);
        
        /// Create a sphere collision shape
        bool createSphereShape(float radius, float mass = 1.0f);
        
        /// Create a static mesh collision shape
        bool createMeshShape(btTriangleMesh* triangleMesh);
        
        /// Apply force to the rigid body
        void applyForce(const Ogre::Vector3& force, const Ogre::Vector3& relativePos = Ogre::Vector3::ZERO);
        
        /// Apply impulse to the rigid body
        void applyImpulse(const Ogre::Vector3& impulse, const Ogre::Vector3& relativePos = Ogre::Vector3::ZERO);
        
        /// Set linear velocity
        void setLinearVelocity(const Ogre::Vector3& velocity);
        
        /// Set angular velocity
        void setAngularVelocity(const Ogre::Vector3& velocity);
        
        /// Update OGRE scene node from physics simulation
        void updateSceneNode();
        
        /// Get the Bullet rigid body
        btRigidBody* getRigidBody() { return m_rigidBody; }
        
        /// Set collision group and mask
        void setCollisionFilter(short group, short mask);
    };
}

#endif // RIGID_BODY_COMPONENT_H