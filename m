Received: from mail-lr2-f11.google.com (mail-lr2-f11.google.com [74.125.230.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418F6354AE3
	for <regressions@lists.linux.dev>; Fri,  7 Aug 2026 16:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786119396; cv=pass; b=Yc4qy16rLuwUnKPwuNPLPYapiZ9oXAj3dB5UepNGsXxfGAk50ecKpO+WRYoXTZK7npwfsmVOGpomuR5gn9wcz7TdRigO2s6J6Q42H9seHiQJvRaDDvcVqDC6PhAiuAalmd/+sAx9a3w3tddFSMPt9N5YxdxxXvR5t2C1CMxKJoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786119396; c=relaxed/simple;
	bh=4xhTbwlGPVO+mIF2BiI+bg9WOBc6lI3ugemGkMOx1wQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ftFwz4k9pbFttMlDM5sMNzzjzpvOIbnvVeDHoa42XfsdPdV38LzidD91RSwZQg7Czyw7w/29purFEB6YiXgMk30fpCLLysOjyotmhL0TH89peZqQxfp2D0A0qDJgS6GQ97j4CbEt1eSiVoManGSILbD53r++01ng7bePJ5V9bNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xt/eyO6K; arc=pass smtp.client-ip=74.125.230.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xt/eyO6K"
Received: by mail-lr2-f11.google.com with SMTP id 38308e7fff4ca-39c747ebf29so16953691fa.0
        for <regressions@lists.linux.dev>; Fri, 07 Aug 2026 09:16:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786119384; cv=none;
        d=google.com; s=arc-20260327;
        b=OnNCWoYyD1QgXezlWPSGxHeUlfW7NSvFVnYmfM++nET83zDDVl3nAtX6ZAVvfGXO5y
         /3z8nUpXZbLWp79lnBeLXeR8rDrZ9xjp/Sctek/d86EmvRcflCxUB763E5+bQ4iMNIsh
         vJ1/Eg0DokyWUtlvOHL6PmKZ0/hJ+U7IpFdIR2GCvzkW/En6nJNzeW1M7nJX9y88e9MB
         LnWazDK2aFllddHeFrNnQczIXeyZbq/snPWC1+77UjDTr76xNEaP0vrWlB1QygpIkgcK
         T4+/DWncjBZQO64ttyTWk6lP4S8iR/zFQuYhzf8fdKewKQnQ6LOz8f/9ZSWwxIFXAQS7
         nr5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=M4G/BTBpQuCoN9f6AKTuvFBeIP1ia0RH4I0KQE+Izo0=;
        fh=zJLkNA82G9zG2yyH9lKLkkPZUhvahrdzS/cvF/8PdUQ=;
        b=BpvSiYCV3vsF/EMwag1h7x04cf863tINMDb0oEobMPSDUNNXk++f2CY0ADQpdxbd90
         RL6em1n9ZSxtS/DYiDWRMOvwKew3W29TL6cMRCJaWlyXy4x8PvkmffgwNiJUmVJPzQ4Z
         CGqak1QJUvHW3q4xwbu7E6Mmm/3d3wa8USGodJPUL+DV/++u669TBnhMN1m7Bjl5Elri
         ekOcdO++Ywfyv8bUz7VON/MRrz/nrdGMN1V+Od6rqg+PTPFagRUb2TUvjuj03As2WeSJ
         nHbBbz4rC99HtZgCLiYqgEXGU44Pj9QKLZDECNYi48OL+mADM2aDGxlAHpgBZa5vbATz
         ITyA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786119384; x=1786724184; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M4G/BTBpQuCoN9f6AKTuvFBeIP1ia0RH4I0KQE+Izo0=;
        b=Xt/eyO6KHIT7ShSOQGh3HJdAvjmJFvHjVm6SEWuc5QFWVGoNOKXUJyjiB6lG5e6jmn
         zB/rRTVE3CLGKTr+50TmghGYcOUwEnM1Z+erO9Vovc2SHhV5HmoJfo6XL42Ts6FJjc+T
         4vj4TMp5NpnHAM7swJL1z7765XSEO4VRJyV3whQHWmrAa+6NlFbLj+FS1H7lfiXpRC7K
         poHYjUTQKUpTcg9E+krKxQYGZRgaMsoOCZnxhrp3riFfy4agq73ZpZ6vPMpvOzbM2IFK
         rixNIIuhyl2fmvqe8VPb0MWo2hvVQI3r6dFkMIMlKUvaAjm3b8ShJbJpVMAAF1wQsWxZ
         FIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786119384; x=1786724184;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M4G/BTBpQuCoN9f6AKTuvFBeIP1ia0RH4I0KQE+Izo0=;
        b=HX+VMJeQMBF5+5o6f0fE+pEtpDkaNq0Tj7tn5ucfk4Qiy5s2vJmgOTOOVLWh+3vP3w
         1KDTwOIV04Z2OLumshPWlOmODzB+B3OapUjndgD6mHaTg8F8u7Xwfhlccj0VUUlJ1IAp
         1I6Hpxcw8jOc0Eh1/gDQOo5VhO0mFeKO29pTM72zclOIKpP2x5cUC74neJGd4K1nFZfw
         hAfuniT71RiU1wcUD+Rl3YAIUilCa31Zm1DVR8tKIBPcRbKzUUuCcpHWO5qZUQ4j8Zvs
         K0I7/DT+MDMPWeWWF4t/o9inKuoqooela4BspuqeS2bc+Np68s3HwBwl9R9MDnZT8oMu
         lmyQ==
X-Forwarded-Encrypted: i=1; AHgh+RrbX/uAGTXtDIKRbK0F9WLCpIbk01+yLhQmPeAsj+msT9LkSKaX7KJdqisap8VKQ6IOCQtf1Zyv6Fz67Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywqh4Osrthf5XlSihskC//xM8HuRrS6tb160wi90k9njtUpEEH8
	Xo33bqX95iaXTfmEiiBmS3YXZlDN/AgUPdrCOT6RyNb1NTPWyVtLZZqpIvl2G9UtRuAPBm7lNCe
	+EXGtrsifP1NWG7Swa8quKWLSTUHL0pY=
X-Gm-Gg: AR+sD137v07bQ2mDlKVi9dnmriYQl8CZzp04NRoTMNjhADNR8XbkXDJYrfDiqrBcEeJ
	zeO/zPkbaSeAsYqtVb1mLdo1obQ4MdX5R/13Or3dDmT2x/gVNkTmgSAn+ItcNaOBWO0uhKzDVVP
	BqYEnTFBl5fni+GFFXbTZa9aFHkSfvi7nJ2Ldwi3J8WB8p1ppTrcH2JXo9eZojarW2RNP2PRw8T
	4FsXS9Rmtd5tr6sitoRleMWYsgbuGBsmzeWYt8GfgZS7MLkWm5k82QxEnbP4pgvsMrZo/5F2MS4
	/+gipi+wZ2BfIzi7TcYdOzlf7kppqm4sIwCR3SR3PPe/EbDu0Ge+5j8=
X-Received: by 2002:ac2:5dd7:0:b0:5b2:1de0:5e7c with SMTP id
 2adb3069b0e04-5b2f4cdc404mr2876480e87.51.1786119383362; Fri, 07 Aug 2026
 09:16:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Chengfeng Lin <lin2530632123@gmail.com>
Date: Sat, 8 Aug 2026 00:16:10 +0800
X-Gm-Features: AUfX_mzroksw6aCWlVSJID6HLEgHyh7V7alM_VE5i3jvV_mTvJsCNoYDXjoewds
Message-ID: <CANGjgdmt0FQ=offsdfn+wEaDxbOFoAa6bi92X_vEo4S6aCZ56A@mail.gmail.com>
Subject: [REGRESSION] io_uring/rsrc: MSG_RING SEND_FD fixed-file installation
 slowdown after 7029acd8a950
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Jens,

I found a repeatable 11.621% slowdown in a narrow fixed-file
registration/update workload at:

  7029acd8a950 ("io_uring/rsrc: get rid of per-ring io_rsrc_node list")

The same direction remained with 64 to 4,096 target slots. This is a synthetic
microbenchmark, not an application benchmark or a test of the normal
read/write fast path.

Original patch:

  https://lore.kernel.org/io-uring/20241029152249.667290-7-axboe@kernel.dk/

#regzbot introduced: 7029acd8a950
#regzbot title: io_uring MSG_RING SEND_FD fixed-file installation slowdown

The source ring has one 4 KiB memfd in fixed-file slot 0. Each round creates a
target ring with an empty 4,096-slot fixed-file table. It then uses
IORING_OP_MSG_RING with IORING_MSG_SEND_FD to fill all target slots in batches
of 64. The timed region includes SQE preparation, io_uring_enter(), and
completion processing. Full per-slot verification and teardown are outside
the timed region.

I used a fresh boot for each point:

  e410ffca5886 parent A -> 7029acd8a950 child -> e410ffca5886 parent B

Each point had 3 warm-up rounds and 15 measured rounds. Every measured round
completed 4,096 successful installs. The mean end-to-end cost was:

  point       mean ns/install
  parent A            102.476
  child               114.441
  parent B            102.576

The child was 11.621% slower than the midpoint of the two parent controls.
Dropping the first measured round from every point gave 11.649%, and the two
parent controls drifted by only 0.097%. All 45 measured rows passed the CQE,
slot-allocation, sentinel, affinity, and unexpected-result checks.

I also repeated the exact-kernel sequence with 64, 256, 1,024, and 4,096
target slots. The child was 11.853%, 8.717%, 8.399%, and 11.889% slower,
respectively. The smaller points were noisier, but all 180 rows passed the
semantic checks. The signal is therefore not confined to 4,096 slots.

The machine was an Intel Core i7-12700KF system with 32 GiB RAM. The process
was pinned to P-core CPU 2. The governor and EPP were set to performance,
Turbo was disabled, and actual runtime preemption was full. The three kernels
used the same normalized config, GCC 15.2.0 toolchain, Kbuild metadata,
module-signing key, equal-length release strings, and workload binary.

An untimed trace also ran 128 successful installs on each kernel. Both points
had 128 calls to io_msg_ring(), io_msg_install_complete(), and
__io_fixed_fd_install(). Calls to io_rsrc_node_alloc() nested under
__io_fixed_fd_install() changed from 0 in the parent to 128 in the child. This
confirms that the workload reaches the new per-install resource-node path; it
does not prove that this one function explains the full timing difference.

The later node-cache change, ed9f3112a8a8 ("io_uring: cache nodes and mapped
buffers"), is already present in Linux 7.1.3. In a separate matched run,
Linux 7.1.3 was still 15.602% slower than the Linux 6.12.95 control midpoint
for the same F0 workload, so the cache did not remove the release-to-release
signal in this test.

I understand that 7029acd8a950 removes per-ring serialization and avoids
resource reclamation stalls, so I am not suggesting a revert. Is this
registration-time cost an expected trade-off, or is the per-install
resource-node setup worth optimizing further?

Evidence bundle:

  https://github.com/lcf0399/linux-regression-evidence/tree/37b70f08786d0e2855289cfc317fd97e1160c970/io-uring-msg-ring-send-fd-install

Standalone reproducer:

  https://github.com/lcf0399/linux-regression-evidence/tree/37b70f08786d0e2855289cfc317fd97e1160c970/io-uring-msg-ring-send-fd-install/reproducer

Thanks,
Chengfeng
