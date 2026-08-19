Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D45C40DFB6
	for <regressions@lists.linux.dev>; Wed, 19 Aug 2026 09:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787130127; cv=pass; b=jHDFrSTRFhoZxXeVB/C6EXr7TlDupPbXcPwl9gWFVR++hTDVnBm0yK55wE/CIrF6odpBog0Bmm90PRfgKoYyCbAHxrW0uFMElAphxnvUoqQJ3GIZSA2bIN9QDIK9Iz7miB2KucYpRfVNqFamM1/LadLOPyjyZZNS0h/Fe8DNuSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787130127; c=relaxed/simple;
	bh=D0GwEBPZwDSpF3t7PXggJDLj9yEZl1vW2yUqVJoxFWo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=K4npsKWu6jIS1rsO5snAoveQLK8v0TcaRfPxyTxOgKeNt0eB1WrUMeLz1tfU1mYVWEqEl8DXeuXPxxeW27BTTazFWfQh4P9QVRUUAq33VOif9Bu7smWJDqHhMlhUIByqhfGJk3JykdS1t3SszESuyLBxW1b4NWIPmYFLhixSAh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SN1feYDi; arc=pass smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SN1feYDi"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-9061a795d76so10003676d6.3
        for <regressions@lists.linux.dev>; Wed, 19 Aug 2026 02:02:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787130121; cv=none;
        d=google.com; s=arc-20260327;
        b=hEMEZMW2tF1QkP3NTHwh0EmrJnJl/Bbr/Z8tB9+c5pg6TAdtI+Fjn5MB1A7CuIElmt
         /R6CzqYLZwFcCGLMgfnRdVa5KZxU7aRUOOclQH17AaK9+b5M0gdRKJaAvfmvvMEUCtNE
         jFKrV/yf/uPHGU3esrROOWLXfNhBuYhdu6eG7agp2Zwk/v6g3uat+VlCKkLLC7S7cvOI
         CK/inZab0D9iTl/74osz1lB41sQnquEn/vaXboTdSFtJ254cqQnuqyzX/c6Z3cVLtrR5
         XV22ayTEH557m6IWR+61/cxH7tngJNb2sjAQuMuGcVXAP8e3EX0qEFx6wIaSeBFh8lmM
         L5xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=lh94NleeH3lqZAsalMlCWnYENzl0FPI/Q7IkjuuaW10=;
        fh=PqXzY4AEV/8pDpCEasnLRZrTomzIWKzhqxfPhHjYtwI=;
        b=mN2nok7eBDXd0MR1+m+l2mNhB1KwBmj2yQV721j+Qngl+jlMXuObMYLFSKf+yrIoM7
         UcDwxKls88pXFZmJ0xbmqFHwHNrvAYOBJxkxEd3T+HSQPANMZeGCiw3gq+h4EbJ0XiOR
         eQYO4DzmsL1kypV0tG04iqor+Jv/owjVOZs084nsTaqL+8fovSs65tcKA6eo12ImWt8I
         vFPlMVFjRLQE4aHjR8fqZEAcOmlDUbZHNtCI6nJ5xe7SHthLIqoprH6dXeISSrj28VtO
         k556Vh3l1ykLgHe7+cYvZEbCldVUuk08uKzLXgFraNQ2p9SH0HnCdwd0Ko8C8cigg5XO
         4yqg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787130121; x=1787734921; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lh94NleeH3lqZAsalMlCWnYENzl0FPI/Q7IkjuuaW10=;
        b=SN1feYDiUFMX2tB/ncnC8S+WBsBLYj1D+u69PwHjXQmezn1Tc60TXo7gLKiYO3hbWK
         PFs6LAaJcScjUenlUL9VcfhLML+piJ+lRSTkYNenLjAYYRbJHf/K7kWngPTPsHUfHFxa
         GAJd+f5bsR4/YfpFVLSGX1U5Qrl7w8Qim/5Jm1ZlP3MIRURktlAqVUXiBdi2w1EEGwXj
         s8XpvaNTBCv0juEwY8+k/YTTVf5jQwr70gprNW2xXLWMg0feZ7i1ZZwNpmBopn6H+lQs
         OnSoe7jMrxda2CWQJlfRX4e1yiFLJujRqpKuSrX8NSKZb01P5JzDtPDBQTH6kuBgyXfl
         LiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787130121; x=1787734921;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lh94NleeH3lqZAsalMlCWnYENzl0FPI/Q7IkjuuaW10=;
        b=cUBIgL48Gtf/SO7rZfVuHGCzIrd3Fbjrqds6+u9UlVfQgdIKwjSNw+7DxvAALhmF+Y
         lJKtey9bTAt3bB4T/73ppljE7tEVmtNRJk+xeHOOECFP1SFUj0yJEEQZFFOLuowPZLIn
         cHlP5UH50U9LGCojU1B7CGEowv+ijWgUCxyoB1+iqWI6//an9enPsEqR51UjRiwZ5Rls
         Edu7sxg1rYD2anibYCkNtFQb/QstqYDpwLIoghbxeV9iyEIln0EkRbbN2Vi+s0Q9F0rt
         aGOb+uUEyiZ7zuRj+Ww7d5J4uursDbOg1encps+wVdf+Gp/di6fRsO/WX/zZsU94AP64
         V/HQ==
