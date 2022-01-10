import decimal
# The representation of a network flow is with an array of edges, vertices as numbers, and with matrix representation of capacities
# The edges aren't actually needed, but they shorten the loop time complexity

def EdmondsKarp(Edges, caps, s, t):
    n = len(caps)
    flow = 0
    F = [[0 for y in range(n)] for x in range(n)]
    while True:
        P = [-1 for x in range(n)]
        P[s] = -2
        M = [0 for x in range(n)]
        M[s] = decimal.Decimal('Infinity')
        BFSq = []
        BFSq.append(s)
        # This assumes that the result of BFS is in the form pathFlow, P
        # I learned this cool trick where if you know the format
        # of what you're setting a variable to, you can create two variables at once.
        pathFlow, P = BFS(Edges, caps, s, t, F, P, M, BFSq)
        #If no more augmenting paths
        if pathFlow == 0:
            break
        flow = flow + pathFlow
        v = t
        while v != s:
            u = P[v]
            # This accounts for balancing residual edges with edges
            # but BFS accounts for not sending negative flow/overflow on an edge
            F[u][v] = F[u][v] + pathFlow
            F[v][u] = F[v][u] - pathFlow
            v = u
    # Used the same cool trick
    # Flow is the flow sent on each edge - so a residual edge has negative flow!
    return flow, F

def BFS(Edges, caps, s, t, F, P, M, BFSq):
    while (len(BFSq) > 0):
        u = BFSq.pop(0)
        for v in Edges[u]:
            if caps[u][v] - F[u][v] > 0 and P[v] == -1:
                P[v] = u
                M[v] = min(M[u], caps[u][v] - F[u][v])
                if v != t:
                    BFSq.append(v)
                else:
                    return M[t], P
    return 0, P


E2 =[[1,2],[3,4],[4],[5],[5],[]]
C2=[[0,5,5,0,0,0],[0,0,0,5,2,0],[0,0,0,0,2,0],[0,0,0,0,0,5],[0,0,0,0,0,3],[0,0,0,0,0,0]]

s=0
t=5

print(EdmondsKarp(E2, C2, s, t))
