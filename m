Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA5E40DFD6
	for <regressions@lists.linux.dev>; Sun, 15 Mar 2026 08:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773563876; cv=pass; b=kcxvZyxIGimwmfiTsivncTjEa11CMLrwCXIyN4yUWX46Bw1g5i/ii2fHLqK48AfUyNHyTkgI7oA64vK6k8cfiUYANqIshi7n70eWIWRSB5qjzm8v28TMnFGylsjhP7buzbLgVy9Dd5jGmo6jQnlnxftXXz1aNlBzix+/nIw7MCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773563876; c=relaxed/simple;
	bh=kYvpmUsx3zfdl5+qbJr0a8puIn6OtSFPU7f+rQIcCsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=EuC6GXY5uCPB0ksRuRh5iadECIgUX2ewaf82x6XkNhs7tI9QbAeUFFCha1CFPY9TkEVi0Rb1qKdy1fAQo0UhM/cCSn2FitSHJtYTu+fEEmN6IdYPEyfdsdFx6ulL+EpJiQ5a0VcyjE+m+4bbtFn0+Kb6HOmHT6uPmEoolUHu61I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qlu4BSrt; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qlu4BSrt"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b97905516faso121723466b.1
        for <regressions@lists.linux.dev>; Sun, 15 Mar 2026 01:37:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773563873; cv=none;
        d=google.com; s=arc-20240605;
        b=UqHLX3/7aoVYahRhMk8VfKLipyXpD9G0WcE2Tan0PXwV+PqtR9Z3oMVbuJAXMLdjGw
         SjFM+bvJsESOEiUx9MLy9NBNizDsci28sdEO8NH7/w1jpyZ2uCQ3SvOP+7k+HJKMrs+q
         plfntlrahnvM5+2Nz/8oPt4ZG0F8iY3fARoREg0ZKY+WjMl8WSWvCJX6RwwhOgGpVtqM
         EulTmeEol00tx5UGX4BLCtf12fPYEnjdsmnH4NStDkZB0cw8/NRd974zyda/qN4G17K1
         bQZ60T7MZVvVcqWS8x+ip1repZA7HPSEYqRGV6bR2R0a5DGozsEBEc1Pz3s18F+pbV8j
         6AfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Shi9by71WCATsbE8XDzkJJHi90XwrNC3rti1RzxWIT4=;
        fh=7z/zjZIP+uJqCfOZ7i4Jyefoa5t+tMD9x1dqT5wMG+M=;
        b=gM+dy6RWgSNrAQeFjlCSUM2W/JgW6ty/wGum8/9ILXc0+VCQkTpma+JQIFCJXCSTaX
         mSoidKbd1hbxymQd3fHmhOopyPCEdvwTKIJYl3JhHSOaXmfH724vsKgxJ3NbObafDyNa
         QYNLp+oe+yM2mqk/Dfm7BL+8r3V7tv+grFXOCuBiq0Z/Gyrt1iZ/4wigMQWOeqvTDgxF
         UXco0xAVjtolK5y7B1Zcs84VfarVg2mUIcD+7kUXmy/DFoRuDGYyK67bcaD/iMJCyOVn
         kfpnHOcM9qrh/SPcSc46WBi2Ex7AHetfFbJEjOXs+UqkGLSs6rYR4Cz4F5koENyAyXur
         0rMg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773563873; x=1774168673; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Shi9by71WCATsbE8XDzkJJHi90XwrNC3rti1RzxWIT4=;
        b=Qlu4BSrtcjmBOs4N47PVuW+jbx4aCvHwgVI6zhREtQHOZeWUfwZMP6t8l7EcgzbC27
         mZ15pyCO9PZJHMK23qSkGrxuTnbF0JP4t5gfzjQPNAsPO12jBTha7YOIz31pRjUKZdDh
         X5X909Dx85CwhgkBdlmiS39bSxaMxhQoNu8LsjIAReGtIpL+KDNNnqdNJMkBJLDdjKoe
         ivRaCNlO0SUzhiVJFNcoXS2UDJFq6FNsbZ3jbO74FW/Y9r2so9lmVqzscWh86KbTBI/L
         Hr4McGaChBbCXeVrKPmxErT8BKaAsSire1bUa7ewSFX+lQNT36orme4SXwf4FPnJoD9d
         /SRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773563873; x=1774168673;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Shi9by71WCATsbE8XDzkJJHi90XwrNC3rti1RzxWIT4=;
        b=N+wtOmddMVP2UblPiT9gURZxrP+LChhTYh+0fu197nxGnMf6KOGkJpxcMyNE9QxRwE
         gEiYWQF5x5e3BlHwsEZSP+tEVKSMi7KHyhBB8EadoPFGjnrOkCjmxrVgti7Ldi+EYRzQ
         C+UhEdJAw+fE3o8ruPZHIeT5MdT9oB3yUAN9ihx28qAJ5bCZzFBNXmzSgVlMpAT2zFf5
         gqWSpLNCAuH6TM92fOwnOOrGr3W4mre9DYScD8baJowu/W2fqRFrU7QbCMC0B3P1V80P
         n97+DMfiRDgFcIEMEXEav4vMWv0JugXd1dTTE4rdmtfXy9p/Ka8JzislrYRgRRC+rQDC
         f8Zw==
