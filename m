Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089954AD4B2
	for <regressions@lists.linux.dev>; Wed,  2 Sep 2026 19:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788376505; cv=pass; b=dfOch5rba+efxw1CuwPW1+r8V9QlGRk/yDssJAk4c20afG3MyqmdRCMGTtQHBOUn7TXliXJ5szqnvMYuogR4nq8cK70pXSVlC+KZpwm/hQcuNbVngswusHwvllbPYqvMTzxz9Yroo7GACCbOndkHKupv6F3T5JgOKkBWvRbgapE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788376505; c=relaxed/simple;
	bh=JLV8Ofox8i3452kiplk76hZfUPxaEK+vxS1pmKYEFNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KJ43MZ8UnY3Z3wSHblA4e3cSlIehVc8k8Au9AaMZaMC8Ps8z+JGCFfgIW50nJ866uXUPoD98QnioMWzadwUtc9tzXvpC+XSUX0vm4f7vfwC9+DcHEyIXmeSlukdQubmzCO+u2H242UYFb0pc1syp/VCwhIXm4Hmc8d9UH+y/Wck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlVO/ddl; arc=pass smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlVO/ddl"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-46adfc80ff6so800460fac.2
        for <regressions@lists.linux.dev>; Wed, 02 Sep 2026 12:15:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788376499; cv=none;
        d=google.com; s=arc-20260327;
        b=i3aOIi/Wg17DxwtuIFtJA4eNUFIwvK34jThhC4x2FX10LTBhgtXTZMj4ZlLWajSP5U
         YBuXjJvswW7kIPCbpMxSz1WrqbSZKdQNGXp/A/S28JPKKEbzzM6F6k7tFqrgtvFRqp3Z
         27cTymMI7o3V4Dud0t4ElpaxNOBj6acoCsfR0f3CFl6C6MIqlM2Auiws0oTkfTwm7eOR
         N6PfwbvBUjie1LBDK23z4aiPcktK/33DnIhrIB435qiQjQJiJYelJzodlpiH4rN5cC2d
         st+8/z+YJXJNe10bfxjrZ0z4t0apohw0QBUpM/TtDhkzDJ5TSRUrKu72K3aaUa5u6A4b
         UcLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fhVgVDsfplRoO6QIS0+PaSfH5QyM7tCi3PZGVPNp3Fk=;
        fh=JzlSoJ4fg3/+rPMyjZ/ARhzOe8YbsBFeOR7NxIfTWJg=;
        b=c2klcPEG+b/6y4/Edah0tjrw+CN2LQnwoUHv/H8HenLy0wIXCvo3Nl1aBud0t7WjVY
         A+xQ4OWZSk7nc2ryOGjwQiEvlFyvfZCbpvmBC8svbq109YtRggNreYWfRZPNj+t3N3Dl
         pqSS2WYp5PMadXcYCajMQbmukx2C+duEv280QSJQ+BNhZpLYZe60SzyZR5vZfRA8MGx8
         vfm/v9HPiW0GHJozZQICNg/vvDA8pvlruPwBNO3mOA2Nq1Wp89HSTUXk+JHl+BhthJuL
         ecz6FlSzqpXFcVcS0a/zGjDGdNcexe7tJBIzEFEq9uA/Qib8T1iGRCsJHholeXSF5vys
         PSxw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788376499; x=1788981299; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fhVgVDsfplRoO6QIS0+PaSfH5QyM7tCi3PZGVPNp3Fk=;
        b=QlVO/ddluYTcSUQG15kkB9CtwbOpxDR71mGKc7yxz6JD00ta1pU/LJ+mOog0QH972R
         OiLtd37SU4NrR7vUijwNkCb2/GeLY9TiZ6oqHzDf95iHxUDpMgntwUjmRt8xkx6CV4IC
         /Z/qXegm4jlYy8mNZfH2HYWyZoKIxsJxtDr3jpgaGdrWasfCnZL5osAE8T+BF4TA53Vb
         UpShTB61v+HZ3C1ByyYEFblYohFy5r4myaeRJL0geKuwSC6J6A2v3XeP3SIPAlXiOX/N
         zxuBqf+lVLQu9QbUecZFTZkMRxmLPxhSzeKfvzryvtkWOnYLj4L0cZ6EwcKi7jwurGTo
         oTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788376499; x=1788981299;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhVgVDsfplRoO6QIS0+PaSfH5QyM7tCi3PZGVPNp3Fk=;
        b=jj1OjsghAURhlcqV23T9K6fFoHXGOpd1u0M8aqrIifGkZg8JsuymCrxfz2z1f4au9z
         D43EMa8E/F7Xi5WIjgLvGnTz8Ye0hH5VkxoFeM2SL+zQq7I8OnlBme4rvXxD9+TKUydz
         dSTGqQ1GOwsg+Pq0kIxJYdnW71GpqOjQcymOLsS0u8Ast5ql/jrHOQn3XBPlZU9hanPU
         P+GVKtGD7NUrIfJt4UuyN63LgrdysEOUK+gnPlIWR6BR9dadUQJJizefCcTLyjRt4MXA
         Twz16643q1jDIMKDH5bmBChDqOc9DEyB2DcIO+yPiE3qE84S7MZp2KgIwAS3Gu2AdWyU
         rT1g==
