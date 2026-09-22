Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81701566C7F
	for <regressions@lists.linux.dev>; Tue, 22 Sep 2026 16:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790094499; cv=pass; b=Yuo4LnOjRsz+640P/XCwtU1Kp/UxmyCXr8amV+dxxnZZf4jemctYG9jvDlyg5x4nK8HqkHrsXqYhKBBlhB1ns/F/941RBkBqf2UMxaEQvQDlucnWCYE+MwChl6mChaCar85g7nwEMt7DgwS0rHzIRWQUfNnlbfjRAT6QpIoYTjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790094499; c=relaxed/simple;
	bh=g41lSEJVifoLLki8xKaYXd2wESUfC9pFlILsyKjBmxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FYF5XNX6BNo/ncy1Qlb9Ic/GBq3hEUVqrLk3cJeRvjuRL8anZq7vUnJZ59bp7opDUyey6UEIvvn9eIESG9cUMn9TM4ZdntQQS9MYrgRhYcHc1qB34xJo1Vjy2TZvouXOucn40AnFlGHSIzbMepcQo0KJhEgRWBX/3cOewjQFscg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GUdzgQbv; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GUdzgQbv"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff176d5eso38448581fa.0
        for <regressions@lists.linux.dev>; Tue, 22 Sep 2026 09:28:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790094495; cv=none;
        d=google.com; s=arc-20260327;
        b=J3QuqF3L9djHaI3PLWg3NWbvFX+BoIUljrbIDqy6x6MM8yUBeFzKA9vYgqgmaaonyz
         zVPFDxFxqE0+Kq1OtnFqk/aP1RTNDtdykTkMV1jEjLyT3We2ejY/DZBsskMyeUWAYX9+
         XM4j7X5twFgNBw1YjK+ulYVgjMvEJnGy6KSu4qd+uGerXL14BDwoQqFUvlu+8eFTtOGz
         ijW4X3v2dMGwyIekZdsz49WtA5DhfCDxZiE3QmXUxrYPGZucHzB6XGwWmJ42rqHIdc+9
         1HoKMsoGgWhEAc/AMYZa1wkpr7WNsTb0ZFQf4P7J/5shSSOe6Xq1YTKu6ZENYfQS3EGU
         8/SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a/BHeMU5owW/H6JFz/PFt/fhWxi9JFNw6SR1iQIoH/8=;
        fh=H3KmDQcsIpopHbg2Mrx9fFhOFbHnnQND2/UyRrvLKbs=;
        b=qwvlM+WQHOm1uLqWGwgX0D5w8pI+wBA5s0NMYzOKaG+eVrrAK45Dpfc5MAzvFxAQVV
         GKfO7ryC6oa/OxA7WV7uGAsKjSEQStLUmTM/TQ7QssNRWGrb4MuKj2SUF8UzjBEqol2R
         fGFao4rIxMTbM2NlOpxeo3Zpq3eJckcWsWJ3rHbovEJRMoyHQKM38pvCND85pkpk/+r3
         JaSvwMHkWvkcSKC93Jrb12pCbrXQKgB/jTx0g1FwMOP0m3Wy3K7YVYGKzPOc6fXqQgmu
         jpCYDEJaKDaFmFMj3Sl6ganvEthhqGnVRT9J1fItWULtTG9VcKnkMr/146i0L9abSRWq
         JwpQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790094495; x=1790699295; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a/BHeMU5owW/H6JFz/PFt/fhWxi9JFNw6SR1iQIoH/8=;
        b=GUdzgQbvjFvPiaC4reCdcgkTtHHyGo6Gm9Z76Lfh5u/UEVuj3QMATZoVZ7Bc6q2i5K
         2GOoOQemRayQmxrlLxKu5NRqcbR0pe7eCph8kYAHxB2wW4iaBKX22nwaDzO8yXwsB3e4
         4rTBxMzemy1cG3l7Jduifh6VSm7ioFURB44azKsTJWxQRG2Njjf5R3+rnf2xToP7CCgz
         U7Ht1o6JkhvO05pnR5VAkKeOAYZ2dcJlzyecbY0uzuaGOGvbIZIW8keFceqO7h0nQp0g
         miL1hahSkcOtIJwPX7nFRYQX8UtfC7uCNHU7DzlBxoO2sfI8K+P/C9j61GZ3GRfrBpDT
         0YYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790094495; x=1790699295;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a/BHeMU5owW/H6JFz/PFt/fhWxi9JFNw6SR1iQIoH/8=;
        b=qgkpPKUq552PjOUZSsZGx+oFhhe8qW7tC7Nen2zaYZDLFSbVEv72fBQ4oW2v3M2xRB
         s9x17hMM/FubHYiK11XvyDEE9gYc7TXcgd5qn4zwukn5E4azOvO41JG0j3FkhtbDNI9s
         n5fQkAq79+JlMUcPAklH/+nRSxo/boqbCrjrY4oDnruCtzdfH7QX/X4ryfZIZUmW5eLt
         eokXM9rbLn4t7ZAnzUmCqVg7EIzkP20WGMyJDlzcEnI8w8bdXYNlnQ2r7RW8SZb5gmRK
         YA45TWqoukioK4BjqJOf6Da3rmMKS99UM6anCXXhyNMwZqCn7VHn+g0pNLvyJZ5zEdqE
         y87Q==
