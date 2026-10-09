Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A514F55AD
	for <regressions@lists.linux.dev>; Fri,  9 Oct 2026 18:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569496; cv=pass; b=olsCIxkTqcxtQhLc00juYp5dyyuzk3d5yakzgrH40HFrjLuvamqiH9C97Ewf4LnZKOkZybGgBtyuX+BxK+FbhZIG5mrcZKpHISvyAeGDbkEKZjafDGatsMe3RShEIY2QBSiiGAfoUu9yvMbPGFtTLyR2qsTY26HBHFD+J8bPdCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569496; c=relaxed/simple;
	bh=WdgR+YdkAuXsXE819GZyZO+BI0w8tx59DEQncF9OA9k=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=U9BN3q/iFJFVY+HJrMrKPN9HO2ZU0PIUJ/0MRbNYgly5QCn/HHDR93BKXsSX6YiDscL8eAzMYLOhTvJa0RftPaLF2rG9uKX8BUGacmXLKmdbehS0LwcGHdcthIYisRv+gyOqPxTkYRBLCCMQzbC/xatLK6hwLatETzyX/amFYuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IF/+/0he; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IF/+/0he"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6aa97edc48cso4968283a12.3
        for <regressions@lists.linux.dev>; Fri, 09 Oct 2026 11:11:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791569494; cv=none;
        d=google.com; s=arc-20260327;
        b=Qpm4FwqwRVQc5RkHZyjb7TlJY/liiBxCi7hVM/pJBJ2iK/NDKXN9RhwMWbXBXkPkjZ
         cHTLjzWh3qiALlwrIQ9vVmTCupM/wBT1P85Trx+9e0JXfWJJzyWbuNCEOvAYZYPKg58M
         Zvq3VOVtxbVuKL4I3YxmDRdMPwyM6TWPPA9mqJ1awq+YOK92Jxb9ZE9yz/yLQQ15YYS2
         ZNJDZyKUsttcxyg3a+5lZlgA3xm1KlaVeagNygU7AhHFbyreQbf2d5nToXv2Ud6i3VYA
         HK0/pDLAqfI7W0HfkC1NjFi0ghvwVkTo9/zxDx8tKUqgZQSVtY0R8I9oIo3iCKFHjTwo
         c8Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=No4eTPnZ+UxSBkx9itGIleDNkZefe+ociK7F/sLwaY8=;
        fh=xkjGMtHiaXSTUoSjerTwY7LwkV7V+9m5Nb6Dxmlq7L8=;
        b=W1qjkPMkAf2mP3s3GPVHc/YyuYl84/TbrXxofoODP0v78lSH3J4nFBrv17kgiTGDL4
         cBR7guPNwsfT4jHkrCegYz+xgaXnuZGjdBcqD9dM1r1MAb4mCMUQKSu+C12bkFVYFJxJ
         XgpSaorczy/tXlCXhjN7KWtv62ClWp8lVp6mFsPdSe/teaOixpHrT4QqEkcfzLz3ATrb
         CATAsCE5eO86rnk7+02WHVp1Vbu9+VKydTdr35bsaQ0jwUeMm8xnYf9Tk29M1BFnMFoj
         PNMDmstNqTjRgHsuGlsgaZ1DrkCcHKub5y/7uOL9vMdCiLUwibpUcookKvctu7HzgWDH
         cN6w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791569494; x=1792174294; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=No4eTPnZ+UxSBkx9itGIleDNkZefe+ociK7F/sLwaY8=;
        b=IF/+/0he/1kP3qXRT2S/Fo5Vmhe9D0ThpRIeaGDHm45huh7epdkI1aySyqTx5ME60l
         uncP+Qrgpw0uJGJvTmHE72LH0SW8zu7+Iq3YCl5B/WjUP9VVUw39ol/GHQkZwVBY+3Bb
         KSKpETPE3o51fbs6sa62r/3RSjtuShccKdocdy6DKBpsFlm5nGoBDDUVTKYsl/7PSxTq
         vymkZJ0WDRvwQbhx167kdbers8fciSjVrZSJkBio+tLxTSVpBo890MBKtW/AW5fZOV05
         3qiYZ61L8rXdcucrmfCCuARP9pHjSk5RjDkZ86V/6ejc0PZOZoHH0vKdHiEJATUWbuMR
         zatg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791569494; x=1792174294;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=No4eTPnZ+UxSBkx9itGIleDNkZefe+ociK7F/sLwaY8=;
        b=mI9NuHm/IUWC3m4zcUODNhh4fv6J+ROk1yddUHf6glMifNae21mmCUvyRWQ7ZoIHge
         N1S8Q0LvwFWR7UyqXY06+sQBj+NVTCTdG/s4ivhIbNN24RBr5XFyhgCiaPzu/Na2kRRC
         CL9TQg5CVBnaTYPJIeERZdMSs+UAAWXyYFcUKiqZMU0Me0QelUa2BjUQiDnXYm3xH0jO
         ZHcZeW4Y8F6eQ/LcqP01vqW6Q9fFHZnMBn+9NrKAj70wMpCV2VE+OJwrMjdEdvvAaqpo
         wiD8JsqhXYQCfQ6ObE0HBh9wMwgXPooEWuci/3khUkESUZKO0dSQG9jxyw3VCLkvG7q2
         zFWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUz6URgoZuTPOFrD/7RGPPKET5yvdlfCbezQjUNcBcUfsL+BqezZh72/2K0+p16pyWh/tKNpEg6T0bRg==@lists.linux.dev
