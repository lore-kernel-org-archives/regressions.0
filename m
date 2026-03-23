Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F69381B17
	for <regressions@lists.linux.dev>; Mon, 23 Mar 2026 22:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774303432; cv=pass; b=HTV9/RiknPnBqj2E6vTz6ZV87VIArrkC1ty+q0KzgyL3YA3fC/vRjgT8axjPrcz3X7BVzuLLktJRYtQcNrG1Ryk1i3YjaFnSofVkgvHqCEN0LUKiEa4n/b4j10JoaUn5sRZXfqP447dU6QLpqGPRUXfLdKCKb4gohj/6H0ozQP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774303432; c=relaxed/simple;
	bh=isQFDI7d05AvIlrp9iqnyQriaU043z6DYylvG6vWhF4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZNWG4LeUSHtTwfG2RUyKhGJTz7+j7WRKwC+VasAL4jMkran5fNfsLFm6HG6f/Mv4JC0F+dtdW9VWGyucX/o3DHOAyZlS8XTy0fT9zIR3R5Mjs9lDuS4P7HPddi6cjlkfpNCBCd8WRzXaY2EwiEwuoB2OKQWIFP3qtTzX1pY2pAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ngrV3WAE; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ngrV3WAE"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-509069a7a7fso200921cf.0
        for <regressions@lists.linux.dev>; Mon, 23 Mar 2026 15:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774303430; cv=none;
        d=google.com; s=arc-20240605;
        b=aVvyTSiJrJSs8cfRAtOHhPSQa647ReVuF89RCEUF+fi4FWn5RNFM99bCJZ8VSZM4p+
         yGGa6vCxzhUm7dTYv3vxE+surDcO5Rdt8C8SKSTjijFshielAhuLT2bB8Gemn+O6EsHL
         fzvnzmpw84yofkCD2CUjMyg3MzN/PFwQbMHN8xc7jq3Oa7KYIzLD/2eWMtaEeJV4IO35
         bhyhAjrHHPsNPd5cNqWNppBgO6vqGrHWg9RRRfSvIk3fYDdyY5jq4DOAMfKORiSWtQQk
         tHhQSgl5cDeU0Q/1x8U0dVoDRsVW3GRXPtN1esPLKEJWzUrzvTrVnaRUyeFzY14j47ZV
         pjzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=o1eGtSxZYUuz2uzB/0xmbY0GGzJTsHFF98WP24mcOxI=;
        fh=PXFb/jkcvxt4/QYWYP48kfAugRal4NH6wqCiuXehSFs=;
        b=Nryt+Pi2xnRrmIsD+4oIC/oK3V3Vk4vE6+ev4v8W8PDG8xTisoWJWta+bcaX8ezBbm
         f8uVbtKm7QsTSCRhyxaL1rSH6PBpLzeFYndN+Tw5C5lcfvH0ai1b3H4H20usYlIzi8Oe
         dA4G5phzOUPDDab9PmxPU3fI3ZIZp7Ytd+b/nkJFnYY+FkZRh2i2g0yKAGxE8+l+Sj7w
         D3fnITOUWzPsusbIcgZREAaJmrE+tLuxp/a8A5o7wQ2uBoS6Kupw5CI89vzlBrTmyVX8
         OZs+Urlr3Hf/hxkeMtEemdeJe5y1XkqxNteeVmkj/1dUDHVfBrJr8teRi1f2PBCa1cry
         uAuQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774303430; x=1774908230; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o1eGtSxZYUuz2uzB/0xmbY0GGzJTsHFF98WP24mcOxI=;
        b=ngrV3WAE1qSy9B/oij/CngWACoDWvw5P9ExQONag5THSFslkyTdWDN5qBioz/0J5ug
         iJOm6tu/JxhFiy56X+auco23bDQYAQ2cUV2ccX1hE12Ck4Q7BF0lRZ6uDKvHPoH3Lx21
         uFpFYTvsYUtatNBMI+O3vsyj8HF+DD1CyccHAYsHzrEnxpDIQDKHxwdzQ8ukb8uiP0kD
         7GQnueL+TPaZzcxu7fk1AwUUfy+hx86xW7N062Nz6a2MNO+8JiEondLjgmEPt0ljOwi6
         xgWuyKE+BKtScbKMfitpEMbBEgYjbZR07lPm4Myiuge/QASBxl1mdTprCcafMKdUwmky
         oJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774303430; x=1774908230;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o1eGtSxZYUuz2uzB/0xmbY0GGzJTsHFF98WP24mcOxI=;
        b=CfZO/kumTWZiuEHrmQbBgTsoKEs+MsrOihSKq6h2m2WfueBYRrCf+RAzMYtnzWFEp7
         /8GNlM5DIEbFZe9/L6D0zTLCb5qzNgYQEk38qgmufnIy1ddf3BuR2iVV2N7kONJjlZbR
         ztF2tLl49Q0ZGu23W5kr+TWdcBPVzidPmgQwq7CAh+RI21T1sUV0nrvjDlhJ5tLvmXD4
         XmgxgwuBG5hYXKPvhBm0ojKYuqD0XN64VpwFaSJLwez0izj4KxO0VSRcGLXg/gT0yo6J
         oFOGZ3+3TK7Btnh58nXbmWz/wVjjdlfxqB6DvQoo0KiMNRh0XcUHsqzkmon4UQt1Hxa2
         T8ng==
