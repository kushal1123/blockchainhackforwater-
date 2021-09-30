
pragma solidity >=0.7.0 <0.9.0;

contract Waterbody {

    uint256 public depthSafelevel;
    uint256 public polutionSafelevel;
    bytes32 public lastRecordTime;
    uint256 public depthCurrentlevel;
    uint256 public polutionCurrentlevel;
    
    // event which can be captured by any intrested parties through small listner logic
    event DangerWaterDepthReached(uint256 currentWaterLevel);
    event DangerWaterPolutionReached(uint256 currentPolution);
     
    /**
     * constructor, Safe levels of depth and polution are captured for respective waterbody
     */
    constructor(uint256 safeDepth, uint256 safePolution) {
        depthSafelevel = safeDepth;
        polutionSafelevel = safePolution;
    }
    
    /**
     * function to record level & polution level 
     */
    function recordMetrics(uint256 currentDepth, uint256 currentPolution, bytes32  recordTime) public {
        depthCurrentlevel = currentDepth;
        polutionCurrentlevel = currentPolution;
        lastRecordTime = recordTime;
        if (polutionCurrentlevel > polutionSafelevel)
        {
            emit DangerWaterPolutionReached(polutionCurrentlevel);
        }
        
        if (depthCurrentlevel < depthSafelevel)
        {
            emit DangerWaterDepthReached(depthCurrentlevel);
        }
    }
}