X-Gm-Message-State: AFq9FYK5Ec5E6s6bkTctdsjZ9sA+ZVk1r52HC0GN1CkOk29ZENEWCx00
	GrcpWQR4pyrYipGgMfGKk60ViEqvVKGtrZLkggFtzG03Jbyv1tfatrOYUqnZsPoZDzugTjP22kd
	bPCl7v51ME3gGeQHMDPJoi5opj6TfYMU=
X-Gm-Gg: AYBFou1mF55Ome7piwDbXFAnStHqiq3GWhTtSVPA90Wjz7ZE/s+UNWHTAG5t0e8Hg/Z
	s/zDAe/r5BAzNswe8hSOoF5oUTdswqCSMLcjjd0vf6Lwiv4hGh8o3x2lXhAcxzoeWWnL8lsaBB6
	+v5ZXCOm/F2TS95+wEAFR0KX0Q3qIQJng92ZMhcW9s8O99/ub9O3yhOBje37VAwneVUTBhtRmbA
	jIVsTVoI2RODNmBgl9vVNABrjq6P4f5W+vDERPNEDrCfM/mmzuwq2shpeH7FOxFKnbHOuJqmCXo
	+d7Rfn9eOVA31+lQj2pm1FQm+9ijNc4L3WE0EMKDGaihJ9PkVGFmAB7Uat/ZACrIzOJLWfCItuB
	x8G5MDbj4tjos3BUl9kvcDBrZWp27fq4SBjkFwdaw
X-Received: by 2002:a17:907:bb49:b0:c29:62d8:68af with SMTP id
 a640c23a62f3a-c31a9ffda78mr277596866b.47.1791569493771; Fri, 09 Oct 2026
 11:11:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?B?Um9nZXIgQWxhc8Og?= <vonbloom@gmail.com>
Date: Fri, 9 Oct 2026 20:11:22 +0200
X-Gm-Features: AclHuK_0U45sdGLsb4_JlQaS2HixZO7FmF0_k12UyuRozwqXHB_NNtmWhZpkzdQ
Message-ID: <CAELqY9==Ter2XQPRp=gjW5T75T+7kcZCXpn5roF2L6tY6mQNxw@mail.gmail.com>
Subject: [REGRESSION] btrfs: fs-verity "FILE CORRUPTED" on readahead of
 compressed extents since 7.2
To: linux-btrfs@vger.kernel.org
Cc: fsverity@lists.linux.dev, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

(Resent with a subject line: the first copy went out without one,
sorry for the noise.)

Since 7.2, reading an fs-verity file on btrfs mounted with
compress=zstd:1 logs "FILE CORRUPTED" for compressed extents read
through readahead, although every read succeeds:

  fs-verity (vda3, inode 58996): FILE CORRUPTED! pos=8912896,
  level=-1, want_hash=sha512:...

(one line in dmesg, wrapped here). The positions are mostly multiples
of 128 KiB. read() returns no error and the data is correct: the
synchronous re-read passes verification. We hit it with composefs
(bootc) objects on the root filesystem of a laptop, and reproduced it
on a second machine and in a VM.

Reproducer (root, any btrfs mounted with compress=zstd:1):

  cd /mnt/btrfs-zstd
  find /usr/lib -maxdepth 1 -name '*.so*' -size +500k -print0 |
    xargs -0 cat | head -c 60M > f
  sync
  fsverity enable --hash-alg=sha512 f
  echo 3 > /proc/sys/vm/drop_caches
  cat f > /dev/null
  dmesg | grep -c 'FILE CORRUPTED'     # 10 here

Same data with chattr +m before writing (uncompressed): no messages.
Reading with POSIX_FADV_RANDOM: no messages.

Tested on Arch Linux's kernels (no out-of-tree patches) in a KVM
guest, virtio disk:

- bad: 7.2.2-arch1, 7.2.7-arch1, 7.2.9-arch1
- good: 7.1.11-arch1, 7.0.14-arch1, 6.18.55-lts

Also on bare metal (two NVMe laptops, Intel and AMD) with
7.2.9-cachyos. A similar symptom in 6.16.8 was fixed by "btrfs: fix
incorrect readahead expansion length" (Oct 2025).

#regzbot introduced: v7.1..v7.2.2

I can test patches.

Roger
