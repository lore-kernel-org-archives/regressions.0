Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB521EE7BC
	for <regressions@lists.linux.dev>; Tue, 10 Dec 2024 22:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733870608; cv=none; b=V72W4ybyI7qsLXDQwxVVgcd5TTkQIfZF3PhMwNfkPNW0aCVTY2K8+Cm+0XToI6+YtvLwAAKWTRFuGAiQHVxt28Tk8zvzgJKWDhnxBFiUNktaW1DWgJYK2h0ki4qvXpNRr2JFZLzVIwA0eOpgLOhuSoo3TU+xTUSVFDfVhkcHAfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733870608; c=relaxed/simple;
	bh=3Eq7AMhO7ZTya8w6ZdwS9S7NprMbQ+yUU2/rRO1Y3Pg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ecUXY+midsSfL7ZjhLT3a9DEZhNCO+BsmftdsVdZtRDUKuo8FZ1lIH/muFfBZgIA2eB3dsuCATqNQyEegDS2MApQ22MUqQw6UEKtIx5ie8xnoQxzjhydN16SeR9LlFJ+kijzBI3QzqIFuhK9XY0iVE0cPaLKhwdQ12QI3/TFUEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SB36u3bu; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SB36u3bu"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-211c1c131c4so721165ad.1
        for <regressions@lists.linux.dev>; Tue, 10 Dec 2024 14:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733870606; x=1734475406; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=h3X5Qr+8k9X+2hvuHngUho46v83TFcRfFs+gwv7G7uE=;
        b=SB36u3buHHezVXbfh7jxDOBRAXBPhpTJ9hsSano6aWwsJ1RAce8b3PtBXs4HI0b/TP
         fG3aTk9kB3/vFsPFmxKV6K/iIsBqm4xUlTaKOEuTtEKbr2vaa9tY4ptUc//HXInMK81k
         9UTCI3pqiBI2BdcDHpFEW4tnCYdt633SDId11FiC2L+0uuohCkCfjPUY6puAbWKKUnE9
         7dzcZf+7AG6qbJgE7cUijnSQP2umOdItOQhjxdGguoHHQimbMK6D/0zVXqnESxdoRYeJ
         4X345SOC/zIkQZbiCU7+tcd970VbELY+6DlYC3+YHw/XRPVSWBLMtJiJqc0Q8dNn0H4Q
         rOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733870606; x=1734475406;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h3X5Qr+8k9X+2hvuHngUho46v83TFcRfFs+gwv7G7uE=;
        b=dFn/0KGUqkyLnh3r8YmDb1NfwmkxikB9KlY/s7NHjUSIMK3jXvGOv0vAklnAfh+m9Y
         f6xlkbGbvFGosh2RyXXLWeRJi07HBlojstFwysq5m2rztNX7Am7BX2yLFmFn0CrqMMoe
         Q+Rw24+EbJ8b1mqj2QG9hH2m7HVnZN93ZOWzKC6f7skIvaDSJgIw/qnTU4pRCF4Xj8W4
         gpRaN+yPbRBmgHftAJL/xv7ClLV1yJuFHS/Z+XOgLq8V7HWzlCi4OyfTsxHXYUc1kHV9
         TrKBayxTC9sT9R0NaRFo3sePkYanxSFqFAjYXl6ipbrawyE0VSD4BfNfuLEhv8M4Wyeo
         0m/A==
X-Forwarded-Encrypted: i=1; AJvYcCXQHa8cM7TuYA8CFT7iHfGNZadE+CD9hwNufUSreaiipTsbWLoJEQAm6pqXBDiRfbRHNCB7YZYsWzL+zQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxnZh0q7vTCv34ehi4HH7v8E1XDOD983qGjgSXemO4MZJk9cnvA
	9bbJWOhB6WksMa1nUO2yB3PJ937/hUqySm/yZkEasQjfYwv93BW04VdTQWn2dkdloyzGZXcQz2S
	KnQ==