X-Forwarded-Encrypted: i=1; AJvYcCXtxsFwby7NNuM7YrHr96jvYJyzsTqSF4bYPm7rpHWVwKMeuFVb4gLJUj2s5ODHouED+hrXLXhUvX4moA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6IcED5UUTOHbdkQE2JdV2h/yRW5I5PAz7YLg3SYw3omMJ1X59
	8uv3rcBI/04Am4cc7jBBT7uu/zZ/e2f9IwhrZBcCv6I6FbNhRkq8I4GMUn9EUIih09kfDeUmUWH
	4AJA+XiebwNktR8aQflTU8uYeFkj1x2qwz2rYcyaX
X-Gm-Gg: ATEYQzyizvC4iaj/4xjFrSgh6Dmu1QI5kqpn8SRxbK+3GoxWR67KK1aCofnTlpZZrWF
	O4hCCbASqioO+7EPumWBZg0zE/L4gsxqBPo1wCHzCrynXmyyQHdklImCu3XqDJySDYQeE97uoSn
	HbNmkpex6+JF/gp97c0FyLyq4aeCF5w8LzdBHYkJlaTk6DaNGnmVNe0mpCTrRB12KlYsDrMdrGM
	qw53ZXGb+uOFz4XJn8Hq57HvCMRWn9DAo/RpX0DS39KQP3VgXn/US5iEMPsViW6EAqC62R5Ouy2
	9Ftsxd4eRiduMS62r/YL14LxmsgcxHQhuvs=
X-Received: by 2002:a05:622a:9009:b0:506:1f23:e22c with SMTP id
 d75a77b69052e-50b6fb9bd95mr4925811cf.6.1774303429792; Mon, 23 Mar 2026
 15:03:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Chenglong Tang <chenglongtang@google.com>
Date: Mon, 23 Mar 2026 15:03:39 -0700
X-Gm-Features: AQROBzCJ71kjMcg47Y9l0d3oTHYV_D4QnyFW5DxoPbe2RkRTxMNDx_bzID4OPcQ
Message-ID: <CAOdxtTadAFH01Vui1FvWfcmQ8jH1O45owTzUcpYbNvBxnLeM7Q@mail.gmail.com>
Subject: [REGRESSION] fs/overlayfs/ext4: Severe jbd2 lock contention and
 journal starvation on concurrent copy-up (v6.6 -> v6.12)
To: linux-unionfs@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Cc: jack@suse.com, Jan Kara <jack@suse.cz>, miklos@szeredi.hu, 
	Amir Goldstein <amir73il@gmail.com>, tytso@mit.edu, adilger.kernel@dilger.ca, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, Kevin Berry <kpberry@google.com>, 
	Robert Kolchmeyer <rkolchmeyer@google.com>, Deepa Dinamani <deepadinamani@google.com>, 
	He Gao <hegao@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi all,