X-Forwarded-Encrypted: i=1; AJvYcCXXtjTSnbOncu1oqHoXf5tnhtVCsNYUu9ILaJoMYrgwZa6WFZgL+v/fFo3bCxPtK8Juo0M2c1F0EAS/OA==@lists.linux.dev
X-Gm-Message-State: AOJu0YylIxfLVcPM+zkyYkOSQ7Dc86U1+OpitUTA9nvuZMysqXT+Y0GH
	L1UmuUdOwPEWxz72/eGQu5NEu+k3/Gm7IW3uRL/oOeoN8gGgJ6yMikomGVcWgVP/BLaoEuCJYku
	xcBZxulGCnsUtIF82ElXy9vd3I96lhTE=
X-Gm-Gg: ATEYQzxXx/xdVw7MuNsIr7xY5pK3kGjVzrMph/NCqAO41cTHjpF4EINwQiS+X+U23rM
	GQ92XMVDxmcn5rGncC15fOa9pfybDV/SKqE2CMaajVJDbuZkyChodrrspTsUoBnzeKRGFrdmRpd
	1U+PdFH3cIKuo6JgcgL7wtVbi2R0emF8uy1T7kR4NEhv3sIkQSmqYpz+rb9ZwjRUS/o6Rgo+5sT
	WUTV+NIotv8rYQb4JE0/He3UFERlYCS74w+Ju/IVaj02pAtopeBzKomjZpXqFkO6UPC9tGbcde2
	SOA889uFk3kQi1SdwECw9kB7X+h0Yaag3cJA3QxNNKQEZVrjbw==
X-Received: by 2002:a17:907:9346:b0:b93:cae3:5834 with SMTP id
 a640c23a62f3a-b97650b517cmr522066266b.13.1773563873213; Sun, 15 Mar 2026
 01:37:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <177349021750.3039212.10211295677877269201@eldamar.lan> <0f9572e731939f365f6708f58b258bee89d6245a.camel@kernel.org>
In-Reply-To: <0f9572e731939f365f6708f58b258bee89d6245a.camel@kernel.org>
From: =?UTF-8?Q?Aur=C3=A9lien_Couderc?= <aurelien.couderc2002@gmail.com>
Date: Sun, 15 Mar 2026 09:37:00 +0100
X-Gm-Features: AaiRm53lx2Rext5tx_9LFihL487zIPFQcKSK7OjjKbblhizl4WAa5Huhd5vIME0
Message-ID: <CA+1jF5p57oj4Jhkqy_MYqKpijmjSVU+1WeV+DH2waEszg5rwhQ@mail.gmail.com>
Subject: Re: [regression] Large rsize/wsize (1MB) causes EIO after
 2b092175f5e3 ("NFS: Fix inheritance of the block sizes when automounting")