X-Google-Smtp-Source: AGHT+IHYFqYGkifAALeF4QNpnm5GdQyLqJOcPHyuQMgLXtkVCm1AQZ1NNcY7Jl1J9ugq/G8HQT+Vqw7hlFw=
X-Received: from pjbqb3.prod.google.com ([2002:a17:90b:2803:b0:2e2:9f67:1ca3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1811:b0:2ee:ad18:b310
 with SMTP id 98e67ed59e1d1-2f12881b569mr669555a91.18.1733870605922; Tue, 10
 Dec 2024 14:43:25 -0800 (PST)
Date: Tue, 10 Dec 2024 14:43:24 -0800
In-Reply-To: <9e827d41-a054-5c04-6ecb-b23f2a4b5913@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <52914da7-a97b-45ad-86a0-affdf8266c61@mailbox.org>
 <Z1hiiz40nUqN2e5M@google.com> <93a3edef-dde6-4ef6-ae40-39990040a497@mailbox.org>
 <9e827d41-a054-5c04-6ecb-b23f2a4b5913@amd.com>
Message-ID: <Z1jEDFpanEIVz1sY@google.com>
Subject: Re: [REGRESSION] from 74a0e79df68a8042fb84fd7207e57b70722cf825: VFIO
 PCI passthrough no longer works
From: Sean Christopherson <seanjc@google.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Simon Pilkington <simonp.git@mailbox.org>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Tue, Dec 10, 2024, Tom Lendacky wrote:
> On 12/10/24 14:33, Simon Pilkington wrote:
> > On 10/12/2024 16:47, Sean Christopherson wrote:
> >> Can you run with the below to see what bits the guest is trying to set (or clear)?
> >> We could get the same info via tracepoints, but this will likely be faster/easier.
> >>
> >> ---
> >>  arch/x86/kvm/svm/svm.c | 12 +++++++++---
> >>  1 file changed, 9 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> >> index dd15cc635655..5144d0283c9d 100644
> >> --- a/arch/x86/kvm/svm/svm.c
> >> +++ b/arch/x86/kvm/svm/svm.c
> >> @@ -3195,11 +3195,14 @@ static int svm_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr)
> >>  	case MSR_AMD64_DE_CFG: {
> >>  		u64 supported_de_cfg;
> >>  
> >> -		if (svm_get_feature_msr(ecx, &supported_de_cfg))
> >> +		if (WARN_ON_ONCE(svm_get_feature_msr(ecx, &supported_de_cfg)))
> >>  			return 1;
> >>  
> >> -		if (data & ~supported_de_cfg)
> >> +		if (data & ~supported_de_cfg) {
> >> +			pr_warn("DE_CFG supported = %llx, WRMSR = %llx\n",
> >> +				supported_de_cfg, data);
> >>  			return 1;
> >> +		}
> >>  
> >>  		/*
> >>  		 * Don't let the guest change the host-programmed value.  The
> >> @@ -3207,8 +3210,11 @@ static int svm_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr)
> >>  		 * are completely unknown to KVM, and the one bit known to KVM
> >>  		 * is simply a reflection of hardware capabilities.
> >>  		 */
> >> -		if (!msr->host_initiated && data != svm->msr_decfg)
> >> +		if (!msr->host_initiated && data != svm->msr_decfg) {
> >> +			pr_warn("DE_CFG current = %llx, WRMSR = %llx\n",
> >> +				svm->msr_decfg, data);
> >>  			return 1;
> >> +		}
> >>  
> >>  		svm->msr_decfg = data;
> >>  		break;
> >>
> >> base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
> > 
> > Relevant dmesg output with some context below. VM locked up as expected.
> > 
> > [   85.834971] vfio-pci 0000:0c:00.0: resetting
> > [   85.937573] vfio-pci 0000:0c:00.0: reset done
> > [   86.494210] vfio-pci 0000:0c:00.0: resetting
> > [   86.494264] vfio-pci 0000:0c:00.1: resetting
> > [   86.761442] vfio-pci 0000:0c:00.0: reset done
> > [   86.761480] vfio-pci 0000:0c:00.1: reset done
> > [   86.762392] vfio-pci 0000:0c:00.0: resetting
> > [   86.865462] vfio-pci 0000:0c:00.0: reset done
> > [   86.977360] virbr0: port 1(vnet1) entered learning state
> > [   88.993052] virbr0: port 1(vnet1) entered forwarding state
> > [   88.993057] virbr0: topology change detected, propagating
> > [  103.459114] kvm_amd: DE_CFG current = 0, WRMSR = 2
> > [  161.442032] virbr0: port 1(vnet1) entered disabled state // VM shut down
> 
> That is the MSR_AMD64_DE_CFG_LFENCE_SERIALIZE bit. Yeah, that actually
> does change the behavior of LFENCE and isn't just a reflection of the
> hardware.
> 
> Linux does set that bit on boot, too (if LFENCE always serializing isn't
> advertised 8000_0021_EAX[2]), so I'm kind of surprised it didn't pop up
> there.

Linux may be running afoul of this, but it would only become visible if someone
checked dmesg.  Even the "unsafe" MSR accesses in Linux gracefully handle faults
these days, the only symptom would be a WARN.

> I imagine that the above CPUID bit isn't set, so an attempt is made to
> set the MSR bit.

Yep.  And LFENCE_RDTSC _is_ supported, otherwise the supported_de_cfg check would
have failed.  Which means it's a-ok for the guest to set the bit, i.e. KVM won't
let the guest incorrectly think it's running on CPU for which LFENCE is serializing.

Unless you (Tom) disagree, I vote to simply drop the offending code, i.e. make
all supported bits fully writable from the guest.  KVM is firmly in the wrong here,
and I can't think of any reason to disallow the guest from clearing LFENCE_SERIALIZE.

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 6a350cee2f6c..5a82ead3bf0f 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -3201,15 +3201,6 @@ static int svm_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr)
                if (data & ~supported_de_cfg)
                        return 1;
 
-               /*
-                * Don't let the guest change the host-programmed value.  The
-                * MSR is very model specific, i.e. contains multiple bits that
-                * are completely unknown to KVM, and the one bit known to KVM
-                * is simply a reflection of hardware capabilities.
-                */
-               if (!msr->host_initiated && data != svm->msr_decfg)
-                       return 1;
-
                svm->msr_decfg = data;
                break;
        }

