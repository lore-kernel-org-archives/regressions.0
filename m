Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1793F22FDEF
	for <regressions@lists.linux.dev>; Tue, 10 Dec 2024 15:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733845647; cv=none; b=gGG9Cr5blMCP+5YfjnM5d733pibVrapZgAQpZPMPUSK514bdJzMexsBNjRXkYw5tcg7pmnF2csRZAJ84tJstTWDtVbfo7/QIKVnqdn1qzQ3fu4Z70HexcpNGEmS0OXcHDkerYwr/O0TsDoVJXCJG1xflfLMPd2byUeyhLeXG0rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733845647; c=relaxed/simple;
	bh=1CUVzWgqlJWWmRwsJh1LsALpOZYBXhS4oaGhAijTERk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F/qoDzsQSKVPPxiBqeX9ICTMcm0VUSRZWl6F09eHZbRTg7yh+kmwYYgMmu1UIWQNMuJkxMN7bSlsPP/yFQYYjuvixxdPMc7aTohNQxLEVR2eDOu8uABA0V0uXklV73oZEPVhm3KSjGE9wZRWsC27B6D/AuJyXmbwvv1f+oAwB24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0L3r+YNZ; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0L3r+YNZ"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-728e4e30163so441448b3a.1
        for <regressions@lists.linux.dev>; Tue, 10 Dec 2024 07:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733845645; x=1734450445; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KTvSRRTfNZQvoZQzqZSdBQnAG8g17VjNF2nt+7pLczk=;
        b=0L3r+YNZ3/0NNIT0rN90cLnhjEv1BGG5l7OfEaBGQPvJmLV/JUJgJ3Jy/s/V1+5Qut
         Riorwk6RrhpTQ+BLbC/vfCCCcrT84JMaScdNCztjf9/DZOCfAq3MzlB2CwzC492O72S9
         UmVhYdgNILt93hlM5i92AN58G+MpZABu/8v70/oPTHVEmKSDyMYDxoPBjpWCR3t1cAYV
         3L6lgRksPyll0ZY+P7rkkyytYQrDUcac1p6ki+SxETmYgh3K2tCE0kCtZzbYaQZc7h8+
         aVWuJNkv6Ky0z3x2cLaqCG7G0Gtu1+FNO6oPJib7YQFqaaE+H4nebEQndwjpspcXjXFi
         4yqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733845645; x=1734450445;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KTvSRRTfNZQvoZQzqZSdBQnAG8g17VjNF2nt+7pLczk=;
        b=hqj2B0UuHcuHa4B6l7RnyBjAvChUtWctGKpfhJlDANnmqE2JDZTPMuB0aLtpXkn74R
         c2xPuWsn2vt+oPNajMJBhfLaQiY48WJ/WgJz7yL6qWd1M3rZtI1rV3HfJDpRp6WKiQvf
         PJJUbsBVP4rO1hUv3+eAASDC/T0FPQACVetyT1aORE4zp66ye46Agyx7gRImBqyHPPGw
         ZCLWyrIDSAMrKLYwNXRo3MJO8j8r8PMbM2JJAPEOepU+olQOGrabEauUlQj5BRPyZ1sQ
         POV4UEmC2NJxMrAZLzRuPPULLmcCM1/twkFPg+u3jIX/eu8eknaSv8LUIjxNnUJteOln
         XB2A==
X-Forwarded-Encrypted: i=1; AJvYcCXIQBdsTPkXFCamVdLkheaSz96yfOZ7DLdEr9tWi8WSgOUZ+rSEfCsOgLnnEQSfIrKY6YRbW/FBxz5cMA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzA9ZQkj+dHRUITuzHbHweUhJ0HqvXvaDNW7ECBttGJHx0wD/uX
	ZEQZZdYT5cNpuZui8rpkSTVzYWjpDeHAx0TpkdRE/YPzDcdtyS+j6eVWpZG24wUQEWkMeLpXsWj
	S+A==
X-Google-Smtp-Source: AGHT+IGHIWibTQSvd05WcbKMeMUoU8sV0PDsPWhPYjcWh/orNjkXeSQt6HCj/nEUskeUrNyc9MtmCiSB0kw=
X-Received: from pfbcp27.prod.google.com ([2002:a05:6a00:349b:b0:725:b203:3555])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:cd4:b0:725:b4f7:378e
 with SMTP id d2e1a72fcca58-7273c7fdbf1mr7689740b3a.0.1733845645355; Tue, 10
 Dec 2024 07:47:25 -0800 (PST)
Date: Tue, 10 Dec 2024 07:47:23 -0800
In-Reply-To: <52914da7-a97b-45ad-86a0-affdf8266c61@mailbox.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <52914da7-a97b-45ad-86a0-affdf8266c61@mailbox.org>
Message-ID: <Z1hiiz40nUqN2e5M@google.com>
Subject: Re: [REGRESSION] from 74a0e79df68a8042fb84fd7207e57b70722cf825: VFIO
 PCI passthrough no longer works
From: Sean Christopherson <seanjc@google.com>
To: Simon Pilkington <simonp.git@mailbox.org>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	regressions@lists.linux.dev, Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="us-ascii"

+Tom

On Tue, Dec 10, 2024, Simon Pilkington wrote:
> Hi,
> 
> With the aforementioned commit I am no longer able to use PCI passthrough to
> a Windows guest on the X570 chipset with a 5950X CPU.
> 
> The minimal reproducer for me is to attach a GPU to the VM and attempt to
> start Windows setup from an iso image. The VM will apparently livelock at the
> setup splash screen before the spinner appears as one of my CPU cores goes up
> to 100% usage until I force off the VM. This could be very machine-specific
> though.

Ugh.  Yeah, it's pretty much guaranteed to be CPU specific behavior.

Tom, any idea what the guest might be trying to do?  It probably doesn't matter
in the end, it's not like KVM does anything with the value...

> Reverting to the old XOR check fixes both 6.12.y stable and 6.13-rc2 for me.
> Otherwise they're both bad. Can you please look into it? I can share the
> config I used for test builds if it would help.

Can you run with the below to see what bits the guest is trying to set (or clear)?
We could get the same info via tracepoints, but this will likely be faster/easier.

---
 arch/x86/kvm/svm/svm.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index dd15cc635655..5144d0283c9d 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -3195,11 +3195,14 @@ static int svm_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr)
 	case MSR_AMD64_DE_CFG: {
 		u64 supported_de_cfg;
 
-		if (svm_get_feature_msr(ecx, &supported_de_cfg))
+		if (WARN_ON_ONCE(svm_get_feature_msr(ecx, &supported_de_cfg)))
 			return 1;
 
-		if (data & ~supported_de_cfg)
+		if (data & ~supported_de_cfg) {
+			pr_warn("DE_CFG supported = %llx, WRMSR = %llx\n",
+				supported_de_cfg, data);
 			return 1;
+		}
 
 		/*
 		 * Don't let the guest change the host-programmed value.  The
@@ -3207,8 +3210,11 @@ static int svm_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr)
 		 * are completely unknown to KVM, and the one bit known to KVM
 		 * is simply a reflection of hardware capabilities.
 		 */
-		if (!msr->host_initiated && data != svm->msr_decfg)
+		if (!msr->host_initiated && data != svm->msr_decfg) {
+			pr_warn("DE_CFG current = %llx, WRMSR = %llx\n",
+				svm->msr_decfg, data);
 			return 1;
+		}
 
 		svm->msr_decfg = data;
 		break;

base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
-- 
