Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD0819D8AC
	for <regressions@lists.linux.dev>; Sat, 14 Mar 2026 12:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773490988; cv=none; b=hRxqv7gvUHMvvrRVn9NdpsTmNiqkF5nJ3iWY9D3y5nlmBUlsjDf/SMRIU6xIxOUvzL/z0juEDxWrp6e8/9f8XRfdD9Dve+l75IKcDw5nrYy/b0i1KH5G8w5lmyJBeTIWyK4aS5+IbnGhkrRH4jjubZpMVL4d3rFsT8cVmnjxbaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773490988; c=relaxed/simple;
	bh=buPks5PBxGSwGL8vkwFfugwS6GFMYIcHl01QQPzIf6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UTiE7c6nhOXiKzzFCtzN2Ma66OhHawzm6Ir0KBDmWcw1aaaGApZ1hSNIGqRkFny1Pj4JmCyWBctR6O8mMHZ0fR4YXdWJ/5r7vUtG79WbtYM3CgzTdMzg69yUQ/wPAzMKdOaigPsqjtQlcwzbczeylfPf2c0x5wrfZICbx33+p1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TE/3koUl; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TE/3koUl"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-485409ab264so21365125e9.1
        for <regressions@lists.linux.dev>; Sat, 14 Mar 2026 05:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773490984; x=1774095784; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=AJjipUbO1IhGzwZcApN0bsywZyvfnfUBT0/hLHzwY3c=;
        b=TE/3koUlInT3OU4azYKKCGwnrwUgN341AkbZLaRYKDHZmJZqJIBpwdcD2P9qQIgohl
         +6ahhNePQHTfwRC0SrPy9cVxQduxKwkAzroRu2/2grAvGwQwqX5uq32mMbbRb9ljB3E7
         IS/6W+eaVaMgrTvQ5WBMgLX5HTkyzoFT/gx0z4uccEm7akmkjP7alGnpUkbB1/yCZDLr
         Cy247SM2NxUdde9QnVPFviHVnZ8aZDS63I1JH/+BEC6qT8FO8Qkkcah107ymF+mVMsuq
         yAZxSsEvWofCCX9wJKON+/TZA8rXjH7h5/SS0aQpdZOiUEbtVv0i9rGtKwK8G1GCIoVO
         eqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773490984; x=1774095784;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJjipUbO1IhGzwZcApN0bsywZyvfnfUBT0/hLHzwY3c=;
        b=q/lkwo+GFJd2SCsarkoRJdFPmkSLKL6ZRKeUf92/jkrzuMcACaVL6YGT2stIjGuufi
         XzS6SIogCVxJqr7Yx7nRa6f2XwLZCLk2O3nSFPiVAJOy1AgGhgm9fADa+gMr3swY5jyi
         D7rLh7caDMS1C/M8ie3qBFoUvvX4lRmEG7AYw3n84hCNzP01Oqzzu4FCTUVCoTlZgilx
         /wT9Lj+fXwt+co0sgzqO1FLUbzj9upJ2n1a/dGX+ueu+DpoilRxPTeX9ZRnXqOJ1Kqh+
         Im5/QqSSbpvhLA0/5VoLv3QSRWgYyes8Xkhsbm6lxzTWyLMIqHfBQxePrxohv/b0jBqr
         TXmQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8Q+2/QdD/s4zoQLM2U6Y8bAbm5rZZww8Y9ES3j1GhS3WjPpq7rzEWc8jfjGmFvPGX2Tk+gAwPDEpXSg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1eEb4GPUHiGXZLKMMowXs3hmbKUKv3RUjcGkYDN2qOBSXStJp
	GIas5nt655aJ7OYKwYYKOKn8KKtd+DE/0rT3PpH6xEjmLRwBAm/vTeXJ