To: linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, 1128834@bugs.debian.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 14, 2026 at 4:38=E2=80=AFPM Trond Myklebust <trondmy@kernel.org=
> wrote:
>
> Hi Salvatore,
>
> On Sat, 2026-03-14 at 13:23 +0100, Salvatore Bonaccorso wrote:
> > Control: forwarded -1
> > https://lore.kernel.org/regressions/177349021750.3039212.10211295677877=
269201@eldamar.lan
> > Control: tags -1 + upstream
> >
> > Hi Trond, hi Anna
> >
> > In Debian we got reports of a NFS client regression where large
> > rsize/wsize (1MB) causes EIO after the commit 2b092175f5e3 ("NFS: Fix
> > inheritance of the block sizes when automounting") and its backports
> > to the stable series. The report in full is at:
> > https://bugs.debian.org/1128834
> >
> > Maik reported:
> > > after upgrading from Linux 6.1.158 to 6.1.162, NFS client writes
> > > fail with input/output errors (EIO).
> > >
> > > Environment:
> > > - Debian Bookworm
> > > - Kernel: 6.1.0-43-amd64 (6.1.162-1)
> > > - NFSv4.2 (also reproducible with 4.1)
> > > - Default mount options include rsize=3D1048576,wsize=3D1048576
> > >
> > > Reproducer:
> > > dd if=3D/dev/zero of=3D~/testfile bs=3D1M count=3D500
> > > or
> > > dd if=3D/dev/zero of=3D~/testfile bs=3D4k count=3D100000
> > >
> > > On different computers and VMs!
> > >
> > >
> > > Result:
> > > dd: closing output file: Input/output error
> > >
> > > Workaround:
> > > Mount with:
> > > rsize=3D65536,wsize=3D65536
> > >
> > > With reduced I/O size, the issue disappears completely.
> > >
> > > Impact:
> > > - File writes fail (file >1M)
> > > - KDE Plasma crashes due to corrupted cache/config writes
> > >
> > > The issue does NOT occur on kernel 6.1.0-42 (6.1.158).
> >
> > I was not able to reproduce the problem, and it turned out that it
> > seems to be triggerable when on NFS server side a Dell EMC (Isilion)
> > system was used. So the issue was not really considered initially as
> > beeing "our" issue.
> >
> > Valentin SAMIR, a second user affected, did as well report the issue
> > to Dell, and Dell seems to point at a client issue instead. Valentin
> > writes:
> >
> > > We are facing the same issue. Dell seems to point to a client
> > > issue:
> > > The kernel treats the max size as the nfs payload max size whereas
> > > OneFs treat the max size as the overall compound packet max size
> > > (everything related to NFS in the call). Hence when OneFS receives
> > > a
> > > call with a payload of 1M, the overall NFS packet is slightly
> > > bigger
> > > and it returns an NFS4ERR_REQ_TOO_BIG.
> > >
> > > So the question is: should max req size/max resp size be treated as
> > > the
> > > nfs payload max size or the whole nfs packet max size?
> >
> > His reply in https://bugs.debian.org/1128834#55 contains a quote from
> > the response Valentin got from Dell, I'm full quoting it here for
> > easier followup in case needed:
> >
> > > I have been looking at the action plan output we captured.
> > > Specifically around when you first mounted and then repro'ed the
> > > error.
> > >
> > > Looking at the pcap we gathered, firstly, lets concentrate on the
> > > "create session" calls between Client / Node.
> > > Here we can these max sizes advertised - per screenshot.
> > >
> > >
> > > Frame 17: 306 bytes on wire (2448 bits), 306 bytes captured (2448
> > > bits)
> > > Ethernet II, Src: SuperMicroCo_1d:7d:b2 (ac:1f:6b:1d:7d:b2), Dst:
> > > MellanoxTech_bd:8c:7a (c4:70:bd:bd:8c:7a)
> > > Internet Protocol Version 4, Src: 172.22.1.132, Dst: 172.22.16.29
> > > Transmission Control Protocol, Src Port: 810, Dst Port: 2049, Seq:
> > > 613, Ack: 277, Len: 240
> > > Remote Procedure Call, Type:Call XID:0x945b7e1d
> > > Network File System, Ops(1): CREATE_SESSION
> > >     [Program Version: 4]
> > >     [V4 Procedure: COMPOUND (1)]
> > >     Tag: <EMPTY>
> > >     minorversion: 2
> > >     Operations (count: 1): CREATE_SESSION
> > >         Opcode: CREATE_SESSION (43)
> > >             clientid: 0x36adef626e919bf4
> > >             seqid: 0x00000001
> > >             csa_flags: 0x00000003, CREATE_SESSION4_FLAG_PERSIST,
> > > CREATE_SESSION4_FLAG_CONN_BACK_CHAN
> > >             csa_fore_chan_attrs
> > >                 hdr pad size: 0
> > >                 max req size: 1049620
> > >                 max resp size: 1049480
> > >                 max resp size cached: 7584
> > >                 max ops: 8
> > >                 max reqs: 64
> > >             csa_back_chan_attrs
> > >                 hdr pad size: 0
> > >                 max req size: 4096
> > >                 max resp size: 4096
> > >                 max resp size cached: 0
> > >                 max ops: 2
> > >                 max reqs: 16
> > >             cb_program: 0x40000000
> > >             flavor: 1
> > >             stamp: 2087796144
> > >             machine name: srv-transfert.ad.phedre.fr
> > >             uid: 0
> > >             gid: 0
> > >     [Main Opcode: CREATE_SESSION (43)]
> > >
> > >
> > > And the Node responds, as expected confirming the max size of
> > > 1048576.
> > >
> > >
> > > Frame 19: 194 bytes on wire (1552 bits), 194 bytes captured (1552
> > > bits)
> > > Ethernet II, Src: MellanoxTech_bd:8c:7a (c4:70:bd:bd:8c:7a), Dst:
> > > IETF-VRRP-VRID_3f (00:00:5e:00:01:3f)
> > > Internet Protocol Version 4, Src: 172.22.16.29, Dst: 172.22.1.132
> > > Transmission Control Protocol, Src Port: 2049, Dst Port: 810, Seq:
> > > 321, Ack: 853, Len: 128
> > > Remote Procedure Call, Type:Reply XID:0x945b7e1d
> > > Network File System, Ops(1): CREATE_SESSION
> > >     [Program Version: 4]
> > >     [V4 Procedure: COMPOUND (1)]
> > >     Status: NFS4_OK (0)
> > >     Tag: <EMPTY>
> > >     Operations (count: 1)
> > >         Opcode: CREATE_SESSION (43)
> > >             Status: NFS4_OK (0)
> > >             sessionid: f49b916e62efad36f200000006000000
> > >             seqid: 0x00000001
> > >             csr_flags: 0x00000002,
> > > CREATE_SESSION4_FLAG_CONN_BACK_CHAN
> > >             csr_fore_chan_attrs
> > >                 hdr pad size: 0
> > >                 max req size: 1048576
> > >                 max resp size: 1048576
> > >                 max resp size cached: 7584
> > >                 max ops: 8
> > >                 max reqs: 64
> > >             csr_back_chan_attrs
> > >                 hdr pad size: 0
> > >                 max req size: 4096
> > >                 max resp size: 4096
> > >                 max resp size cached: 0
> > >                 max ops: 2
> > >                 max reqs: 16
> > >     [Main Opcode: CREATE_SESSION (43)]
> > >
> > >
> > > Now if we look later on in the sequence when the Client sends the
> > > write request to the Node - we see in the frame, the max size is as
> > > expected 1048576
> > >
> > >
> > > Frame 747: 1998 bytes on wire (15984 bits), 1998 bytes captured
> > > (15984 bits)
> > > Ethernet II, Src: SuperMicroCo_1d:7d:b2 (ac:1f:6b:1d:7d:b2), Dst:
> > > MellanoxTech_bd:8c:7a (c4:70:bd:bd:8c:7a)
> > > Internet Protocol Version 4, Src: 172.22.1.132, Dst: 172.22.16.29
> > > Transmission Control Protocol, Src Port: 810, Dst Port: 2049, Seq:
> > > 1054149, Ack: 6009, Len: 1932
> > > [345 Reassembled TCP Segments (1048836 bytes): #84(1448),
> > > #85(5792),
> > > #87(5792), #89(1448), #90(1448), #92(4344), #94(4344), #96(2896),
> > > #98(1448), #99(2896), #101(4344), #103(4344), #105(1448),
> > > #106(1448),
> > > #108(2896), #110(1448), #111(2896)]
> > > Remote Procedure Call, Type:Call XID:0xb45b7e1d
> > > Network File System, Ops(4): SEQUENCE, PUTFH, WRITE, GETATTR
> > >     [Program Version: 4]
> > >     [V4 Procedure: COMPOUND (1)]
> > >     Tag: <EMPTY>
> > >     minorversion: 2
> > >     Operations (count: 4): SEQUENCE, PUTFH, WRITE, GETATTR
> > >         Opcode: SEQUENCE (53)
> > >         Opcode: PUTFH (22)
> > >         Opcode: WRITE (38)
> > >             StateID
> > >             offset: 0
> > >             stable: FILE_SYNC4 (2)
> > >             Write length: 1048576
> > >             Data: <DATA>
> > >         Opcode: GETATTR (9)
> > >     [Main Opcode: WRITE (38)]
> > >
> > >
> > > However we then see the Node reply a short time later with (as
> > > below)
> > > REQ_TOO_BIG - meaning the max size has been exceeded.
> > >
> > > Frame 749: 114 bytes on wire (912 bits), 114 bytes captured (912
> > > bits)
> > > Ethernet II, Src: MellanoxTech_bd:8c:7a (c4:70:bd:bd:8c:7a), Dst:
> > > IETF-VRRP-VRID_3f (00:00:5e:00:01:3f)
> > > Internet Protocol Version 4, Src: 172.22.16.29, Dst: 172.22.1.132
> > > Transmission Control Protocol, Src Port: 2049, Dst Port: 810, Seq:
> > > 6009, Ack: 1056081, Len: 48
> > > Remote Procedure Call, Type:Reply XID:0xb45b7e1d
> > > Network File System, Ops(1): SEQUENCE(NFS4ERR_REQ_TOO_BIG)
> > >     [Program Version: 4]
> > >     [V4 Procedure: COMPOUND (1)]
> > >     Status: NFS4ERR_REQ_TOO_BIG (10065)
> > >     Tag: <EMPTY>
> > >     Operations (count: 1)
> > >         Opcode: SEQUENCE (53)
> > >             Status: NFS4ERR_REQ_TOO_BIG (10065)
> > >     [Main Opcode: SEQUENCE (53)]
> > >
> > >
> > > Why is this?
> > >
> > > The reason for this seems to be related to the Client.
> > >
> > > From the Cluster side, the max rsize/wsize is the overall compound
> > > packet max size (everything related to NFS in the call)
> > >
> > > So for example with a compound call in nfsv4.2 - this might include
> > > the below type detail which does not exceed the overall size
> > > 1048576:
> > >
> > > [
> > > COMPOUND header
> > > SEQUENCE ....
> > > PUTFH ...
> > > WRITE header
> > > WRITE payload
> > > ]     (overall) < 1mb
> > >
> > >
> > > However the Client instead uses r/wsize from mount option, as a
> > > limit
> > > for the write payload.
> > >
> > > So with the same example
> > > COMPOUND header
> > > SEQUENCE ....
> > > PUTFH ...
> > > WRITE header
> > >
> > > [
> > > WRITE payload
> > > ]    (write) < 1mb
> > >
> > > But overall this ends up being 1mb + all the overhead of write
> > > header, compound header, putfh etc
> > > Puts it over the channel limit of  1048576 and hence the error
> > > returned.
> > >
> > > So it seems here the Client ignores that value and insists on the
> > > WRITE with a payload =3D=3D wszie; which in total with WRITE overhead
> > > and
> > > all other requests in COMPOUND (PUTFH, etc) exceeds maxrequestsize,
> > > which prompts NFS4ERR_REQ_TOO_BIG.
> > >
> > >
> > > And as you can see, once you reduce the size within the mount
> > > options
> > > on the Client side, it no longer exceeds its limits.
> > > Meaning you don't get the I/O error.
> >
> > So question, are we behaving here correctly or is it our Problem, or
> > is the
> > issue still considered on Dell's side?
> >
> > #regzbot introduced: 2b092175f5e301cdaa935093edfef2be9defb6df
> > #regzbot monitor: https://bugs.debian.org/1128834
> >
> > How to proceeed from here?
>
>
> The Linux NFS client uses the 'maxread' and 'maxwrite' attributes (see
> RFC8881 Sections 5.8.2.20. and 5.8.2.21.) to decide how big a payload
> to request/send to the server in a READ/WRITE COMPOUND.

So maxread and/or maxwrite MUST NOT be larger than the clients maximum RPC =
size?

>
> If Dell's implementation is returning a size of 1MB, then the Linux
> client will use that value. It won't cross check with the max request
> size, because it assumes that since both values derive from the server,
> there will be no conflict between them.

Maybe add an assert()-like warning to syslog if there is a mismatch?

Aur=C3=A9lien
--=20
Aur=C3=A9lien Couderc <aurelien.couderc2002@gmail.com>
Big Data/Data mining expert, chess enthusiast
