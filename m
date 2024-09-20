Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17864181B82
	for <regressions@lists.linux.dev>; Fri, 20 Sep 2024 20:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726862892; cv=none; b=u2h/2p04jfLxcmmKXtFoSt5wmq/aYrJUtBzi8jgDe+gkjxgwHePQBp8TiBm878bn6OjyyVaYZJiKjcTQ1vuXV2DT8umypm1gfeWfH+ggTl+VMXnm50mgH0j0Q1E3/BHSxlMR50gHHk8Beo8HS3wIwncQZUbka/X0pblzI5gDeT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726862892; c=relaxed/simple;
	bh=FyCY36yI5w0lTSq34HxZmH4EPDjzQfp2huhYuiHkwRA=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=lClN/U9l9fMJbdRg8xZ9TXe/OplwTHYtNaNlkaTbJMTkGa0KQUIkksT/dcGVI1ClEv+rq2fncQHXd93cnd1bWV81UBh//UrzNnXbYksMSZn7Hg0oVpSG4Mq+LBOfhDQSlcWtDS+oODv3ShyutXOZmBo9IBfdrS4PJtirzP/DlOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ca47Jvik; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ca47Jvik"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-718816be6cbso1923455b3a.1
        for <regressions@lists.linux.dev>; Fri, 20 Sep 2024 13:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726862890; x=1727467690; darn=lists.linux.dev;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jqXxksIhdYu3U6EyI/SaQCdXTyiEORhvEkCurrA15Ic=;
        b=Ca47JvikV8rxNwAXEnFNR1IXj/eRQw6AWumTum8FtZ+Diq/7v/y9kHfa4JzT8OtLzA
         Jne8IJYGGceb0UGNJj9hTmk4woNxlhsn1lRL6Gs0QcW9kWjo3UUCsN3fis3dHKd51VYq
         n5x8c6Fgc8quzglpaT7olui40gSR7L5BdxBLCMpAfDUrfR0sn7A+HTQPghNmmx57oT/x
         DDhnD94mcimwGAC0TLBxJJOgr4qY/eyIc13aggtpCtlBe/KcCvVVyx0D1heetkR8cIJu
         RVec6NVUfoG4xQc1C3LpJXCzYRkZ+HjTtemJGFHSZl2JNoDmMKiQO/uBWA3LcpySy6xt
         EyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726862890; x=1727467690;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqXxksIhdYu3U6EyI/SaQCdXTyiEORhvEkCurrA15Ic=;
        b=qOWHZKvbFebQVGuUldz1tET+9YUlskysx1Cv/1NArc4kD5kQaXEPIK4eOxtQPHViuU
         Ul6CgQTKIMm7jKgJRsLCADMvO9CsaFSXANttb8u044FIiyakmERwPyazgQFrtY1x/BVI
         og6KwwVy1GRvSaIyCJCD8GO0cx7iqlSbb7EX4dWfGAo+sfHLbIqS6MXPqtInk2UPm9xn
         +Gstgc2mXJKyxFmyTvQZ0H1kjYlFKbaVxTaxfUSr7ErjyZAePuY5j9M+TbU57fTrxJFs
         OdFbdJuxqrkciqO9cDeKUQeDEhQ/Pb+NUYqiEvImhwTljDH2gwsFQFSKJ+iB9+hJiYHn
         mLoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNqVJcBvzJUGydzZFhe2+V1mwwGk/WCCSQzcprhmtXKevpQvAptZ5ZSdOHsQMhEm4s+tQYTYIx7sJjiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxLUtGiauT/H3II58P9oUcZqlwcJV6SF+OM+kZIh1e++DKXObYY
	RztiR4J0YPLruFkCjtqd7HIt8Zc5/0bSsKYxPxJKX7HSHn4lgeAl
X-Google-Smtp-Source: AGHT+IFnZTuVUXfi09IMvJbRV9nzRJbWPXCtMyEyTm2x1nnbKFEaAJF7P+WRaiwkpd1Vvtm+qwMHRA==
X-Received: by 2002:a05:6a20:b68a:b0:1d0:2533:1a42 with SMTP id adf61e73a8af0-1d30a8ecf33mr4553539637.9.1726862890221;
        Fri, 20 Sep 2024 13:08:10 -0700 (PDT)
Received: from smtpclient.apple ([2601:645:c600:8760:2cea:7b3a:57f3:3330])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db4998ff14sm11207518a12.66.2024.09.20.13.08.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Sep 2024 13:08:09 -0700 (PDT)
From: James Young <pronoiac@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: [REGRESSION] Corruption on cifs / smb write on ARM, kernels 6.3-6.9
Message-Id: <DFC1DAC5-5C6C-4DC2-807A-DAF12E4B7882@gmail.com>
Date: Fri, 20 Sep 2024 13:07:58 -0700
Cc: stable@vger.kernel.org,
 regressions@lists.linux.dev,
 linux-cifs@vger.kernel.org,
 David Howells <dhowells@redhat.com>,
 linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>
To: pronoiac+kernel@gmail.com
X-Mailer: Apple Mail (2.3776.700.51)

I was benchmarking some compressors, piping to and from a network share =
on a NAS, and some consistently wrote corrupted data.


First, apologies in advance:
* if I'm not in the right place. I tried to follow the directions from =
the Regressions guide - =
https://www.kernel.org/doc/html/latest/admin-guide/reporting-regressions.h=
tml
* I know there's a ton of context I don't know
* I=E2=80=99m trying a different mail app, because the first one looked =
concussed with plain text. This might be worse.


The detailed description:
I was benchmarking some compressors on Debian on a Raspberry Pi, piping =
to and from a network share on a NAS, and found that some consistently =
had issues writing to my NAS. Specifically:
* lzop
* pigz - parallel gzip
* pbzip2 - parallel bzip2