X-Forwarded-Encrypted: i=1; AKwUvBx2r3E5wfgPy3HTe6J7BmcyUqZxayldfjnNdLvsTNlcHzMRrKsq77oEq0ZNhEAlnpm4ES952KvuRJZvNA==@lists.linux.dev
X-Gm-Message-State: AFuF++no1MEgzlXSGS2gO/tG2W9JMoQ3ei5e8TbLCJYW1RLeeDWo9Wtq
	pGvLZeo6r8CHfaszE5Je0vYN8j3rHy+t1kNgTm07P/b1B6BAZnHYvfQZxehscBbXf4d/eGeOGvP
	GK12jWyJPvHuBUJZlXxz1MHD1qYiPmaU=
X-Gm-Gg: AYBFou0YbwAsWRXdzEYzx62CsOlrpfuEzFxLzHntmD7RtdmAQehbip7sRJcCcXdXWpK
	gZBqkGq5+G5wUls6L4RWz2zOcZAB9CquB8k4ahXPbP4PJ7SmFzsbyjxac4egdLwjzSnBmFgUhBq
	Xk65dSboW3wBW9N2KQvUm4A0dYjwjVjIo6xJfnSGGOhzyZtOWXAI9d7FMbKyxT2zGnGqZXvMkQ0
	0MdNvOXmxt+B8vNbgTmmctLwypAyFOoKoQHDTberT17599yDIhJFXKTPS6tJTL4+IxOA5UHtFhV
	mCvpyRt7VXEi0bpcFC20PabmeagJK1y93Ai/DZ5bLczQ6ptSEyfDa6Sq3LJ+HhUlsK2verO90ps
	/MBXLujY3ETXj7asSvCIo2GoWx64i/YpblU2KfOX/uDxYmFCfbs4v6H6bAC6fMWRor2vXAODwvz
	8QBS0jYCMD83RUd8H5ey4QmdHN3I7uKsvXvE+zf8/q
X-Received: by 2002:a05:6870:270:b0:46a:e87f:a7f3 with SMTP id
 586e51a60fabf-46f88507af1mr6165405fac.2.1788376499042; Wed, 02 Sep 2026
 12:14:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CALAyJWrn7OQyQMd5OPoifn_3qe6iWNf1+xSSg_six-+po9kpvQ@mail.gmail.com>
 <aphXfTJicnEde3R4@google.com>
In-Reply-To: <aphXfTJicnEde3R4@google.com>
From: Andrew Wilson <wizlonex@gmail.com>
Date: Wed, 2 Sep 2026 15:14:48 -0400
X-Gm-Features: AcwNN1UJNnt-8ayL0xjmSoouIWQ2GFKkS-vOs8cL869hId8ajPvh2JfxnCOJoF8
Message-ID: <CALAyJWqXT=LFr2wAi4egPPQX57=NRK5tXJh_t4nOKqrJbfga3A@mail.gmail.com>
Subject: Re: [REGRESSION] [6.12.y] crypto: ccp - Move SEV/SNP Platform
 initialization to KVM breaks SEV-ES VM launch
To: Sean Christopherson <seanjc@google.com>
Cc: ashish.kalra@amd.com, aik@amd.com, herbert@gondor.apana.org.au, 
	stable@vger.kernel.org, regressions@lists.linux.dev, thomas.lendacky@amd.com, 
	john.allen@amd.com, davem@davemloft.net, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 1145026@bugs.debian.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sean, Salvatore,

Tested-by: Andrew Wilson <your.email@address.com>

(With strong assistance from Gemini guiding me through builds, module
DKMS rebuilds, and interpreting logs!)

I can confirm that commit 6b748c39d18e completely resolves the issue,
and SEV, SEV-ES, AND SEV-SNP are fully functional on official Debian
packages (tested on EPYC Rome and EPYC Milan servers).

Here are the test results from bare-metal hardware:

1. Upstream v6.12.104 (Source build) on AMD EPYC (Rome):
   * Tested SEV-ES: Functional, VMs launch cleanly.

