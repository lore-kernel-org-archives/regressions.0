Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792555154;
	b=DAFdZCjgvhHv7OS8FAIZN/I85We1ZLC83Hzcno5OPK74rkLSmbED/YpwF5pqFCIpf4lZ
	 ioM029I6Y7GCW25h6zldSlOvo6w1Pis/dlsM1bvBBNzzuIsXfbH+uM4A/1XbPKr5hvtDP
	 nLAjOwXnjSKSgBbvKWZSWKbiUL/mFTf/xYKb1Y5sjbg3rIShgtlipvvbBYeVXxCbNS7rQ
	 boXcECBGa4QUsaYWRInIFYl2AH5D/6UCGSs4D81AVwWb4DFGylzlyk8Vi245wvNvCm6IW
	 LmB3d/J0eCo91g5tIK+4tMsXBeHsmeQaZ7eJxKjDVavyf00/XCi+8YUaqgqLKKpIUDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792555154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=U1MaDPDXvzPPQF4dM+6FB8MNB/4IovlAaD9qvvih+2w=;
	b=FHfNHuGWmBtkkMPoVtrJpA7xGRcAzBSRmom1kEmPOUbGAnxu0FDOLwGZX+1Kqb2rDv9k
	 x2B40PycqpJQZZIgKZJ9pN2rh/K0GMxYbxfCfCteEy3KnRPLxrLCiQpBcNPqZ8rszabbL
	 HQSKDf3cZKB8f4UpyIhBZpNlsdCBtBg/k4C1U8olup8fludhAeUc6g3chIpitS4ee/2a7
	 3XykE9dLn+loaflnR0vGm5GpFbz8kHtxotBQ+lbP9o0tO6HB8q4iKjkLq8nb6sdRN/DLp
	 b3xLblEmEpPZZkV5tuolkWOCDozMvcAXwu4f8D5B2L32N+c50LUfzMsCogPrYCPuvCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=NHkd800I;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDD7606A319
	for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 03:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DDD7606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=NHkd800I
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3282db206d3so638236eec.0
        for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 20:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1792555152; x=1793159952; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U1MaDPDXvzPPQF4dM+6FB8MNB/4IovlAaD9qvvih+2w=;
        b=NHkd800IGlfdVOJwXORtZx0DzDNlu2KCZWSauAYCEixbt/vfzKBV/2ATugCEzw2dAE
         /ycYwXv0aTbQPM0SjyiB+tPCwC44g8X9ndNdg0ITfCHD/ux40eGPBZV3M/VqDxYswfkK
         ImHT+isuJngO9uVXsbXqYBi0E5NmNdpbkY3rq3SGC3j6F4sxFIbbEDU4P8YzFYdZ5cce
         GZXYXonWq3xBAhwY8Fgz1t88fir6wmXFr6vys2eGHhDX0ZXUeViKuX47UBjfwgvHRICZ
         ZyGQBhO20/xa6eFt1Ax8iYqZb7HNi//RFlOqRgFpCRPkXalUuX4IcPNP1ql+mEX1CIdQ
         4ECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792555152; x=1793159952;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U1MaDPDXvzPPQF4dM+6FB8MNB/4IovlAaD9qvvih+2w=;
        b=Vr1M8ZG2OFwioq7fFbfyFCawMMAXq9/2pobc66pANvCbB9PNQDBPSRItT6ftxhXm3V
         TCKjBT/kUXAW3DVr5TnD94wnihzLpFjOUV8NensKc5gm1a20W4hlvQy5Bc0yIrjVtbm5
         CFipOeW31fR4vyN9njJxyYHH/MpEEUVT7TPN0ijftn4ZJjoFOy9wiEk+0KC1duY0QHBy
         ZpWfOkzyQW24GckIvyVJOI7R/Arf9moevdhgMEsGazFCuDXfcY3iLWcUtEvw0dSs8luz
         dQqL/sJyW+6H5Ueup9J68j8NJDxsA2yG6ewcsKU0EungQrT/JDgQWqCWcM/b1/8NKiR/
         lQhQ==
X-Gm-Message-State: AFq9FYJ0tNAbf0I01zYi1mNBsXqepaL7P6p5MOQDISpYpEsbw2SfLto9
	u8p70heKNS9oqQfraJOz2gHD9paw+VPwsEGEKacwhsYVFlBSXRNGiYbxVJrusSlNRfQ=