This is dependent on kernel version. I've done a survey, below.

While I tripped over the issue on a Debian port (Debian 12, bookworm, =
kernel v6.6), I compiled my own vanilla / mainline kernels for testing =
and reporting this.


Even more details:
The Pi and the Synology NAS are directly connected by Gigabit Ethernet. =
Both sides are using self-assigned IP addresses. I'll note that at boot, =
getting the Pi to see the NAS requires some nudging of avahi-autoipd; =
while I think it's stable before testing, I'm not positive, and =
reconnection issues might be in play.

The files in question are tars of sparse file systems, about 270 gig, =
compressing down to 10-30 gig.

Compression seems to work, without complaint; decompression crashes the =
process, usually within the first gig of the compressed file. The output =
of the stream doesn't match what ends up written to disk.

Trying decompression during compression gets further along than it does =
after compression finishes; this might point toward something with =
writes and caches.

A previous attempt involved rpi-update, which:
* good: let me install kernels without building myself
* bad: updated the bootloader and firmware, to bleeding edge, with =
possible regressions; it definitely muddied the results of my tests
I started over with a fresh install, and no results involving rpi-update =
are included in this email.


A survey of major branches:
* 5.15.167, LTS - good
* 6.1.109, LTS - good
* 6.2.16 - good
* 6.3.13 - bad
* 6.4.16 - bad
* 6.5.13 - bad
* 6.6.50, LTS - bad
* 6.7.12 - bad
* 6.8.12 - bad
* 6.9.12 - bad
* 6.10.9 - good
* 6.11.0 - good

I tried, but couldn't fully build 4.19.322 or 6.0.19, due to issues with =
modules.


Important commits:
It looked like both the breakage and the fix came in during rc1 =
releases.

Breakage, v6.3-rc1:
I manually bisected commits in fs/smb* and fs/cifs.

3d78fe73fa12 cifs: Build the RDMA SGE list directly from an iterator
> lzop and pigz worked. last working. test in progress: pbzip2

607aea3cc2a8 cifs: Remove unused code
> lzop didn't work. first broken


Fix, v6.10-rc1:
I manually bisected commits in fs/smb.

69c3c023af25 cifs: Implement netfslib hooks
> lzop didn't work. last broken one

3ee1a1fc3981 cifs: Cut over to using netfslib
> lzop, pigz, pbzip2, all worked. first fixed one


To test / reproduce:
It looks like this, on a mounted network share, with extra pv for =
progress meters:

cat 1tb-rust-ext4.img.tar.gz | \
  gzip -d | \
  lzop -1 > \
  1tb-rust-ext4.img.tar.lzop
  # wait 40 minutes

cat 1tb-rust-ext4.img.tar.lzop | \
  lzop -d | \
  sha1sum
  # either it works, and shows the right checksum
  # or it crashes early, due to a corrupt file, and shows an incorrect =
checksum

As I re-read this, I realize it might look like the compressor behaves =
differently. I added a "tee $output | sha1sum; sha1sum $output" and ran =
it on a broken version. The checksums from the pipe and for the file on =
disk are different.


Assorted info:
This is a Raspberry Pi 4, with 4 GiB RAM, running Debian 12, bookworm, =
or a port.

mount.cifs version: 7.0

# cat /proc/sys/kernel/tainted
1024

# cat /proc/version
Linux version 6.2.0-3d78fe73f-v8-pronoiac+ (pronoiac@bisect) (gcc =
(Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #21 =
SMP PREEMPT Thu Sep 19 16:51:22 PDT 2024


DebugData:=20
/proc/fs/cifs/DebugData
Display Internal CIFS Data Structures for Debugging
---------------------------------------------------
CIFS Version 2.41
Features: =
DFS,FSCACHE,STATS2,DEBUG,ALLOW_INSECURE_LEGACY,CIFS_POSIX,UPCALL(SPNEGO),X=
ATTR,ACL
CIFSMaxBufSize: 16384
Active VFS Requests: 1

Servers:
1) ConnectionId: 0x1 Hostname: drums.local
Number of credits: 8062 Dialect 0x300
TCP status: 1 Instance: 1
Local Users To Server: 1 SecMode: 0x1 Req On Wire: 2
In Send: 1 In MaxReq Wait: 0

        Sessions:
        1) Address: 169.254.132.219 Uses: 1 Capability: 0x300047        =
Session Status: 1
        Security type: RawNTLMSSP  SessionId: 0x4969841e
        User: 1000 Cred User: 0

        Shares:
        0) IPC: \\drums.local\IPC$ Mounts: 1 DevInfo: 0x0 Attributes: =
0x0
        PathComponentMax: 0 Status: 1 type: 0 Serial Number: 0x0
        Share Capabilities: None        Share Flags: 0x0
        tid: 0xeb093f0b Maximal Access: 0x1f00a9

        1) \\drums.local\billions Mounts: 1 DevInfo: 0x20 Attributes: =
0x5007f
        PathComponentMax: 255 Status: 1 type: DISK Serial Number: =
0x735a9af5
        Share Capabilities: None Aligned, Partition Aligned,    Share =
Flags: 0x0
        tid: 0x5e6832e6 Optimal sector size: 0x200      Maximal Access: =
0x1f01ff


        MIDs:
        State: 2 com: 9 pid: 3117 cbdata: 00000000e003293e mid 962892

        State: 2 com: 9 pid: 3117 cbdata: 000000002610602a mid 962956

--



Let me know how I can help.
The process of iterating can take hours, and it's not automated, so my =
resources are limited.

#regzbot introduced: 607aea3cc2a8
#regzbot fix: 3ee1a1fc3981

-James