X-Forwarded-Encrypted: i=1; AHgh+RronlO+4F19GQYNUEhDo4kwf1Q0fmsGNbVRWdUAnZwRScq6xdg2i+ZgdYeNinU6YzIcJ8kWPfH6guWehA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMCDoAfOJyjShIh1KAZmQDhXCbjmf/7tbCLa8B7PiV+2Vy1pAL
	ahYwqZfoJjkf/LLdORL0SAkoZ26L7UpVej6WZPWuVgorgvmPrU45Ggi+kPmbE5BXEw0rmJWgQF3
	ctdmCjRFNKx1xLtCxj/XKeEGc03CKr5Y=
X-Gm-Gg: AR+sD13HL3kM3nB06zo+1exk0kiJqHQ9ILYVEBVp/yN8RuUjv3pm/AF6Cy+AnWJEcAS
	gdDDLKwLsZvzaBkZpPxqHVjrZTPZDioEQauq7W+Stnex2dAdM2qA3dTr30V/261srtGPxb7thW/
	wCcimhDm0FMlBx003ZzYNERIl3xkN9UiPVrwrl/jz2pKe6y7iN6HXpe9ewaGmcdpAmrEbHaidsj
	Gbo/K9MUATDMZrZkGDxwDqsOxwVz9IaCsQKVe90CZBhSAJm23W/vymXzDTBJ9nl2EmvD16iWp44
	hbTi2MUPjPTI3dHGGa/5Z2E5sRp1pQQB6solSK057fYma22z5SlUABsti/+f749zIMAhIt83UVU
	GRQ==
X-Received: by 2002:a05:6214:29c8:b0:8f6:8d46:5f47 with SMTP id
 6a1803df08f44-90c5e94b0bamr26750206d6.5.1787130121135; Wed, 19 Aug 2026
 02:02:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Mihail Leoca <mycroftmih@gmail.com>
Date: Wed, 19 Aug 2026 12:01:49 +0300
X-Gm-Features: AcwNN1UZEt3ggu3Yr8zbH8iDaQVSJ6zFJMtNLV1WT8KYPzFredJLl_Hiy6zE3-I
Message-ID: <CAN4jxfXBFy9YQARm8O5SgKEg4ME1=jXShZ-AQ5MXXscQqDtzWw@mail.gmail.com>
Subject: [BUG] smb: client: data loss - writeback subrequest is dropped, not
 retried, when the AEAD allocation fails
To: linux-cifs@vger.kernel.org
Cc: sfrench@samba.org, smfrench@gmail.com, pc@manguebit.org, 
	ronniesahlberg@gmail.com, sprasad@microsoft.com, tom@talpey.com, 
	bharathsm@microsoft.com, dhowells@redhat.com, ematsumiya@suse.de, 
	netfs@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

A large buffered write to an encrypted SMB3 mount can lose data. Every
write() returns success but one or more wsize-sized ranges never reach
the server. ENOMEM is reported once by whichever of fsync() or close()
comes first. On the server a lost range inside the file reads back as
zeroes; a lost range at the end leaves the file short.

We noticed the corruption in June, after upgrading from 6.1 to 6.12.53.
Everything measured below is from a reproducer.


The bug
=======

1. Every encrypted write makes one contiguous allocation for the crypto
   request, in smb2_aead_req_alloc() (fs/smb/client/smb2ops.c):

p = kzalloc(len, GFP_NOFS);
if (!p)
return ERR_PTR(-ENOMEM);

   At wsize=4 MiB with 4 KiB pages num_sgs is 1027. The scatterlist
   array dominates len, so the request is order-4.

2. On failure -ENOMEM reaches smb2_async_writev()
   (fs/smb/client/smb2pdu.c).