X-Gm-Gg: ATEYQzxI7BEjQ3xzhE3DMAtygswmvWoDz1nbr2w0CvPFGeV+cZO3SjzA8JgsRFZw1+g
	nKpIfIjrHU7FdWDZOk1QPU3o+mf1gOOzOmL1jRC8ZZFOMPzHLoPZVcNhnVQNgnbuXDMqjZR7sFF
	jtVrGZaqQNccroWaA9WmkYpJQcb8eW3LRWCbcyH/ZPJ9p3v/RJMyN1hlHUs4u+NvL57RH39BFgN
	fSgRvLdTcMIN7h8ETosc0wbtZpuwO1nx9nBuIlv59vE4NMuT/gQelCkwUOBGivNpalS4uVz9kQ+
	f3iFT4r+qXhYjRVIcU6NNC6a6G0tnazASmHPavg8CqgO2l/CJo+17xSYcl7LMcssB30fnfJpYpF
	6jD+u1g3xeygirA2WaYbEriequSYnAQ60y5YvjeDdKcxWS3IpC2ZmRRALVl6PXSmsRE+7EvRZVl
	H7GIJgNHriwOcNZjJZIz32EEX2bUh8UGjZmOhT1qVCCvpcLruFqt0hbQVZcY4=
X-Received: by 2002:a05:600c:8488:b0:485:3b4a:f707 with SMTP id 5b1f17b1804b1-48555b2c89fmr99738645e9.10.1773490984178;
        Sat, 14 Mar 2026 05:23:04 -0700 (PDT)