X-Forwarded-Encrypted: i=1; AKwUvBzQ0Es7bPLd7TmiHCVlojbmeTovlKM45JC+w2yfyfH/gCbLfeA6K+nWso7+UtAUEv4xoWgj1+0Dycn4mA==@lists.linux.dev
X-Gm-Message-State: AFuF++lzxh8Jm3W+8SWnZKNgmcl8fZ23AChA5KF7NrVvyFsEPmtEBwIi
	KoZvkbIyBVVMQuIc6938l3HKXxA07DLl+xxYMfLjs58l0+XBMcAG8jZz01jpQyTJOwSBpa76VjZ
	Py8KLqKsPvs298vwGhk/dKqjH6nZPgfI=
X-Gm-Gg: AYBFou37+X55E7hvikGhHVnsM8d790pq1pl/VSZElA7oVBkXVKRPz8OLWM/Sby5ciJv
	cDUDEDX0yx+M6hPTb1Kpn0OGso0bLk6ZfCT9cRCLMq9LrtrssKyXN5DgSOZc+WVA0pLfMtee0Vq
	BCQKmKsf+qN4pm47eD5kV8n6Rx7diRrWKeQ8C2UctnYrBFVv5hmmtgqiiv8dDE6yi5l56DhcIet
	S6xyHQkfi7DGJdG4QyUSpnOytvQVX8heBftTqfWcykCH5fAtCy/FlQjKLpPapfR/83XgfhoaDoh
	3Fzc/gGCBLBKXwwU9vhdohacyvnR7rfvfQhak3cY6UULdU8yhxcFDtAeltbKjahEK6yqviwGBiz
	nNRf7bV0Ymr1Zww==
X-Received: by 2002:a05:651c:30c9:b0:3a5:f982:9c78 with SMTP id
 38308e7fff4ca-3a5fbebfc4emr31286961fa.2.1790094494779; Tue, 22 Sep 2026
 09:28:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANGjgdnoz4NdqzOV9+SZaYTc+O_GkNNn5NVp+ZpHUQbp5h-QVQ@mail.gmail.com>
 <075aec24-cb7b-44ea-b3d8-be913a87c958@canonical.com>
In-Reply-To: <075aec24-cb7b-44ea-b3d8-be913a87c958@canonical.com>
From: Chengfeng Lin <lin2530632123@gmail.com>
Date: Wed, 23 Sep 2026 00:27:59 +0800
X-Gm-Features: AcwNN1WT15TcNQbGkaUlrPH7CYeriQ9Jzn6FIklMTfXi30WpsDL6oO2ILNL91P0
Message-ID: <CANGjgdmQZ3AdU5Lr-vYYph9iJ_YwFDd5XaeF6XFgOMEEmaL3nQ@mail.gmail.com>
Subject: Re: [REGRESSION] apparmor: AF_UNIX datagram send slowdown after 6456ccbd2ff7
To: John Johansen <john.johansen@canonical.com>
Cc: georgia.garcia@canonical.com, paul@paul-moore.com, jmorris@namei.org, 
	serge@hallyn.com, apparmor@lists.ubuntu.com, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: multipart/mixed; boundary="00000000000079fc08065c14da23"

--00000000000079fc08065c14da23
Content-Type: text/plain; charset="UTF-8"

Hi John,

I tested a small early-return prototype on v7.3-rc4 (93f51579e7df).
It reduced send syscall time by 12.84% in the original unconfined
socketpair benchmark. A separate two-process test found a 1.25% cost
when both peers were confined but allowed to communicate.

The attached patch returns early from aa_unix_peer_perm() only when the
whole label is unconfined. It skips peer-address and audit preparation.
The sender and receiver are still checked separately. The patch adds no
per-object fields and does not change label updates or locking.

For each prototype comparison, I used original -> patched -> original,
with a separate boot for each point. Both kernels used the same baseline,
GCC 15.2.0 and config, except for the kernel release suffix
(CONFIG_LOCALVERSION). The machine was the same bare-metal i7-12700KF
with 32 GiB RAM, full preemption, performance governor/EPP and Turbo off.

Each condition had three invocations per boot. Each invocation had
3 warm-up and 15 measured rounds of 65,536 messages, sent in batches of
32 messages of 128 bytes. Only sendmmsg() was timed; peer draining and
payload checks were outside the timed interval.

The original socketpair test ran on CPU 2. Results in ns/message were:

  original A       patched       original B
     416.073       359.448          408.719