3. -ENOMEM is not classified as retryable. On 7.x smb2_async_writev()
   sets NETFS_SREQ_NEED_RETRY only for is_replayable_error()
   (fs/smb/client/cifsglob.h), which is -EAGAIN and -ECONNABORTED. On
   6.12.y netfs makes the same test in
   netfs_write_subrequest_terminated() and retries only -EAGAIN.

4. fs/netfs/write_collect.c marks the subrequest NETFS_SREQ_FAILED,
   records the error on the mapping and does not resend the range.


Affected
========

Reproduced on kernel version:
- v6.12.53
- v7.1.5
- mainline bd5f485f3f02

It needs:
- 4 KiB pages
- an encrypted mount
- buffered I/O (cache=strict or cache=loose)
- and the default wsize=4 MiB.

The classification is old and has never covered -ENOMEM. What changed is
how reachable the allocation failure is:

- before v6.3 kmalloc(len, GFP_ATOMIC) no fallback
- v6.3 onward kvzalloc() vmalloc fallback
- 998a67b95468 kzalloc(len, GFP_NOFS) no fallback

998a67b95468 ("smb: client: fix crypto buffers in non-linear memory")
shipped in 6.6.112+, 6.12.53+, 6.17.3+ and 6.18+. These stable upgrades
took the fallback away:
- 6.6.111  -> 6.6.112
- 6.12.52  -> 6.12.53


Reproducer
==========

1) Samba share on /srv/share, exported with

smb encrypt = required
smb2 max write = 4194304
strict allocate = yes

   mounted on /mnt/cifs with

-o vers=3.1.1,seal,cache=strict,wsize=4194304

2) The writer, cc -O2 -o writer writer.c:

#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

int main(void)
{
static unsigned char buf[1 << 20];
size_t n = 0, total = 192u << 20;
ssize_t rc;
int fd, r;

memset(buf, 0xa5, sizeof buf);
fd = open("/mnt/cifs/data.bin",
 O_WRONLY | O_CREAT | O_TRUNC, 0600);
if (fd < 0) {
perror("open");
return 1;
}
while (n < total) {
rc = write(fd, buf, sizeof buf);
if (rc <= 0) {
printf("write=%zd errno=%d\n", rc, errno);
break;
}
n += (size_t)rc;
}
printf("wrote=%zu\n", n);
r = fsync(fd);
printf("fsync=%d errno=%d\n", r, r ? errno : 0);
r = close(fd);
printf("close=%d errno=%d\n", r, r ? errno : 0);
return 0;
}

3) Inject during the write:

F=/sys/kernel/debug/fail_page_alloc
echo 4  > $F/min-order
echo N  > $F/ignore-gfp-wait
echo -1 > $F/times
trap 'echo 0 > $F/probability' EXIT INT TERM
echo 50 > $F/probability
./writer
echo 0  > $F/probability

4) Check the file on the server, not through the mount, which still
   serves the original pages from cache. The file is 0xa5, so every
   zero byte is lost data:

cd /srv/share
ls -l data.bin # short if the tail was dropped
tr -dc '\0' <data.bin | wc -c # bytes lost as zeroes
od -A d -t x1 data.bin | grep -B1 '00 00 00 00'


Result
======

Three runs on mainline bd5f485f3f02. Every write() returned success
and fsync() returned -1 ENOMEM:

run 1 full length 80 MiB lost 20 chunks
run 2 8 MiB short 92 MiB lost 23 chunks
run 3 full length 96 MiB lost 24 chunks

Every zero run starts and ends on a wsize boundary and the chunk count
matches the injected failures in crypt_message exactly. Raising min-order
to 5 misses this allocation entirely: 206 injections land in
netfs_alloc_folioq_buffer instead and nothing is lost.

Dropping the fsync() from the writer moves the ENOMEM to close(). v7.1.5
behaved the same, losing 104, 88 and 92 MiB.

The error is reported but the data is already gone. With the stream
failed netfs_collect_write_results() advances collected_to over the
untransferred range and ends the folios without redirtying them;
fs/netfs/write_collect.c has no redirty call at all. An application that
checks every return code still cannot rewrite the lost range. On the
issue side the same -ENOMEM is treated as transient and redirtied
(fs/netfs/write_issue.c).

I would expect a transient -ENOMEM to be retried rather than treated as a
permanent failure of the range, or failing that for folios not to be
cleaned when nothing was transferred.

Happy to test patches or add trace detail.

Thanks,
Mihail Leoca