2. Debian 6.12.107-1 (linux-image-6.12.107+deb13-amd64) on AMD EPYC (Rome):
   * Tested SEV & SEV-ES: Functional.
   [    3.676036] kvm_amd: SEV enabled (ASIDs 16 - 253)
   [    3.690542] kvm_amd: SEV-ES enabled (ASIDs 1 - 15)
   [    3.735896] ccp 0000:26:00.1: SEV API:0.24 build:22

3. Debian 6.12.107-1 (linux-image-6.12.107+deb13-amd64) on AMD EPYC (Milan)=
:
   * Tested SEV-SNP: Fully functional!
   * Host log:
     [    4.678767] kvm_amd: SEV enabled (ASIDs 256 - 509)
     [    4.684694] kvm_amd: SEV-ES enabled (ASIDs 1 - 255)
     [    4.690563] kvm_amd: SEV-SNP enabled (ASIDs 1 - 255)
     [    6.212275] ccp 0000:47:00.1: SEV-SNP API:1.58 build:2
   * Guest dmesg:
     [    0.908804] Memory Encryption Features active: AMD SEV SEV-ES SEV-S=
NP
     [    0.908820] SEV: Status: SEV SEV-ES SEV-SNP
     [    2.109524] SEV: SNP running at VMPL0.
     [    3.439649] sev-guest sev-guest: Initialized SEV guest driver
(using VMPCK0 communication key)

Because Debian builds KVM as a module (CONFIG_KVM_AMD=3Dm), we avoid the
built-in CONFIG_KVM_AMD=3Dy SNP race on 6.12.y, so both SEV-ES and
SEV-SNP are completely working out-of-the-box on 6.12.107-1.

Salvatore: Debian bug #1145026 can be marked fully resolved by
linux-image-6.12.107-1.

Thank you all very much!

Very Respectfully,

Andrew Wilson

On Wed, Sep 2, 2026 at 1:06=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Wed, Sep 02, 2026, Andrew Wilson wrote:
> > #regzbot introduced: 3f8f0133a5fc9b32d0c308530320c3f2430ba5ab
> >
> > Hi all,
> >
> > I am writing to report a regression affecting AMD SEV-ES VM launches
> > on the 6.12 stable branch (first noticed in 6.12.97+ / 6.12.101).
> >
> > I completed a git bisect between working and failing kernels, which poi=
nted to:
> >
> > Commit: bb1c84647025 ("crypto: ccp - Move SEV/SNP Platform
> > initialization to KVM")
> > Upstream commit: 3f8f0133a5fc9b32d0c308530320c3f2430ba5ab
> >
> > ### Bisect & Verification Details:
> > * Last Known Working: 8a599f4f74d4
> > * First Broken Commit: bb1c84647025
> > * Tested on 6.12.101: Cleanly reverting bb1c84647025 immediately
> > resolves the issue and allows SEV-ES guests to boot normally.
>
> Can you try v6.12.104 or later?  I'm pretty sure this is fixed by commit
> 6b748c39d18e ("KVM: SVM: Add support to initialize SEV/SNP functionality =
in KVM"),
> i.e. is the same thing as:
> https://lore.kernel.org/all/20260814100652.225499-1-jinpu.wang@ionos.com
>
> Note, SNP is still buggered on 6.12.y if CONFIG_KVM_AMD=3Dy, I'll try and=
 send a
> backport for that soonish.
> https://lore.kernel.org/all/521b22fa-ef09-4449-909f-0120edfc4b24@oracle.c=
om
>
> > ### Failure Description:
> > With commit bb1c84647025 applied, `sev_platform_init(&args)` is
> > removed from `sev_pci_init()`, assuming KVM handles on-demand
> > initialization.
> >
> > On bare metal, the PSP firmware appears to remain uninitialized (does
> > not reach SEV_STATE_INIT at probe time). When QEMU initializes KVM and
> > queries host SEV-ES capabilities, the ioctl fails with -EPERM:
> >
> >   qemu-system-x86_64: -accel kvm: sev_common_kvm_init: guest policy
> > requires SEV-ES, but host SEV-ES support unavailable
> >   qemu-system-x86_64: -accel kvm: failed to initialize kvm: Operation
> > not permitted
> >
> > ### Hardware & Environment:
> > * Tested on: AMD EPYC (Rome / Milan) Supermicro platforms
> > * Kernel: Linux 6.12.101
> > * Hypervisor: QEMU / KVM
> >
> > I have access to Naples, Rome, and Milan test hardware and am happy to
> > test any patches, provide dmesg traces, or assist with debugging.  I
> > am not a tech-expert of any kind, but I have time to do some testing
> > if it helps.  THANK YOU for the great work.
> >
> > Original Debian bug reference:
> > https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1145026
