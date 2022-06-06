BEGIN {
    inatoms = 0
    x = 1
    y = 2
    iatom=0
    if (Npoly == "full")
        Npoly = 1e22
    image[x] = image[y] = 0
}

/LAMMPS/{
    print
    next
}

/xlo xhi/{
    L[x] = $2 - $1
}

/ylo yhi/{
    L[y] = $2 - $1
}

/atom types/ {
    print
    print "1 bond types"
    next
}

/atoms/ {
    natoms = $1
    print
    printf "%s bonds\n", "_NUMBER_OF_BONDS_"
    next
}

NF > 0 && $1 == "Atoms" {
    inatoms=1
    print
    getline
    printf "\n"
    next
}

inatoms && NF ==0 {
    inatoms = 0
    print
    next
}

inatoms {
    iatom++
    R[x] = $3
    R[y] = $4
    if (iatom>1) {
        for (i = 1; i <= 2; i++)
            if (abs(R[i] - prevR[i]) > L[i]/2)
                if (R[i] < prevR[i]) image[i]++; else image[i]--
    }
    prevR[x] = R[x]
    prevR[y] = R[y]
    $(NF-2) = image[x]
    $(NF-1) = image[y]
    print
    next
}

!inatoms {
    print
    next
}

END {
    printf "\nBonds\n\n"
    ibond = 0
    ipoly = 0
    for (q = 1; q < iatom; q++) {
        if (isbound(q)) {
            ibond++
            ip = q
            jp = q+1
            bondtype = 1
            print ibond, bondtype, ip, jp
            if (ip != prev)
                ipoly++
            print ip, ipoly >> "poly.id"
            prev = jp
        }
    }
}

function abs(x) {
    return x > 0 ? x : -x
}

function isbound(i,        p, r, np) {
    p = Nbeads + Nsolvent
    r = (i-1) % p
    np = int(i/p) + 1
    return r < Nbeads-1 && i < iatom && np <= Npoly
}
