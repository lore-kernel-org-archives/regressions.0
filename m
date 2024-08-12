Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE6A180032
	for <regressions@lists.linux.dev>; Mon, 12 Aug 2024 15:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723476122; cv=none; b=Ac6ygsBrhtTIXi/gdVmjDnXmE3dL4eEMR9aDy8TB7+kUD34o47WAo2akhPCfawJ4bWAMU+mHlQQP01oauQx7IeIBzVzlFMjuEZJ8hdhu/ketjCWOcjq1EGxynNoTo55c6VVWps1M9Crew6j8cCNodS7QRISgg5ET4ddCe0WQrTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723476122; c=relaxed/simple;
	bh=lSsAnkXf5jPBhzbxD9KtBubzyOKnZjU+B5FDzBMSFHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=hwwgpgrwrZjBqx1vrZumlu5AeG1A90wGTU7oXfZ+3tZmzwZCkhBqjk5tGrgHjPQQNXLfXjxAowBakEZobY1nYmUjNB/7Vl2gWAWzRgeP4o1G94545RLN5o6bSqNGxbpO9B5N31mHTSVSCCSDe6qjQ12g9np6g+pgvvDbYiOcoOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5NqDPOu; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5NqDPOu"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e0bf9b821e8so4352367276.3
        for <regressions@lists.linux.dev>; Mon, 12 Aug 2024 08:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723476120; x=1724080920; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ue1sHXfyUCE7PmBtVmSVDAbi9+yYyzirjA/qmg0B6WU=;
        b=i5NqDPOuaKAGs3FKL0q2Cq2nrS9tqJ32G1BFkFvJcIaKeQtgaJRM16sE2q7cgqDIEk
         56ZzaGNLTMpkLtLHV5FyEfSjUC+XQLCLaKHntzqrojA8LclDgjsdglDWcGeRog5crlZE
         9DLqy73w++HxjotDXZg2jr0NLvsoZ0ZUGs7Cz6usDHEqtkGLwx4Z3w5GWVaeV2KSxeLR
         m/34993nM4QEAiMC4J7RZANMWqYz3hJnUtz55jJJyVW0HbP3HroywdKUQM/mDpccjDUV
         b24zTC6FL1otddeuC9AVwcyqm0fGu0XFYU7gExXOhajTZpiD2QxpotxdtOfzRjTdApnw
         u64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723476120; x=1724080920;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ue1sHXfyUCE7PmBtVmSVDAbi9+yYyzirjA/qmg0B6WU=;
        b=Vyhk/H2t0D02XJr9GYQGZ8Zk/IJcAemDVGffdGrKxYcMnQ64MAzIDTrUPZU+/3jAXi
         juqQ2b/WPIc5ArnxCObAvCt9XApBMJyc2jtf6opDeCD+WYQkkUzyuRtb0dvAHkkUh/lS
         DVIjXSIsj1GnlT0sX8aU+2VHN7jOU5cYiBnC6H3/G1ThIJxdwcBCpfaDGq3LrEq9qv9c
         ES8uPlxRKgFKQVoDoWdvk8dSxrdwiQkZd2jrV1+3/2wq/CIHyfKZDN9pAEMHumbJ4OKT
         ekQqtWfhnJG6NDmZOScioYAXpoSvK0ET9YoDXYdKf+oYUJxizCj0kKmeZMDsrw8eTh0s
         2iOw==
X-Gm-Message-State: AOJu0YxV5nkpQMaKc62KALZRMIWrIfGM9hAx+YDV3QPBgASIaJ8/fRmC
	HeY+oMW9CB9uLKZ+sMynWSoI1mX8zXqvjOEj/I24O6ZRobsKPXrQ3iWEAUQHL64dfqf9y7UtxEd
	ZPCI2mzukIixu43MSIsacclJUvfnDT+AK
X-Google-Smtp-Source: AGHT+IGMCaMR1agMARb8QcxjE2ZP6TRfCodl9pIrqV7g9fkN/x7z6r/yHJEa937nGta6f7iJwZgYyjfefWhyeOFpw3k=
X-Received: by 2002:a05:6902:e8e:b0:e0b:b83e:7c59 with SMTP id
 3f1490d57ef6-e113d2bc30emr780245276.53.1723476119998; Mon, 12 Aug 2024
 08:21:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Zrog4DYXrirhJE7P@debian.local>
In-Reply-To: <Zrog4DYXrirhJE7P@debian.local>
From: Chris Bainbridge <chris.bainbridge@gmail.com>
Date: Mon, 12 Aug 2024 16:21:49 +0100
Message-ID: <CAP-bSRbx2yWxErkiSf_Ux3Lnm0RGNvZQbpSvrqCcCtb_-aUoVA@mail.gmail.com>
Subject: Fwd: [REGRESSION] critical target error, bisected
To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

---------- Forwarded message ---------
From: Chris Bainbridge <chris.bainbridge@gmail.com>
Date: Mon, 12 Aug 2024 at 15:49
Subject: [REGRESSION] critical target error, bisected
To: <fengli@smartx.com>, <hch@lst.de>, <martin.petersen@oracle.com>
Cc: <axboe@kernel.dk>, <linux-scsi@vger.kernel.org>,
<linux-kernel@vger.kernel.org>


Hello,

Machine is HP Aero 13 laptop. The following error appears in 6.11-rc3
when booted from USB drive:

[  195.647081] sd 0:0:0:0: [sda] tag#0 FAILED Result: hostbyte=DID_OK
driverbyte=DRIVER_OK cmd_age=0s
[  195.647093] sd 0:0:0:0: [sda] tag#0 Sense Key : Illegal Request [current]
[  195.647096] sd 0:0:0:0: [sda] tag#0 Add. Sense: Invalid command
operation code
[  195.647099] sd 0:0:0:0: [sda] tag#0 CDB: Write same(16) 93 08 00 00
00 00 04 dd 42 f8 00 00 2d 48 00 00
[  195.647101] critical target error, dev sda, sector 81609464 op
0x3:(DISCARD) flags 0x800 phys_seg 1 prio class 0

This error appears on two different laptops with different USB drives.


Bisect result:

f874d7210d882cb1c58a8e3da66f61cdc63cd4b4 is the first bad commit
commit f874d7210d882cb1c58a8e3da66f61cdc63cd4b4
Author: Li Feng <fengli@smartx.com>
Date:   Thu Jul 18 16:07:22 2024 +0800

    scsi: sd: Keep the discard mode stable

    There is a scenario where a large number of discard commands are issued
    when the iscsi initiator connects to the target and then performs a session
    rescan operation. There is a time window, most of the commands are in UNMAP
    mode, and some discard commands become WRITE SAME with UNMAP.

    The discard mode has been negotiated during the SCSI probe. If the mode is
    temporarily changed from UNMAP to WRITE SAME with UNMAP, an I/O ERROR may
    occur because the target may not implement WRITE SAME with UNMAP. Keep the
    discard mode stable to fix this issue.

    Signed-off-by: Li Feng <fengli@smartx.com>
    Link: https://lore.kernel.org/r/20240718080751.313102-2-fengli@smartx.com
    Reviewed-by: Christoph Hellwig <hch@lst.de>
    Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
    Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>

 drivers/scsi/sd.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

#regzbot introduced: f874d7210d882cb1c58a8e3da66f61cdc63cd4b4