The patch saved 52.95 ns/message, or 12.84%, against the original midpoint.
Maximum within-invocation CV was 0.114%; original-kernel drift was 1.78%.

The two-process test used connected abstract AF_UNIX datagram sockets,
with the sender on CPU 2 and receiver on CPU 4. Both ran as UID 1000.
The confined policies allowed communication. Results in ns/message were:

  peers                  original midpoint   patched      change
  both unconfined                  455.564     412.052      -9.55%
  sender confined only             569.902     561.786      -1.42%
  receiver confined only           578.244     562.807      -2.67%
  both confined                    741.385     750.620      +1.25%

The socketpair and two-process tests have different workload shapes.
Their absolute timings should not be compared directly.
The both-confined case added 9.24 ns/message, with maximum CV 0.51%
and original-kernel drift 0.16%. Across all four cases, these maxima
were 1.80% and 0.60%. These are send-only microbenchmark results,
not application timings.

I tested confined/unconfined peer combinations, stacked labels, datagram
and stream sockets, old and new policy ABIs, and serial policy replacement
followed by socket recreation. Allow and deny results matched expectations
on both the original and patched kernels. Fine-grained UNIX permission
tests used ABI 5.0 with network_v9.

Separate untimed probes confirmed that the outer checks still ran for
both sender and receiver. In the unconfined socketpair probe, internal
unix_peer_perm() calls were 2,112 -> 0 -> 2,112 across
original -> patched -> original. The two-process probes also confirmed
that only unconfined sides skipped this internal check.

The follow-up kept sockets open across policy and mode changes. Permission
results matched between the original and patched kernels. Each boot also
had two concurrent tests, each lasting two seconds with 16 policy
replacements during the send loop. A fixed sender deny remained effective
while the receiver policy changed.

One limit is worth noting: receiver-side deny updates did not revoke
access through the existing socket, on either kernel. That path uses the
socket's stored label, so matching the original behavior does not prove
immediate revocation. The live-update tests did not cover stacked labels
and were not exhaustive.

Separately, the original controlled source delta still reproduced a
13.61% slowdown. v7.3-rc4 was 20.35% slower than the same old baseline.
The latter includes other source and config changes; I do not attribute
that whole gap to 6456ccbd2ff7.

Results and test sources are at [1].

Would this whole-label early return be worth pursuing, given the small
cost on the both-confined path? This is a prototype for review.

Thanks,
Chengfeng

[1] https://github.com/lcf0399/linux-regression-evidence/tree/23b61ebab6aff0d8316334da7a988811082d204d/apparmor-af-unix-send-old-abi-6456cc/bare-metal/early-unconfined-20260922

--00000000000079fc08065c14da23
Content-Type: text/plain; charset="US-ASCII"; name="0002-early-unconfined.patch"
Content-Disposition: attachment; filename="0002-early-unconfined.patch"
Content-Transfer-Encoding: base64
Content-ID: <>
X-Attachment-Id: 

LS0tIGEvc2VjdXJpdHkvYXBwYXJtb3IvYWZfdW5peC5jCisrKyBiL3NlY3VyaXR5L2FwcGFybW9y
L2FmX3VuaXguYwpAQCAtNjM0LDEyICs2MzQsMTcgQEAKIAlzdHJ1Y3QgdW5peF9zb2NrICpwZWVy
dSA9IHVuaXhfc2socGVlcl9zayk7CiAJc3RydWN0IHVuaXhfc29jayAqdSA9IHVuaXhfc2soc2sp
OwogCWludCBwbGVuOwotCXN0cnVjdCBzb2NrYWRkcl91biAqcGFkZHIgPSBhYV9zdW5hZGRyKHVu
aXhfc2socGVlcl9zayksICZwbGVuKTsKKwlzdHJ1Y3Qgc29ja2FkZHJfdW4gKnBhZGRyOwogCiAJ
QUFfQlVHKCFsYWJlbCk7CiAJQUFfQlVHKCFzayk7CiAJQUFfQlVHKCFwZWVyX3NrKTsKIAlBQV9C
VUcoIXBlZXJfbGFiZWwpOworCisJaWYgKHVuY29uZmluZWQobGFiZWwpKQorCQlyZXR1cm4gMDsK
KworCXBhZGRyID0gYWFfc3VuYWRkcih1bml4X3NrKHBlZXJfc2spLCAmcGxlbik7CiAKIAlyZXR1
cm4gdW5peF9wZWVyX3Blcm0oc3Vial9jcmVkLCBsYWJlbCwgb3AsIHJlcXVlc3QsIHNrLAogCQkJ
ICAgICAgaXNfdW5peF9mcyhzaykgPyAmdS0+cGF0aCA6IE5VTEwsCkBAIC04MDksNCArODE0LDMg
QEAKIAogCXJldHVybiBlcnJvcjsKIH0KLQo=
--00000000000079fc08065c14da23--