We are tracking a severe performance regression in Google's
Container-Optimized OS (COS) that appeared when moving from the 6.6
LTS kernel to the 6.12 LTS kernel.

Under concurrent CI workloads (specifically, many containers doing
Python package compilation / .pyc generation simultaneously), the 6.12
kernel suffers from massive jbd2 journal contention. Processes hang
for 20-30 seconds waiting for VFS locks and journal space. On 6.6, the
exact same workload completes in ~4 seconds.

# Environment:
* Host FS: ext4 (backed by standard cloud block storage)
* Container FS: OverlayFS (Docker)
* Machine: n2d-highmem-96 (96 vCPU, high memory)
* Good Kernel: 6.6.87
* Bad Kernels: 6.12.55, 6.12.68

# The Bottleneck
During the 20+ second hang, `cat /proc/<pid>/stack` reveals three
distinct groups of blocked processes thrashing on the jbd2 journal.
The OverlayFS copy-up mechanism seems to be generating so many
synchronous ext4 transactions that it exhausts the jbd2 transaction
buffers.

1. Journal Space Exhaustion (Waiting to start transaction):
[<0>] __jbd2_log_wait_for_space+0xa3/0x240
[<0>] start_this_handle+0x42d/0x8a0
[<0>] jbd2__journal_start+0x103/0x1e0
[<0>] __ext4_journal_start_sb+0x129/0x1c0
[<0>] __ext4_new_inode+0x7cd/0x1290
[<0>] ext4_create+0xbc/0x1b0
[<0>] vfs_create+0x192/0x250
[<0>] ovl_create_real+0xd5/0x170
[<0>] ovl_create_or_link+0x1d7/0x7f0

2. VFS Rename / Copy-up Contention (Blocked by the slow sync):
[<0>] lock_rename+0x29/0x50
[<0>] ovl_copy_up_flags+0x84c/0x12e0
[<0>] ovl_create_object+0x4a/0x120
[<0>] vfs_mkdir+0x1aa/0x260
[<0>] do_mkdirat+0xb9/0x240

3. Synchronous Flush Blocking:
[<0>] jbd2_log_wait_commit+0x107/0x150
[<0>] jbd2_journal_force_commit+0x9c/0xc0
[<0>] ext4_sync_file+0x278/0x310
[<0>] ovl_sync_file+0x2f/0x50
[<0>] ovl_copy_up_metadata+0x455/0x4b0

# Minimal Reproducer
The issue is easily reproducible by triggering 20 concurrent cold
Python imports in Docker, which forces OverlayFS to copy-up the
`__pycache__` directories and write the `.pyc` files.

```bash
# 1. Build a clean image with no pre-compiled bytecode
cat << 'EOF' > Dockerfile
FROM python:3.10-slim
RUN pip install --quiet google-cloud-compute
RUN find /usr/local -type d -name "__pycache__" -exec rm -rf {} +
EOF
docker build -t clean-import-test .

# 2. Fire 20 concurrent imports
for i in {1..20}; do
  docker run --rm clean-import-test bash -c 'time python -c "import
google.cloud.compute_v1"' > clean_test_cold_$i.log 2>&1 &
done
wait
grep "real" clean_test_cold_*.log
```

On 6.6.87, all 20 containers finish in ~4.3s.
On 6.12.x, they hang and finish between 17s and 27s. Bypassing disk
writes completely mitigates the regression on 6.12 (using
PYTHONDONTWRITEBYTECODE=1), confirming it is an ext4/overlayfs I/O
contention issue rather than a CPU scheduling one.

Because the regression spans from 6.6 to 6.12, bisection is quite
heavy. Before we initiate a full kernel bisect, does this symptom ring
a bell for any ext4 fast_commit, jbd2 locking, or OverlayFS
metacopy/sync changes introduced during this window?

Any pointers or patches you'd like us to test would be greatly appreciated.

Thanks,
Chenglong Tang
Google Container-Optimized OS Team