Received: from eldamar.lan (c-82-192-247-196.customer.ggaweb.ch. [82.192.247.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e912fsm734044495e9.2.2026.03.14.05.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 05:23:03 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 77473BE2EE7; Sat, 14 Mar 2026 13:23:02 +0100 (CET)
Date: Sat, 14 Mar 2026 13:23:02 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Trond Myklebust <trond.myklebust@hammerspace.com>,
	Maik Nergert <maik.nergert@uni-hamburg.de>,
	Valentin SAMIR <valentin.samir@magellium.fr>,
	Anna Schumaker <anna@kernel.org>
Cc: linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev, 1128834@bugs.debian.org
Subject: [regression] Large rsize/wsize (1MB) causes EIO after 2b092175f5e3
 ("NFS: Fix inheritance of the block sizes when automounting")
Message-ID: <177349021750.3039212.10211295677877269201@eldamar.lan>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Control: forwarded -1 https://lore.kernel.org/regressions/177349021750.3039212.10211295677877269201@eldamar.lan
Control: tags -1 + upstream

Hi Trond, hi Anna

In Debian we got reports of a NFS client regression where large
rsize/wsize (1MB) causes EIO after the commit 2b092175f5e3 ("NFS: Fix
inheritance of the block sizes when automounting") and its backports
to the stable series. The report in full is at:
https://bugs.debian.org/1128834

Maik reported:
> after upgrading from Linux 6.1.158 to 6.1.162, NFS client writes fail with input/output errors (EIO).
> 
> Environment:
> - Debian Bookworm
> - Kernel: 6.1.0-43-amd64 (6.1.162-1)
> - NFSv4.2 (also reproducible with 4.1)
> - Default mount options include rsize=1048576,wsize=1048576
> 
> Reproducer:
> dd if=/dev/zero of=~/testfile bs=1M count=500
> or
> dd if=/dev/zero of=~/testfile bs=4k count=100000
> 
> On different computers and VMs!
> 
> 
> Result:
> dd: closing output file: Input/output error
> 
> Workaround:
> Mount with:
> rsize=65536,wsize=65536
> 
> With reduced I/O size, the issue disappears completely.
> 
> Impact:
> - File writes fail (file >1M)
> - KDE Plasma crashes due to corrupted cache/config writes
> 
> The issue does NOT occur on kernel 6.1.0-42 (6.1.158).

I was not able to reproduce the problem, and it turned out that it
seems to be triggerable when on NFS server side a Dell EMC (Isilion)
system was used. So the issue was not really considered initially as
beeing "our" issue.

Valentin SAMIR, a second user affected, did as well report the issue
to Dell, and Dell seems to point at a client issue instead. Valentin
writes:

> We are facing the same issue. Dell seems to point to a client issue:
> The kernel treats the max size as the nfs payload max size whereas
> OneFs treat the max size as the overall compound packet max size
> (everything related to NFS in the call). Hence when OneFS receives a
> call with a payload of 1M, the overall NFS packet is slightly bigger
> and it returns an NFS4ERR_REQ_TOO_BIG.
> 
> So the question is: should max req size/max resp size be treated as the
> nfs payload max size or the whole nfs packet max size?

His reply in https://bugs.debian.org/1128834#55 contains a quote from
the response Valentin got from Dell, I'm full quoting it here for
easier followup in case needed:

> I have been looking at the action plan output we captured.
> Specifically around when you first mounted and then repro'ed the
> error.
>
> Looking at the pcap we gathered, firstly, lets concentrate on the
> "create session" calls between Client / Node.
> Here we can these max sizes advertised - per screenshot.
>
>
> Frame 17: 306 bytes on wire (2448 bits), 306 bytes captured (2448
> bits)
> Ethernet II, Src: SuperMicroCo_1d:7d:b2 (ac:1f:6b:1d:7d:b2), Dst:
> MellanoxTech_bd:8c:7a (c4:70:bd:bd:8c:7a)
> Internet Protocol Version 4, Src: 172.22.1.132, Dst: 172.22.16.29
> Transmission Control Protocol, Src Port: 810, Dst Port: 2049, Seq:
> 613, Ack: 277, Len: 240
> Remote Procedure Call, Type:Call XID:0x945b7e1d
> Network File System, Ops(1): CREATE_SESSION
>     [Program Version: 4]
>     [V4 Procedure: COMPOUND (1)]
>     Tag: <EMPTY>
>     minorversion: 2
>     Operations (count: 1): CREATE_SESSION
>         Opcode: CREATE_SESSION (43)
>             clientid: 0x36adef626e919bf4
>             seqid: 0x00000001
>             csa_flags: 0x00000003, CREATE_SESSION4_FLAG_PERSIST,
> CREATE_SESSION4_FLAG_CONN_BACK_CHAN
>             csa_fore_chan_attrs
>                 hdr pad size: 0
>                 max req size: 1049620
>                 max resp size: 1049480
>                 max resp size cached: 7584
>                 max ops: 8
>                 max reqs: 64
>             csa_back_chan_attrs
>                 hdr pad size: 0
>                 max req size: 4096
>                 max resp size: 4096
>                 max resp size cached: 0
>                 max ops: 2
>                 max reqs: 16
>             cb_program: 0x40000000
>             flavor: 1
>             stamp: 2087796144
>             machine name: srv-transfert.ad.phedre.fr
>             uid: 0
>             gid: 0
>     [Main Opcode: CREATE_SESSION (43)]
>
>
> And the Node responds, as expected confirming the max size of
> 1048576.
>
>
> Frame 19: 194 bytes on wire (1552 bits), 194 bytes captured (1552
> bits)
> Ethernet II, Src: MellanoxTech_bd:8c:7a (c4:70:bd:bd:8c:7a), Dst:
> IETF-VRRP-VRID_3f (00:00:5e:00:01:3f)
> Internet Protocol Version 4, Src: 172.22.16.29, Dst: 172.22.1.132
> Transmission Control Protocol, Src Port: 2049, Dst Port: 810, Seq:
> 321, Ack: 853, Len: 128
> Remote Procedure Call, Type:Reply XID:0x945b7e1d
> Network File System, Ops(1): CREATE_SESSION
>     [Program Version: 4]
>     [V4 Procedure: COMPOUND (1)]
>     Status: NFS4_OK (0)
>     Tag: <EMPTY>
>     Operations (count: 1)
>         Opcode: CREATE_SESSION (43)
>             Status: NFS4_OK (0)
>             sessionid: f49b916e62efad36f200000006000000
>             seqid: 0x00000001
>             csr_flags: 0x00000002,
> CREATE_SESSION4_FLAG_CONN_BACK_CHAN
>             csr_fore_chan_attrs
>                 hdr pad size: 0
>                 max req size: 1048576
>                 max resp size: 1048576
>                 max resp size cached: 7584
>                 max ops: 8
>                 max reqs: 64
>             csr_back_chan_attrs
>                 hdr pad size: 0
>                 max req size: 4096
>                 max resp size: 4096
>                 max resp size cached: 0
>                 max ops: 2
>                 max reqs: 16
>     [Main Opcode: CREATE_SESSION (43)]
>
>
> Now if we look later on in the sequence when the Client sends the
> write request to the Node - we see in the frame, the max size is as
> expected 1048576
>
>
> Frame 747: 1998 bytes on wire (15984 bits), 1998 bytes captured
> (15984 bits)
> Ethernet II, Src: SuperMicroCo_1d:7d:b2 (ac:1f:6b:1d:7d:b2), Dst:
> MellanoxTech_bd:8c:7a (c4:70:bd:bd:8c:7a)
> Internet Protocol Version 4, Src: 172.22.1.132, Dst: 172.22.16.29
> Transmission Control Protocol, Src Port: 810, Dst Port: 2049, Seq:
> 1054149, Ack: 6009, Len: 1932
> [345 Reassembled TCP Segments (1048836 bytes): #84(1448), #85(5792),
> #87(5792), #89(1448), #90(1448), #92(4344), #94(4344), #96(2896),
> #98(1448), #99(2896), #101(4344), #103(4344), #105(1448), #106(1448),
> #108(2896), #110(1448), #111(2896)]
> Remote Procedure Call, Type:Call XID:0xb45b7e1d
> Network File System, Ops(4): SEQUENCE, PUTFH, WRITE, GETATTR
>     [Program Version: 4]
>     [V4 Procedure: COMPOUND (1)]
>     Tag: <EMPTY>
>     minorversion: 2
>     Operations (count: 4): SEQUENCE, PUTFH, WRITE, GETATTR
>         Opcode: SEQUENCE (53)
>         Opcode: PUTFH (22)
>         Opcode: WRITE (38)
>             StateID
>             offset: 0
>             stable: FILE_SYNC4 (2)
>             Write length: 1048576
>             Data: <DATA>
>         Opcode: GETATTR (9)
>     [Main Opcode: WRITE (38)]
>
>
> However we then see the Node reply a short time later with (as below)
> REQ_TOO_BIG - meaning the max size has been exceeded.
>
> Frame 749: 114 bytes on wire (912 bits), 114 bytes captured (912
> bits)
> Ethernet II, Src: MellanoxTech_bd:8c:7a (c4:70:bd:bd:8c:7a), Dst:
> IETF-VRRP-VRID_3f (00:00:5e:00:01:3f)
> Internet Protocol Version 4, Src: 172.22.16.29, Dst: 172.22.1.132
> Transmission Control Protocol, Src Port: 2049, Dst Port: 810, Seq:
> 6009, Ack: 1056081, Len: 48
> Remote Procedure Call, Type:Reply XID:0xb45b7e1d
> Network File System, Ops(1): SEQUENCE(NFS4ERR_REQ_TOO_BIG)
>     [Program Version: 4]
>     [V4 Procedure: COMPOUND (1)]
>     Status: NFS4ERR_REQ_TOO_BIG (10065)
>     Tag: <EMPTY>
>     Operations (count: 1)
>         Opcode: SEQUENCE (53)
>             Status: NFS4ERR_REQ_TOO_BIG (10065)
>     [Main Opcode: SEQUENCE (53)]
>
>
> Why is this?
>
> The reason for this seems to be related to the Client.
>
> From the Cluster side, the max rsize/wsize is the overall compound
> packet max size (everything related to NFS in the call)
>
> So for example with a compound call in nfsv4.2 - this might include
> the below type detail which does not exceed the overall size 1048576:
>
> [
> COMPOUND header
> SEQUENCE ....
> PUTFH ...
> WRITE header
> WRITE payload
> ]     (overall) < 1mb
>
>
> However the Client instead uses r/wsize from mount option, as a limit
> for the write payload.
>
> So with the same example
> COMPOUND header
> SEQUENCE ....
> PUTFH ...
> WRITE header
>
> [
> WRITE payload
> ]    (write) < 1mb
>
> But overall this ends up being 1mb + all the overhead of write
> header, compound header, putfh etc
> Puts it over the channel limit of  1048576 and hence the error
> returned.
>
> So it seems here the Client ignores that value and insists on the
> WRITE with a payload == wszie; which in total with WRITE overhead and
> all other requests in COMPOUND (PUTFH, etc) exceeds maxrequestsize,
> which prompts NFS4ERR_REQ_TOO_BIG.
>
>
> And as you can see, once you reduce the size within the mount options
> on the Client side, it no longer exceeds its limits.
> Meaning you don't get the I/O error.

So question, are we behaving here correctly or is it our Problem, or is the
issue still considered on Dell's side?

#regzbot introduced: 2b092175f5e301cdaa935093edfef2be9defb6df
#regzbot monitor: https://bugs.debian.org/1128834 

How to proceeed from here?

Regards,
Salvatore