X-Gm-Gg: AYBFou240ue7bwaefLsVFfNOvW8dqry2Ho7yooOEljwG2DvOgyESsZWV4WY+jToV8gU
	Dv/qWF/O+IcZit8XpUzQ3fNRlNiOj8/YHwIA4h9Cg+ETD7W3l1iV5kT0yHGjaE850Liws+yjVWp
	9bYd5OvEDDybTY/PpzDPuYJTcXL9BN5aN0cOpQAGrt3q/FD6QGhH/O7sfdabIiSQjV/Wo29FNsj
	08KOk2amg5XyOlEHDd7X1C4ihcoDd0Fzcu0WZ3y0hDiLUC7eOsn1Hi2UpVYFN9MG07SdronXwn1
	OPFmZvfiPm4Y3HmuP8rtrCNBRFgrk16SI0SrFQPQY8TNwhBMoo031Ay62jWaF6A6g2aCdjd1FDr
	y4Dg0SFy6/9zV5F/OIx4ela//GH3LMqNzrXDRo0Bp5kkc11nj5RBlLuzCDTujOHGqZhFM+U4TGr
	v8/KSJ+JiudDCF8hB1uhrDo7BE7eb+ANpOd4LwQnppxhf7CLCRSMyN+qKF2INp/n+EdR2RIjQz/
	FQz9ecW7iW5Uerpi52+aibJLAwZkeCd2xwqAG8/KXEEPqZ2
X-Received: by 2002:a05:7301:18a1:b0:359:9302:a526 with SMTP id 5a478bee46e88-3674c93ba42mr1505259eec.7.1792555152395;
        Tue, 20 Oct 2026 20:59:12 -0700 (PDT)
Received: from 6e52bff8000c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e153519sm3254296eec.3.2026.10.20.20.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 20:59:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?q?=5BREGRESSION=5D_mainline/master=3A_=28build=29initialization_of_?=
 =?utf-8?q?=E2=80=98int_=28*=29=28const_struct_mnt=5Fidmap_*=2C_struct_dentr?=
 =?utf-8?q?y_=2E=2E=2E?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 21 Oct 2026 03:59:11 -0000
Message-ID: <179255514786.226988.5626082709051138535@kernelci.org>

New build issue found on mainline/master:

---
initialization of ‘int (*)(const struct mnt_idmap *, struct dentry *, struct file_kattr *)’ from incompatible pointer type ‘int (*)(struct mnt_idmap *, struct dentry *, struct file_kattr *)’ [-Wincompatible-pointer-types] in fs/smb/client/cifsfs.o (fs/smb/client/cifsfs.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
/tmp/kci/linux/fs/smb/client/cifsfs.c:1258:25: error: initialization of ‘int (*)(const struct mnt_idmap *, struct dentry *, struct file_kattr *)’ from incompatible pointer type ‘int (*)(struct mnt_idmap *, struct dentry *, struct file_kattr *)’ [-Wincompatible-pointer-types]
 1258 |         .fileattr_set = cifs_fileattr_set,
      |                         ^~~~~~~~~~~~~~~~~
/tmp/kci/linux/fs/smb/client/cifsfs.c:1258:25: note: (near initialization for ‘cifs_dir_inode_ops.fileattr_set’)
/tmp/kci/linux/fs/smb/client/cifsfs.c:1270:25: error: initialization of ‘int (*)(const struct mnt_idmap *, struct dentry *, struct file_kattr *)’ from incompatible pointer type ‘int (*)(struct mnt_idmap *, struct dentry *, struct file_kattr *)’ [-Wincompatible-pointer-types]
 1270 |         .fileattr_set = cifs_fileattr_set,
      |                         ^~~~~~~~~~~~~~~~~
/tmp/kci/linux/fs/smb/client/cifsfs.c:1270:25: note: (near initialization for ‘cifs_file_inode_ops.fileattr_set’)

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/179255514786.226988.5626082709051138535@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:bea99bd4f9c1ef9d77f64d627f7cbe405240049f
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  744e5400b36f84b4816e3ff8531ec2dff52b474c

# Builds where the incident occurred:

## defconfig on (loongarch):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6ad82d1455fda50760548308

## defconfig on (s390):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6ad82d3455fda5076054848c

## ppc64le_defconfig on (powerpc):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6ad82d2255fda507605483c6

#regzbot introduced: 9e73b189c88fcba63af4775d637d395de0af4fdb..744e5400b36f84b4816e3ff8531ec2dff52b474c
#regzbot link: https://d.kernelci.org/i/maestro:bea99bd4f9c1ef9d77f64d627f7cbe405240049f

#kernelci issue maestro:bea99bd4f9c1ef9d77f64d627f7cbe405240049f

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
