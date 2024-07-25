Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA6D13AA2A
	for <regressions@lists.linux.dev>; Thu, 25 Jul 2024 22:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721944929; cv=none; b=njJyrMPUvQcNLzZ0S5OtSzU6q1Hd/DUc6hzcBo3YZ1mzLgByztTTRR/bP1jM+WHSERID+7mRMeEuVzp8jHbbTwilw/OX8BdzBvZbFnI9aDpArfneC9fiZFOtVmueiOLkd+gepzsS12oFRp778iFo332/bAuWxFjehxWLhY55mjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721944929; c=relaxed/simple;
	bh=0JtSWpKjQL7eXFqJDRRstlJ3lPNTbTLYubrrG8/0+bU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/pOONurSlzsem8+JZrL+7jlIY/H0ENxLjmbIFyq3ZxrRWq6gHt5gWaiMNEYdw9wFciAmTFUka7QcS23lndbvdHDQIUgdZ8FD9OYD3NvZuLPTDynYk7PETNVaHqBClTnEMn0R6rcNpvSyXixYdUeaRy7+3vrjo6jBqM4gbHAknQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=GTSOwj+T; arc=none smtp.client-ip=212.227.126.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="GTSOwj+T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1721944883; x=1722549683; i=christian@heusel.eu;
	bh=VQ0ksRJwnPA7wTrNUCZjXlsgKB32Nz8T39Bu2SF1g1Q=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GTSOwj+TQXi72jpMgkKNh4E58y5QfTp3S5ldRqcdI/IECvYBErvDDaWYNgadspUU
	 uICjXljOhabXBCm62awBpHB2JoX5nBPAIVOV4CdkldoWpo4rjL3wvD7V0Bg00KH9a
	 SvQ4U6XQKJvdmQ8dDNeNWF2iJiSdO96STfwUxYhhHdXl8P+MSnZqWzeSguyT65Fzl
	 QqqQ+50ptvA5mCWRI01JcaDYyfQV0XJnCqdL9Eypu5x2QOVczT2s7OSt456ca9KqN
	 WjDiJ4k7dUdfXxeZIwTrp5isanJ8PYd8MRs//uud1YpvyAKurpGNoWnBObCtWWV+r
	 yVSXGsMXdYqxuV+PCA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([84.170.91.214]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MTRAS-1sjAI23AQG-00RsTq; Fri, 26 Jul 2024 00:01:23 +0200
Date: Fri, 26 Jul 2024 00:01:19 +0200
From: Christian Heusel <christian@heusel.eu>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, regressions@lists.linux.dev, 
	x86@kernel.org, rob@durendal.co.uk
Subject: Re: [REGRESSION][BISECTED] Early boot hangs since f0551af02130
Message-ID: <12df8b45-6100-4c8b-b82a-a6a75bed2e05@heusel.eu>
References: <361b2ba5-7fc3-4e9a-af63-adfd4bc20304@heusel.eu>
 <20240723120246.GBZp-b5nHHT0BWmKMZ@fat_crate.local>
 <5e08cab0-c6b5-4169-8d42-ddb0ffb4a6c9@heusel.eu>
 <20240725105029.GAZqIt9aLsIaG7JqN5@fat_crate.local>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r43caxcmhmq7iko2"
Content-Disposition: inline
In-Reply-To: <20240725105029.GAZqIt9aLsIaG7JqN5@fat_crate.local>
X-Provags-ID: V03:K1:88Ubtc5L2yn7R/rgdmrxwKdm2Tz6WwQpUsKqvc3gNAuvUOvxkfw
 paOuOQpdW9/RYJbTqlzgv3raWRntRk5HW38eaf4CMh+4DEKCEXF+aF49wXXh/DZL1W56cen
 UoUC+kIaTsL4LyI2NPx7M5tGUHEeJF95jItfwPZYHB74DvLPlDO94uASFhLvihQ/LqygZc2
 /s2YSCJV8UPKDbEjpVnxA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:P5EwHdgYXNo=;VKX5W0RjVMIoVUyQ2DPZRjin2Ix
 5z6UcjXDwPgLRSPpSw6wzgOoQciLLvCPtYUrCe7oapfRefGwfH4+TzDpo6kLcqVT8UBbwxMdk
 TaFFz9AhOJrRjJjy+qlrrSWB4F04eI9I/ILX6Y8ckE27iXEYCLpH+OdbM6Z1Js7UMKd28E1bA
 xpZRBv7c6Ox2S6uX8bpr67wwiRMZm8AK7CgPI/QPh3QRt9iznFUeJy3pn+J3GIzFF6+pBB4vH
 j5X5/bUptD8EYNholqehYkmO1/V52A34tO8XH8m9EmkSg9zwGeHwauMFa3QaMG6hkhsWMfTnM
 mDm/9Zrnnlw+ykXAxWYQlmUTzwOGbinMI+6OBMpO5zDOfI1Be9rSTB2E5Xjt+paUJesSm2lxX
 0tebSX9zq7X6heRQxIvdAFX3wm7na9bOHIAKLULiMhNUwKSGu/5KKdIo3KkJcEpNhfazpwEZW
 HM/tSa+wf1Ef4dHqJiP9I4NWaBf0nVt07gvBmMcWwDFAm5OBBM+okXzKq4olrZkFzSvrTovkg
 kqnbybXPxRCxOR4/hY3OhOwn6UAh9GDDYiAuFBwQO+ybT34gxxjxMfD+25uk4zFrVNLP/oO+V
 e1KC2itljYQbIbvMFmh149jPh+SrEgVpCca6dvHXeHkw159Qt7toBonqld7SGYPMDKimXsGkY
 wj5nBk6hV8dhm7qlWfT56TaH1zks39hyMVmAiLKhPn0cNP9QR5LG1f/S9KcOtrO8yxy8Pj6HN
 QFiS0o7vq8UeBwWhauS+5GjCGKzcJ3b4Q==


--r43caxcmhmq7iko2
Content-Type: multipart/mixed; boundary="lcbc7voog2cgm6hc"
Content-Disposition: inline


--lcbc7voog2cgm6hc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 24/07/25 12:50PM, Borislav Petkov wrote:
> On Wed, Jul 24, 2024 at 12:08:39AM +0200, Christian Heusel wrote:
> > See the attached dmesg for a boot with the mainline kernel that has the
> > problematic patch reverted!
>=20
> Thx.
>=20
> Now, please take plain 6.10 (no reverts), apply the below hunk and send me
> dmesg again.
>=20
> Make sure you boot with "apic=3Ddebug" on the kernel cmdline.
>=20
> Let's see what crap MADT has there.
>=20
> Also, send /proc/cpuinfo too pls.

See the attachments for the logs for both the requested things here!

>=20
> > Regarding the Arch Kernel, we're using a minimal patchset of 3 or 4
> > patches, see i.e. the following release:
> > https://github.com/archlinux/linux/releases/tag/v6.9.9-arch1
> >=20
> > Other releases are a bit more heavy, but mostly consist of additional
> > backports to fix issues before the next stable release.
>=20
> Yeah, when reporting an upstream bug, people should always test with the
> upstream kernel because everybody is backporting stuff now.

Yes that is understood, I think this was only an issue about the
surrounding communication .. We did the bisection and testing with the
mainline tree, but the dmesg for a working boot was retrieved with a our
"distro" kernel (which is essentially just the stable kernel as released
by the stable team).

Also as I had written in my initial mail we have verified that the issue
also was present at the latest mainline release candidate, which at the
time was 6.10-rc6

Sorry for causing some confusion on that part and I hope the above
outputs help with debugging this issue!

--lcbc7voog2cgm6hc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="cpuinfo.20240725.2237.txt"

processor	: 0
vendor_id	: AuthenticAMD
cpu family	: 23
model		: 1
model name	: AMD Ryzen 3 1300X Quad-Core Processor
stepping	: 1
microcode	: 0x8001137
cpu MHz		: 3593.662
cache size	: 512 KB
physical id	: 0
siblings	: 4
core id		: 0
cpu cores	: 4
apicid		: 0
initial apicid	: 0
fpu		: yes
fpu_exception	: yes
cpuid level	: 13
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl nonstop_tsc cpuid extd_apicid aperfmperf rapl pni pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand lahf_lm cmp_legacy extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw skinit wdt tce topoext perfctr_core perfctr_nb bpext perfctr_llc mwaitx cpb hw_pstate ssbd ibpb vmmcall fsgsbase bmi1 avx2 smep bmi2 rdseed adx smap clflushopt sha_ni xsaveopt xsavec xgetbv1 clzero irperf xsaveerptr arat npt lbrv svm_lock nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold avic v_vmsave_vmload vgif overflow_recov succor smca sev
bugs		: sysret_ss_attrs null_seg spectre_v1 spectre_v2 spec_store_bypass retbleed smt_rsb srso div0
bogomips	: 6989.88
TLB size	: 2560 4K pages
clflush size	: 64
cache_alignment	: 64
address sizes	: 43 bits physical, 48 bits virtual
power management: ts ttp tm hwpstate eff_freq_ro [13] [14]

processor	: 1
vendor_id	: AuthenticAMD
cpu family	: 23
model		: 1
model name	: AMD Ryzen 3 1300X Quad-Core Processor
stepping	: 1
microcode	: 0x8001137
cpu MHz		: 3595.200
cache size	: 512 KB
physical id	: 0
siblings	: 4
core id		: 1
cpu cores	: 4
apicid		: 1
initial apicid	: 1
fpu		: yes
fpu_exception	: yes
cpuid level	: 13
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl nonstop_tsc cpuid extd_apicid aperfmperf rapl pni pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand lahf_lm cmp_legacy extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw skinit wdt tce topoext perfctr_core perfctr_nb bpext perfctr_llc mwaitx cpb hw_pstate ssbd ibpb vmmcall fsgsbase bmi1 avx2 smep bmi2 rdseed adx smap clflushopt sha_ni xsaveopt xsavec xgetbv1 clzero irperf xsaveerptr arat npt lbrv svm_lock nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold avic v_vmsave_vmload vgif overflow_recov succor smca sev
bugs		: sysret_ss_attrs null_seg spectre_v1 spectre_v2 spec_store_bypass retbleed smt_rsb srso div0
bogomips	: 6989.88
TLB size	: 2560 4K pages
clflush size	: 64
cache_alignment	: 64
address sizes	: 43 bits physical, 48 bits virtual
power management: ts ttp tm hwpstate eff_freq_ro [13] [14]

processor	: 2
vendor_id	: AuthenticAMD
cpu family	: 23
model		: 1
model name	: AMD Ryzen 3 1300X Quad-Core Processor
stepping	: 1
microcode	: 0x8001137
cpu MHz		: 3493.383
cache size	: 512 KB
physical id	: 0
siblings	: 4
core id		: 8
cpu cores	: 4
apicid		: 8
initial apicid	: 8
fpu		: yes
fpu_exception	: yes
cpuid level	: 13
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl nonstop_tsc cpuid extd_apicid aperfmperf rapl pni pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand lahf_lm cmp_legacy extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw skinit wdt tce topoext perfctr_core perfctr_nb bpext perfctr_llc mwaitx cpb hw_pstate ssbd ibpb vmmcall fsgsbase bmi1 avx2 smep bmi2 rdseed adx smap clflushopt sha_ni xsaveopt xsavec xgetbv1 clzero irperf xsaveerptr arat npt lbrv svm_lock nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold avic v_vmsave_vmload vgif overflow_recov succor smca sev
bugs		: sysret_ss_attrs null_seg spectre_v1 spectre_v2 spec_store_bypass retbleed smt_rsb srso div0
bogomips	: 6989.88
TLB size	: 2560 4K pages
clflush size	: 64
cache_alignment	: 64
address sizes	: 43 bits physical, 48 bits virtual
power management: ts ttp tm hwpstate eff_freq_ro [13] [14]

processor	: 3
vendor_id	: AuthenticAMD
cpu family	: 23
model		: 1
model name	: AMD Ryzen 3 1300X Quad-Core Processor
stepping	: 1
microcode	: 0x8001137
cpu MHz		: 3592.037
cache size	: 512 KB
physical id	: 0
siblings	: 4
core id		: 9
cpu cores	: 4
apicid		: 9
initial apicid	: 9
fpu		: yes
fpu_exception	: yes
cpuid level	: 13
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl nonstop_tsc cpuid extd_apicid aperfmperf rapl pni pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand lahf_lm cmp_legacy extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw skinit wdt tce topoext perfctr_core perfctr_nb bpext perfctr_llc mwaitx cpb hw_pstate ssbd ibpb vmmcall fsgsbase bmi1 avx2 smep bmi2 rdseed adx smap clflushopt sha_ni xsaveopt xsavec xgetbv1 clzero irperf xsaveerptr arat npt lbrv svm_lock nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold avic v_vmsave_vmload vgif overflow_recov succor smca sev
bugs		: sysret_ss_attrs null_seg spectre_v1 spectre_v2 spec_store_bypass retbleed smt_rsb srso div0
bogomips	: 6989.88
TLB size	: 2560 4K pages
clflush size	: 64
cache_alignment	: 64
address sizes	: 43 bits physical, 48 bits virtual
power management: ts ttp tm hwpstate eff_freq_ro [13] [14]


--lcbc7voog2cgm6hc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="dmesg.20240725.2237.txt"
Content-Transfer-Encoding: quoted-printable

[    0.000000] Linux version 6.10.0-1.1-mainline-dirty (linux-mainline@arch=
linux) (gcc (GCC) 14.1.1 20240720, GNU ld (GNU Binutils) 2.42.0) #1 SMP PRE=
EMPT_DYNAMIC Thu, 25 Jul 2024 11:18:53 +0000
[    0.000000] Command line: BOOT_IMAGE=3D/boot/vmlinuz-linux-mainline root=
=3DUUID=3De317bc8b-4ecb-4d50-8a10-16c83daf75b3 rw nvidia-drm.modeset=3D1 ap=
ic=3Ddebug iommu=3Doff
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000009cfffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000009d00000-0x0000000009ffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000000a000000-0x000000000a1fffff] usable
[    0.000000] BIOS-e820: [mem 0x000000000a200000-0x000000000a209fff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x000000000a20a000-0x000000000affffff] usable
[    0.000000] BIOS-e820: [mem 0x000000000b000000-0x000000000b01ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000000b020000-0x00000000dbb65fff] usable
[    0.000000] BIOS-e820: [mem 0x00000000dbb66000-0x00000000dbc62fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000dbc63000-0x00000000dbcdffff] ACPI =
data
[    0.000000] BIOS-e820: [mem 0x00000000dbce0000-0x00000000dc1effff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x00000000dc1f0000-0x00000000dcee7fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000dcee8000-0x00000000deffffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000df000000-0x00000000dfffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000f8000000-0x00000000fbffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fd100000-0x00000000fdffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fea00000-0x00000000fea0ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000feb80000-0x00000000fec01fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec10000-0x00000000fec10fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec30000-0x00000000fec30fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed00000-0x00000000fed00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed40000-0x00000000fed44fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed80000-0x00000000fed8ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fedc2000-0x00000000fedcffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fedd4000-0x00000000fedd5fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000feefffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000021f37ffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] APIC: Static calls initialized
[    0.000000] e820: update [mem 0xceb94018-0xceba2057] usable =3D=3D> usab=
le
[    0.000000] e820: update [mem 0xceb63018-0xceb93257] usable =3D=3D> usab=
le
[    0.000000] e820: update [mem 0xceb32018-0xceb62257] usable =3D=3D> usab=
le
[    0.000000] e820: update [mem 0xceb12018-0xceb31457] usable =3D=3D> usab=
le
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem 0x0000000000000000-0x000000000009ff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x00000000000a0000-0x00000000000fff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000100000-0x0000000009cfff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x0000000009d00000-0x0000000009ffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x000000000a000000-0x000000000a1fff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000000a200000-0x000000000a209f=
ff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x000000000a20a000-0x000000000affff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000000b000000-0x000000000b01ff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x000000000b020000-0x00000000ceb120=
17] usable
[    0.000000] reserve setup_data: [mem 0x00000000ceb12018-0x00000000ceb314=
57] usable
[    0.000000] reserve setup_data: [mem 0x00000000ceb31458-0x00000000ceb320=
17] usable
[    0.000000] reserve setup_data: [mem 0x00000000ceb32018-0x00000000ceb622=
57] usable
[    0.000000] reserve setup_data: [mem 0x00000000ceb62258-0x00000000ceb630=
17] usable
[    0.000000] reserve setup_data: [mem 0x00000000ceb63018-0x00000000ceb932=
57] usable
[    0.000000] reserve setup_data: [mem 0x00000000ceb93258-0x00000000ceb940=
17] usable
[    0.000000] reserve setup_data: [mem 0x00000000ceb94018-0x00000000ceba20=
57] usable
[    0.000000] reserve setup_data: [mem 0x00000000ceba2058-0x00000000dbb65f=
ff] usable
[    0.000000] reserve setup_data: [mem 0x00000000dbb66000-0x00000000dbc62f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000dbc63000-0x00000000dbcdff=
ff] ACPI data
[    0.000000] reserve setup_data: [mem 0x00000000dbce0000-0x00000000dc1eff=
ff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x00000000dc1f0000-0x00000000dcee7f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000dcee8000-0x00000000deffff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x00000000df000000-0x00000000dfffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000f8000000-0x00000000fbffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fd100000-0x00000000fdffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fea00000-0x00000000fea0ff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000feb80000-0x00000000fec01f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fec10000-0x00000000fec10f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fec30000-0x00000000fec30f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed00000-0x00000000fed00f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed40000-0x00000000fed44f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed80000-0x00000000fed8ff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fedc2000-0x00000000fedcff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fedd4000-0x00000000fedd5f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fee00000-0x00000000feefff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000ff000000-0x00000000ffffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000100000000-0x000000021f37ff=
ff] usable
[    0.000000] efi: EFI v2.7 by American Megatrends
[    0.000000] efi: ACPI 2.0=3D0xdc16f000 ACPI=3D0xdc16f000 SMBIOS=3D0xdcd1=
a000 SMBIOS 3.0=3D0xdcd19000 ESRT=3D0xda4d8798 MEMATTR=3D0xd7bcb018 INITRD=
=3D0xd2e47e98 RNG=3D0xdbcdf018=20
[    0.000000] random: crng init done
[    0.000000] efi: Remove mem35: MMIO range=3D[0xf8000000-0xfbffffff] (64M=
B) from e820 map
[    0.000000] e820: remove [mem 0xf8000000-0xfbffffff] reserved
[    0.000000] efi: Remove mem36: MMIO range=3D[0xfd100000-0xfdffffff] (15M=
B) from e820 map
[    0.000000] e820: remove [mem 0xfd100000-0xfdffffff] reserved
[    0.000000] efi: Not removing mem37: MMIO range=3D[0xfea00000-0xfea0ffff=
] (64KB) from e820 map
[    0.000000] efi: Remove mem38: MMIO range=3D[0xfeb80000-0xfec01fff] (0MB=
) from e820 map
[    0.000000] e820: remove [mem 0xfeb80000-0xfec01fff] reserved
[    0.000000] efi: Not removing mem39: MMIO range=3D[0xfec10000-0xfec10fff=
] (4KB) from e820 map
[    0.000000] efi: Not removing mem40: MMIO range=3D[0xfec30000-0xfec30fff=
] (4KB) from e820 map
[    0.000000] efi: Not removing mem41: MMIO range=3D[0xfed00000-0xfed00fff=
] (4KB) from e820 map
[    0.000000] efi: Not removing mem42: MMIO range=3D[0xfed40000-0xfed44fff=
] (20KB) from e820 map
[    0.000000] efi: Not removing mem43: MMIO range=3D[0xfed80000-0xfed8ffff=
] (64KB) from e820 map
[    0.000000] efi: Not removing mem44: MMIO range=3D[0xfedc2000-0xfedcffff=
] (56KB) from e820 map
[    0.000000] efi: Not removing mem45: MMIO range=3D[0xfedd4000-0xfedd5fff=
] (8KB) from e820 map
[    0.000000] efi: Remove mem46: MMIO range=3D[0xfee00000-0xfeefffff] (1MB=
) from e820 map
[    0.000000] e820: remove [mem 0xfee00000-0xfeefffff] reserved
[    0.000000] efi: Remove mem47: MMIO range=3D[0xff000000-0xffffffff] (16M=
B) from e820 map
[    0.000000] e820: remove [mem 0xff000000-0xffffffff] reserved
[    0.000000] SMBIOS 3.1.1 present.
[    0.000000] DMI: Gigabyte Technology Co., Ltd. AB350M-D3V/AB350M-D3V-CF,=
 BIOS F23 08/08/2018
[    0.000000] DMI: Memory slots populated: 2/4
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 3493.383 MHz processor
[    0.000574] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> rese=
rved
[    0.000577] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000590] last_pfn =3D 0x21f380 max_arch_pfn =3D 0x400000000
[    0.000597] MTRR map: 5 entries (3 fixed + 2 variable; max 20), built fr=
om 9 variable MTRRs
[    0.000599] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT=
 =20
[    0.000825] e820: update [mem 0xe0000000-0xffffffff] usable =3D=3D> rese=
rved
[    0.000833] last_pfn =3D 0xdf000 max_arch_pfn =3D 0x400000000
[    0.000834] Scan for SMP in [mem 0x00000000-0x000003ff]
[    0.000847] Scan for SMP in [mem 0x0009fc00-0x0009ffff]
[    0.000858] Scan for SMP in [mem 0x000f0000-0x000fffff]
[    0.004981] Scan for SMP in [mem 0x0009ec00-0x0009efff]
[    0.005004] esrt: Reserving ESRT space from 0x00000000da4d8798 to 0x0000=
0000da4d87d0.
[    0.005011] e820: update [mem 0xda4d8000-0xda4d8fff] usable =3D=3D> rese=
rved
[    0.005030] Using GB pages for direct mapping
[    0.005408] Secure boot disabled
[    0.005409] RAMDISK: [mem 0xceba3000-0xcf469fff]
[    0.005427] ACPI: Early table checksum verification disabled
[    0.005431] ACPI: RSDP 0x00000000DC16F000 000024 (v02 ALASKA)
[    0.005434] ACPI: XSDT 0x00000000DC16F098 0000AC (v01 ALASKA A M I    01=
072009 AMI  00010013)
[    0.005440] ACPI: FACP 0x00000000DC1761E8 000114 (v06 ALASKA A M I    01=
072009 AMI  00010013)
[    0.005444] ACPI BIOS Warning (bug): Optional FADT field Pm2ControlBlock=
 has valid Length but zero Address: 0x0000000000000000/0x1 (20240322/tbfadt=
-611)
[    0.005448] ACPI: DSDT 0x00000000DC16F1D8 00700F (v02 ALASKA A M I    01=
072009 INTL 20120913)
[    0.005451] ACPI: FACS 0x00000000DC1D8E00 000040
[    0.005453] ACPI: APIC 0x00000000DC176300 0000DE (v03 ALASKA A M I    01=
072009 AMI  00010013)
[    0.005456] ACPI: FPDT 0x00000000DC1763E0 000044 (v01 ALASKA A M I    01=
072009 AMI  00010013)
[    0.005459] ACPI: FIDT 0x00000000DC176428 00009C (v01 ALASKA A M I    01=
072009 AMI  00010013)
[    0.005462] ACPI: SSDT 0x00000000DC1764C8 008C98 (v02 ALASKA A M I    00=
000002 MSFT 04000000)
[    0.005465] ACPI: CRAT 0x00000000DC17F160 000850 (v01 ALASKA A M I    00=
000001 AMD  00000001)
[    0.005468] ACPI: CDIT 0x00000000DC17F9B0 000029 (v01 ALASKA A M I    00=
000001 AMD  00000001)
[    0.005470] ACPI: SSDT 0x00000000DC17F9E0 002DBA (v01 ALASKA A M I    00=
000001 INTL 20120913)
[    0.005473] ACPI: MCFG 0x00000000DC1827A0 00003C (v01 ALASKA A M I    01=
072009 MSFT 00010013)
[    0.005476] ACPI: HPET 0x00000000DC1827E0 000038 (v01 ALASKA A M I    01=
072009 AMI  00000005)
[    0.005478] ACPI: SSDT 0x00000000DC182818 000024 (v01 ALASKA A M I    00=
001000 INTL 20120913)
[    0.005481] ACPI: UEFI 0x00000000DC182840 000048 (v01 ALASKA A M I    00=
000000      00000000)
[    0.005484] ACPI: BGRT 0x00000000DC182888 000038 (v01 ALASKA A M I    01=
072009 AMI  00010013)
[    0.005486] ACPI: IVRS 0x00000000DC1828C0 0000D0 (v02 ALASKA A M I    00=
000001 AMD  00000000)
[    0.005489] ACPI: SSDT 0x00000000DC182990 001A41 (v01 ALASKA A M I    00=
000001 INTL 20120913)
[    0.005492] ACPI: SSDT 0x00000000DC1843D8 0000F8 (v01 ALASKA A M I    00=
001000 INTL 20120913)
[    0.005495] ACPI: WSMT 0x00000000DC1844D0 000028 (v01 ALASKA A M I    01=
072009 AMI  00010013)
[    0.005497] ACPI: Reserving FACP table memory at [mem 0xdc1761e8-0xdc176=
2fb]
[    0.005498] ACPI: Reserving DSDT table memory at [mem 0xdc16f1d8-0xdc176=
1e6]
[    0.005499] ACPI: Reserving FACS table memory at [mem 0xdc1d8e00-0xdc1d8=
e3f]
[    0.005500] ACPI: Reserving APIC table memory at [mem 0xdc176300-0xdc176=
3dd]
[    0.005501] ACPI: Reserving FPDT table memory at [mem 0xdc1763e0-0xdc176=
423]
[    0.005502] ACPI: Reserving FIDT table memory at [mem 0xdc176428-0xdc176=
4c3]
[    0.005503] ACPI: Reserving SSDT table memory at [mem 0xdc1764c8-0xdc17f=
15f]
[    0.005504] ACPI: Reserving CRAT table memory at [mem 0xdc17f160-0xdc17f=
9af]
[    0.005505] ACPI: Reserving CDIT table memory at [mem 0xdc17f9b0-0xdc17f=
9d8]
[    0.005506] ACPI: Reserving SSDT table memory at [mem 0xdc17f9e0-0xdc182=
799]
[    0.005506] ACPI: Reserving MCFG table memory at [mem 0xdc1827a0-0xdc182=
7db]
[    0.005507] ACPI: Reserving HPET table memory at [mem 0xdc1827e0-0xdc182=
817]
[    0.005508] ACPI: Reserving SSDT table memory at [mem 0xdc182818-0xdc182=
83b]
[    0.005509] ACPI: Reserving UEFI table memory at [mem 0xdc182840-0xdc182=
887]
[    0.005510] ACPI: Reserving BGRT table memory at [mem 0xdc182888-0xdc182=
8bf]
[    0.005511] ACPI: Reserving IVRS table memory at [mem 0xdc1828c0-0xdc182=
98f]
[    0.005511] ACPI: Reserving SSDT table memory at [mem 0xdc182990-0xdc184=
3d0]
[    0.005512] ACPI: Reserving SSDT table memory at [mem 0xdc1843d8-0xdc184=
4cf]
[    0.005513] ACPI: Reserving WSMT table memory at [mem 0xdc1844d0-0xdc184=
4f7]
[    0.005526] mapped APIC to ffffffffff5fd000 (        fee00000)
[    0.005528] CPU topo: topo_register_apic: APIC ID: 0, ACPI ID: -1, prese=
nt: 1
[    0.005530] CPU topo: topo_register_apic: present, cpu 0
[    0.005600] No NUMA configuration found
[    0.005600] Faking a node at [mem 0x0000000000000000-0x000000021f37ffff]
[    0.005603] NODE_DATA(0) allocated [mem 0x21f37b000-0x21f37ffff]
[    0.005629] Zone ranges:
[    0.005630]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.005631]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.005633]   Normal   [mem 0x0000000100000000-0x000000021f37ffff]
[    0.005634]   Device   empty
[    0.005635] Movable zone start for each node
[    0.005636] Early memory node ranges
[    0.005636]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
[    0.005637]   node   0: [mem 0x0000000000100000-0x0000000009cfffff]
[    0.005639]   node   0: [mem 0x000000000a000000-0x000000000a1fffff]
[    0.005640]   node   0: [mem 0x000000000a20a000-0x000000000affffff]
[    0.005640]   node   0: [mem 0x000000000b020000-0x00000000dbb65fff]
[    0.005642]   node   0: [mem 0x00000000dcee8000-0x00000000deffffff]
[    0.005642]   node   0: [mem 0x0000000100000000-0x000000021f37ffff]
[    0.005644] Initmem setup node 0 [mem 0x0000000000001000-0x000000021f37f=
fff]
[    0.005649] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.005674] On node 0, zone DMA: 96 pages in unavailable ranges
[    0.005886] On node 0, zone DMA32: 768 pages in unavailable ranges
[    0.005908] On node 0, zone DMA32: 10 pages in unavailable ranges
[    0.013610] On node 0, zone DMA32: 32 pages in unavailable ranges
[    0.013752] On node 0, zone DMA32: 4994 pages in unavailable ranges
[    0.024644] On node 0, zone Normal: 4096 pages in unavailable ranges
[    0.024689] On node 0, zone Normal: 3200 pages in unavailable ranges
[    0.025123] ACPI: PM-Timer IO Port: 0x808
[    0.025129] CPU topo: topo_register_apic: APIC ID: 0, ACPI ID: 1, presen=
t: 1
[    0.025130] CPU topo: topo_register_apic: present, cpu 0
[    0.025131] CPU topo: topo_register_apic: APIC ID: 1, ACPI ID: 2, presen=
t: 1
[    0.025132] CPU topo: topo_register_apic: present, cpu 1
[    0.025133] CPU topo: topo_register_apic: APIC ID: 8, ACPI ID: 3, presen=
t: 1
[    0.025134] CPU topo: topo_register_apic: present, cpu 2
[    0.025135] CPU topo: topo_register_apic: APIC ID: 9, ACPI ID: 4, presen=
t: 1
[    0.025135] CPU topo: topo_register_apic: present, cpu 3
[    0.025136] CPU topo: topo_register_apic: APIC ID: 0, ACPI ID: 5, presen=
t: 0
[    0.025137] CPU topo: topo_register_apic: unit_cnt: 4
[    0.025138] CPU topo: Ignoring hot-pluggable APIC ID 0 in present packag=
e.
[    0.025139] CPU topo: topo_register_apic: APIC ID: 0, ACPI ID: 6, presen=
t: 0
[    0.025139] CPU topo: topo_register_apic: unit_cnt: 4
[    0.025140] CPU topo: Ignoring hot-pluggable APIC ID 0 in present packag=
e.
[    0.025141] CPU topo: topo_register_apic: APIC ID: 0, ACPI ID: 7, presen=
t: 0
[    0.025142] CPU topo: topo_register_apic: unit_cnt: 4
[    0.025142] CPU topo: Ignoring hot-pluggable APIC ID 0 in present packag=
e.
[    0.025143] CPU topo: topo_register_apic: APIC ID: 0, ACPI ID: 8, presen=
t: 0
[    0.025144] CPU topo: topo_register_apic: unit_cnt: 4
[    0.025144] CPU topo: Ignoring hot-pluggable APIC ID 0 in present packag=
e.
[    0.025145] CPU topo: topo_register_apic: APIC ID: 0, ACPI ID: 9, presen=
t: 0
[    0.025146] CPU topo: topo_register_apic: unit_cnt: 4
[    0.025146] CPU topo: Ignoring hot-pluggable APIC ID 0 in present packag=
e.
[    0.025147] CPU topo: topo_register_apic: APIC ID: 0, ACPI ID: 10, prese=
nt: 0
[    0.025148] CPU topo: topo_register_apic: unit_cnt: 4
[    0.025149] CPU topo: Ignoring hot-pluggable APIC ID 0 in present packag=
e.
[    0.025149] CPU topo: topo_register_apic: APIC ID: 0, ACPI ID: 11, prese=
nt: 0
[    0.025150] CPU topo: topo_register_apic: unit_cnt: 4
[    0.025151] CPU topo: Ignoring hot-pluggable APIC ID 0 in present packag=
e.
[    0.025151] CPU topo: topo_register_apic: APIC ID: 0, ACPI ID: 12, prese=
nt: 0
[    0.025152] CPU topo: topo_register_apic: unit_cnt: 4
[    0.025153] CPU topo: Ignoring hot-pluggable APIC ID 0 in present packag=
e.
[    0.025153] CPU topo: topo_register_apic: APIC ID: 0, ACPI ID: 13, prese=
nt: 0
[    0.025154] CPU topo: topo_register_apic: unit_cnt: 4
[    0.025155] CPU topo: Ignoring hot-pluggable APIC ID 0 in present packag=
e.
[    0.025155] CPU topo: topo_register_apic: APIC ID: 0, ACPI ID: 14, prese=
nt: 0
[    0.025156] CPU topo: topo_register_apic: unit_cnt: 4
[    0.025157] CPU topo: Ignoring hot-pluggable APIC ID 0 in present packag=
e.
[    0.025157] CPU topo: topo_register_apic: APIC ID: 0, ACPI ID: 15, prese=
nt: 0
[    0.025158] CPU topo: topo_register_apic: unit_cnt: 4
[    0.025159] CPU topo: Ignoring hot-pluggable APIC ID 0 in present packag=
e.
[    0.025160] CPU topo: topo_register_apic: APIC ID: 0, ACPI ID: 16, prese=
nt: 0
[    0.025160] CPU topo: topo_register_apic: unit_cnt: 4
[    0.025161] CPU topo: Ignoring hot-pluggable APIC ID 0 in present packag=
e.
[    0.025163] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
[    0.025181] IOAPIC[0]: apic_id 5, version 33, address 0xfec00000, GSI 0-=
23
[    0.025186] IOAPIC[1]: apic_id 6, version 33, address 0xfec01000, GSI 24=
-55
[    0.025188] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.025189] Int: type 0, pol 0, trig 0, bus 00, IRQ 00, APIC ID 5, APIC =
INT 02
[    0.025191] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.025192] Int: type 0, pol 3, trig 3, bus 00, IRQ 09, APIC ID 5, APIC =
INT 09
[    0.025194] Int: type 0, pol 0, trig 0, bus 00, IRQ 01, APIC ID 5, APIC =
INT 01
[    0.025196] Int: type 0, pol 0, trig 0, bus 00, IRQ 03, APIC ID 5, APIC =
INT 03
[    0.025197] Int: type 0, pol 0, trig 0, bus 00, IRQ 04, APIC ID 5, APIC =
INT 04
[    0.025198] Int: type 0, pol 0, trig 0, bus 00, IRQ 05, APIC ID 5, APIC =
INT 05
[    0.025199] Int: type 0, pol 0, trig 0, bus 00, IRQ 06, APIC ID 5, APIC =
INT 06
[    0.025200] Int: type 0, pol 0, trig 0, bus 00, IRQ 07, APIC ID 5, APIC =
INT 07
[    0.025202] Int: type 0, pol 0, trig 0, bus 00, IRQ 08, APIC ID 5, APIC =
INT 08
[    0.025203] Int: type 0, pol 0, trig 0, bus 00, IRQ 0a, APIC ID 5, APIC =
INT 0a
[    0.025204] Int: type 0, pol 0, trig 0, bus 00, IRQ 0b, APIC ID 5, APIC =
INT 0b
[    0.025205] Int: type 0, pol 0, trig 0, bus 00, IRQ 0c, APIC ID 5, APIC =
INT 0c
[    0.025206] Int: type 0, pol 0, trig 0, bus 00, IRQ 0d, APIC ID 5, APIC =
INT 0d
[    0.025207] Int: type 0, pol 0, trig 0, bus 00, IRQ 0e, APIC ID 5, APIC =
INT 0e
[    0.025208] Int: type 0, pol 0, trig 0, bus 00, IRQ 0f, APIC ID 5, APIC =
INT 0f
[    0.025211] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.025212] ACPI: HPET id: 0x10228201 base: 0xfed00000
[    0.025221] e820: update [mem 0xd8135000-0xd8179fff] usable =3D=3D> rese=
rved
[    0.025243] CPU topo: Max. logical packages:   1
[    0.025244] CPU topo: Max. logical dies:       1
[    0.025245] CPU topo: Max. dies per package:   1
[    0.025249] CPU topo: Max. threads per core:   1
[    0.025250] CPU topo: Num. cores per package:     4
[    0.025250] CPU topo: Num. threads per package:   4
[    0.025251] CPU topo: Allowing 4 present CPUs plus 0 hotplug CPUs
[    0.025254] mapped IOAPIC to ffffffffff5fc000 (fec00000)
[    0.025255] mapped IOAPIC to ffffffffff5fb000 (fec01000)
[    0.025276] PM: hibernation: Registered nosave memory: [mem 0x00000000-0=
x00000fff]
[    0.025277] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0=
x000fffff]
[    0.025279] PM: hibernation: Registered nosave memory: [mem 0x09d00000-0=
x09ffffff]
[    0.025281] PM: hibernation: Registered nosave memory: [mem 0x0a200000-0=
x0a209fff]
[    0.025283] PM: hibernation: Registered nosave memory: [mem 0x0b000000-0=
x0b01ffff]
[    0.025284] PM: hibernation: Registered nosave memory: [mem 0xceb12000-0=
xceb12fff]
[    0.025286] PM: hibernation: Registered nosave memory: [mem 0xceb31000-0=
xceb31fff]
[    0.025287] PM: hibernation: Registered nosave memory: [mem 0xceb32000-0=
xceb32fff]
[    0.025288] PM: hibernation: Registered nosave memory: [mem 0xceb62000-0=
xceb62fff]
[    0.025289] PM: hibernation: Registered nosave memory: [mem 0xceb63000-0=
xceb63fff]
[    0.025291] PM: hibernation: Registered nosave memory: [mem 0xceb93000-0=
xceb93fff]
[    0.025292] PM: hibernation: Registered nosave memory: [mem 0xceb94000-0=
xceb94fff]
[    0.025293] PM: hibernation: Registered nosave memory: [mem 0xceba2000-0=
xceba2fff]
[    0.025295] PM: hibernation: Registered nosave memory: [mem 0xd8135000-0=
xd8179fff]
[    0.025297] PM: hibernation: Registered nosave memory: [mem 0xda4d8000-0=
xda4d8fff]
[    0.025298] PM: hibernation: Registered nosave memory: [mem 0xdbb66000-0=
xdbc62fff]
[    0.025299] PM: hibernation: Registered nosave memory: [mem 0xdbc63000-0=
xdbcdffff]
[    0.025300] PM: hibernation: Registered nosave memory: [mem 0xdbce0000-0=
xdc1effff]
[    0.025301] PM: hibernation: Registered nosave memory: [mem 0xdc1f0000-0=
xdcee7fff]
[    0.025302] PM: hibernation: Registered nosave memory: [mem 0xdf000000-0=
xdfffffff]
[    0.025303] PM: hibernation: Registered nosave memory: [mem 0xe0000000-0=
xfe9fffff]
[    0.025304] PM: hibernation: Registered nosave memory: [mem 0xfea00000-0=
xfea0ffff]
[    0.025304] PM: hibernation: Registered nosave memory: [mem 0xfea10000-0=
xfec0ffff]
[    0.025305] PM: hibernation: Registered nosave memory: [mem 0xfec10000-0=
xfec10fff]
[    0.025306] PM: hibernation: Registered nosave memory: [mem 0xfec11000-0=
xfec2ffff]
[    0.025307] PM: hibernation: Registered nosave memory: [mem 0xfec30000-0=
xfec30fff]
[    0.025307] PM: hibernation: Registered nosave memory: [mem 0xfec31000-0=
xfecfffff]
[    0.025308] PM: hibernation: Registered nosave memory: [mem 0xfed00000-0=
xfed00fff]
[    0.025309] PM: hibernation: Registered nosave memory: [mem 0xfed01000-0=
xfed3ffff]
[    0.025309] PM: hibernation: Registered nosave memory: [mem 0xfed40000-0=
xfed44fff]
[    0.025310] PM: hibernation: Registered nosave memory: [mem 0xfed45000-0=
xfed7ffff]
[    0.025311] PM: hibernation: Registered nosave memory: [mem 0xfed80000-0=
xfed8ffff]
[    0.025312] PM: hibernation: Registered nosave memory: [mem 0xfed90000-0=
xfedc1fff]
[    0.025312] PM: hibernation: Registered nosave memory: [mem 0xfedc2000-0=
xfedcffff]
[    0.025313] PM: hibernation: Registered nosave memory: [mem 0xfedd0000-0=
xfedd3fff]
[    0.025314] PM: hibernation: Registered nosave memory: [mem 0xfedd4000-0=
xfedd5fff]
[    0.025315] PM: hibernation: Registered nosave memory: [mem 0xfedd6000-0=
xffffffff]
[    0.025316] [mem 0xe0000000-0xfe9fffff] available for PCI devices
[    0.025317] Booting paravirtualized kernel on bare hardware
[    0.025320] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 6370452778343963 ns
[    0.030525] setup_percpu: NR_CPUS:320 nr_cpumask_bits:4 nr_cpu_ids:4 nr_=
node_ids:1
[    0.030876] percpu: Embedded 66 pages/cpu s233472 r8192 d28672 u524288
[    0.030883] pcpu-alloc: s233472 r8192 d28672 u524288 alloc=3D1*2097152
[    0.030885] pcpu-alloc: [0] 0 1 2 3=20
[    0.030906] Kernel command line: BOOT_IMAGE=3D/boot/vmlinuz-linux-mainli=
ne root=3DUUID=3De317bc8b-4ecb-4d50-8a10-16c83daf75b3 rw nvidia-drm.modeset=
=3D1 apic=3Ddebug iommu=3Doff
[    0.030980] Unknown kernel command line parameters "BOOT_IMAGE=3D/boot/v=
mlinuz-linux-mainline", will be passed to user space.
[    0.031958] Dentry cache hash table entries: 1048576 (order: 11, 8388608=
 bytes, linear)
[    0.032494] Inode-cache hash table entries: 524288 (order: 10, 4194304 b=
ytes, linear)
[    0.032538] Fallback order for Node 0: 0=20
[    0.032543] Built 1 zonelists, mobility grouping on.  Total pages: 20839=
55
[    0.032545] Policy zone: Normal
[    0.032853] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    0.051136] Memory: 8076348K/8335820K available (18432K kernel code, 217=
7K rwdata, 13400K rodata, 3424K init, 3516K bss, 259212K reserved, 0K cma-r=
eserved)
[    0.051337] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D4, N=
odes=3D1
[    0.051375] ftrace: allocating 50091 entries in 196 pages
[    0.059201] ftrace: allocated 196 pages with 3 groups
[    0.059282] Dynamic Preempt: full
[    0.059319] rcu: Preemptible hierarchical RCU implementation.
[    0.059320] rcu: 	RCU restricting CPUs from NR_CPUS=3D320 to nr_cpu_ids=
=3D4.
[    0.059321] rcu: 	RCU priority boosting: priority 1 delay 500 ms.
[    0.059322] 	Trampoline variant of Tasks RCU enabled.
[    0.059322] 	Rude variant of Tasks RCU enabled.
[    0.059323] 	Tracing variant of Tasks RCU enabled.
[    0.059323] rcu: RCU calculated value of scheduler-enlistment delay is 3=
0 jiffies.
[    0.059324] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D4
[    0.059330] RCU Tasks: Setting shift to 2 and lim to 1 rcu_task_cb_adjus=
t=3D1.
[    0.059331] RCU Tasks Rude: Setting shift to 2 and lim to 1 rcu_task_cb_=
adjust=3D1.
[    0.059332] RCU Tasks Trace: Setting shift to 2 and lim to 1 rcu_task_cb=
_adjust=3D1.
[    0.063330] NR_IRQS: 20736, nr_irqs: 1000, preallocated irqs: 16
[    0.063525] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[    0.063663] kfence: initialized - using 2097152 bytes for 255 objects at=
 0x(____ptrval____)-0x(____ptrval____)
[    0.063692] Console: colour dummy device 80x25
[    0.063694] printk: legacy console [tty0] enabled
[    0.063741] ACPI: Core revision 20240322
[    0.063840] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, =
max_idle_ns: 133484873504 ns
[    0.063867] APIC: Switch to symmetric I/O mode setup
[    0.063935] enabled ExtINT on CPU#0
[    0.064524] ENABLING IO-APIC IRQs
[    0.064528] init IO_APIC IRQs
[    0.064528]  apic 5 pin 0 not connected
[    0.064533] IOAPIC[0]: Preconfigured routing entry (5-1 -> IRQ 1 Level:0=
 ActiveLow:0)
[    0.064536] IOAPIC[0]: Preconfigured routing entry (5-2 -> IRQ 0 Level:0=
 ActiveLow:0)
[    0.064540] IOAPIC[0]: Preconfigured routing entry (5-3 -> IRQ 3 Level:0=
 ActiveLow:0)
[    0.064543] IOAPIC[0]: Preconfigured routing entry (5-4 -> IRQ 4 Level:0=
 ActiveLow:0)
[    0.064545] IOAPIC[0]: Preconfigured routing entry (5-5 -> IRQ 5 Level:0=
 ActiveLow:0)
[    0.064548] IOAPIC[0]: Preconfigured routing entry (5-6 -> IRQ 6 Level:0=
 ActiveLow:0)
[    0.064551] IOAPIC[0]: Preconfigured routing entry (5-7 -> IRQ 7 Level:0=
 ActiveLow:0)
[    0.064554] IOAPIC[0]: Preconfigured routing entry (5-8 -> IRQ 8 Level:0=
 ActiveLow:0)
[    0.064557] IOAPIC[0]: Preconfigured routing entry (5-9 -> IRQ 9 Level:1=
 ActiveLow:1)
[    0.064560] IOAPIC[0]: Preconfigured routing entry (5-10 -> IRQ 10 Level=
:0 ActiveLow:0)
[    0.064563] IOAPIC[0]: Preconfigured routing entry (5-11 -> IRQ 11 Level=
:0 ActiveLow:0)
[    0.064566] IOAPIC[0]: Preconfigured routing entry (5-12 -> IRQ 12 Level=
:0 ActiveLow:0)
[    0.064569] IOAPIC[0]: Preconfigured routing entry (5-13 -> IRQ 13 Level=
:0 ActiveLow:0)
[    0.064571] IOAPIC[0]: Preconfigured routing entry (5-14 -> IRQ 14 Level=
:0 ActiveLow:0)
[    0.064574] IOAPIC[0]: Preconfigured routing entry (5-15 -> IRQ 15 Level=
:0 ActiveLow:0)
[    0.064575]  apic 5 pin 16 not connected
[    0.064576]  apic 5 pin 17 not connected
[    0.064577]  apic 5 pin 18 not connected
[    0.064578]  apic 5 pin 19 not connected
[    0.064578]  apic 5 pin 20 not connected
[    0.064579]  apic 5 pin 21 not connected
[    0.064580]  apic 5 pin 22 not connected
[    0.064580]  apic 5 pin 23 not connected
[    0.064581]  apic 6 pin 0 not connected
[    0.064582]  apic 6 pin 1 not connected
[    0.064582]  apic 6 pin 2 not connected
[    0.064583]  apic 6 pin 3 not connected
[    0.064584]  apic 6 pin 4 not connected
[    0.064584]  apic 6 pin 5 not connected
[    0.064585]  apic 6 pin 6 not connected
[    0.064585]  apic 6 pin 7 not connected
[    0.064586]  apic 6 pin 8 not connected
[    0.064587]  apic 6 pin 9 not connected
[    0.064587]  apic 6 pin 10 not connected
[    0.064588]  apic 6 pin 11 not connected
[    0.064588]  apic 6 pin 12 not connected
[    0.064589]  apic 6 pin 13 not connected
[    0.064590]  apic 6 pin 14 not connected
[    0.064590]  apic 6 pin 15 not connected
[    0.064591]  apic 6 pin 16 not connected
[    0.064591]  apic 6 pin 17 not connected
[    0.064592]  apic 6 pin 18 not connected
[    0.064593]  apic 6 pin 19 not connected
[    0.064593]  apic 6 pin 20 not connected
[    0.064594]  apic 6 pin 21 not connected
[    0.064594]  apic 6 pin 22 not connected
[    0.064595]  apic 6 pin 23 not connected
[    0.064596]  apic 6 pin 24 not connected
[    0.064596]  apic 6 pin 25 not connected
[    0.064597]  apic 6 pin 26 not connected
[    0.064597]  apic 6 pin 27 not connected
[    0.064598]  apic 6 pin 28 not connected
[    0.064598]  apic 6 pin 29 not connected
[    0.064599]  apic 6 pin 30 not connected
[    0.064600]  apic 6 pin 31 not connected
[    0.064739] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
-1
[    0.080534] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:=
 0x325ae63db2a, max_idle_ns: 440795332196 ns
[    0.080538] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 6989.88 BogoMIPS (lpj=3D11644610)
[    0.080550] AMD Zen1 DIV0 bug detected. Disable SMT for full protection.
[    0.080552] SVM disabled (by BIOS) in MSR_VM_CR
[    0.080584] LVT offset 1 assigned for vector 0xf9
[    0.080650] LVT offset 2 assigned for vector 0xf4
[    0.080666] Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 512
[    0.080667] Last level dTLB entries: 4KB 1536, 2MB 1536, 4MB 768, 1GB 0
[    0.080671] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user=
 pointer sanitization
[    0.080673] Spectre V2 : Mitigation: Retpolines
[    0.080674] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB=
 on context switch
[    0.080674] Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on VMEXIT
[    0.080675] Spectre V2 : Enabling Speculation Barrier for firmware calls
[    0.080676] RETBleed: Mitigation: untrained return thunk
[    0.080677] Spectre V2 : mitigation: Enabling conditional Indirect Branc=
h Prediction Barrier
[    0.080678] Speculative Store Bypass: Mitigation: Speculative Store Bypa=
ss disabled via prctl
[    0.080683] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point=
 registers'
[    0.080685] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.080685] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.080687] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.080688] x86/fpu: Enabled xstate features 0x7, context size is 832 by=
tes, using 'compacted' format.
[    0.099288] Freeing SMP alternatives memory: 40K
[    0.099292] pid_max: default: 32768 minimum: 301
[    0.100569] LSM: initializing lsm=3Dcapability,landlock,lockdown,yama,bpf
[    0.100590] landlock: Up and running.
[    0.100592] Yama: becoming mindful.
[    0.100597] LSM support for eBPF active
[    0.100627] Mount-cache hash table entries: 16384 (order: 5, 131072 byte=
s, linear)
[    0.100639] Mountpoint-cache hash table entries: 16384 (order: 5, 131072=
 bytes, linear)
[    0.101339] Using local APIC timer interrupts.
               calibrating APIC timer ...
[    0.208169] ... lapic delta =3D 623818
[    0.208170] ... PM-Timer delta =3D 357949
[    0.208171] ... PM-Timer result ok
[    0.208171] ..... delta 623818
[    0.208172] ..... mult: 26791579
[    0.208173] ..... calibration result: 332702
[    0.208173] ..... CPU clock speed is 3493.2437 MHz.
[    0.208174] ..... host bus clock speed is 99.2735 MHz.
[    0.208185] smpboot: CPU0: AMD Ryzen 3 1300X Quad-Core Processor (family=
: 0x17, model: 0x1, stepping: 0x1)
[    0.208362] Performance Events: Fam17h+ core perfctr, AMD PMU driver.
[    0.208367] ... version:                0
[    0.208368] ... bit width:              48
[    0.208369] ... generic registers:      6
[    0.208369] ... value mask:             0000ffffffffffff
[    0.208370] ... max period:             00007fffffffffff
[    0.208371] ... fixed-purpose events:   0
[    0.208372] ... event mask:             000000000000003f
[    0.208435] signal: max sigframe size: 1776
[    0.208462] rcu: Hierarchical SRCU implementation.
[    0.208463] rcu: 	Max phase no-delay instances is 1000.
[    0.210536] MCE: In-kernel MCE decoding enabled.
[    0.210536] NMI watchdog: Enabled. Permanently consumes one hw-PMU count=
er.
[    0.210536] smp: Bringing up secondary CPUs ...
[    0.210536] smpboot: x86: Booting SMP configuration:
[    0.210536] .... node  #0, CPUs:      #1 #2 #3
[    0.003616] masked ExtINT on CPU#1
[    0.003616] masked ExtINT on CPU#2
[    0.003616] masked ExtINT on CPU#3
[    0.215872] smp: Brought up 1 node, 4 CPUs
[    0.215872] smpboot: Total of 4 processors activated (27958.52 BogoMIPS)
[    0.217391] devtmpfs: initialized
[    0.217391] x86/mm: Memory block size: 128MB
[    0.217846] ACPI: PM: Registering ACPI NVS region [mem 0x0a200000-0x0a20=
9fff] (40960 bytes)
[    0.217846] ACPI: PM: Registering ACPI NVS region [mem 0xdbce0000-0xdc1e=
ffff] (5308416 bytes)
[    0.217846] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 6370867519511994 ns
[    0.217846] futex hash table entries: 1024 (order: 4, 65536 bytes, linea=
r)
[    0.217846] pinctrl core: initialized pinctrl subsystem
[    0.217846] PM: RTC time: 21:36:01, date: 2024-07-25
[    0.217858] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.218049] DMA: preallocated 1024 KiB GFP_KERNEL pool for atomic alloca=
tions
[    0.218165] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA pool for atomi=
c allocations
[    0.218286] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA32 pool for ato=
mic allocations
[    0.218298] audit: initializing netlink subsys (disabled)
[    0.218307] audit: type=3D2000 audit(1721943361.153:1): state=3Dinitiali=
zed audit_enabled=3D0 res=3D1
[    0.218307] thermal_sys: Registered thermal governor 'fair_share'
[    0.218307] thermal_sys: Registered thermal governor 'bang_bang'
[    0.218307] thermal_sys: Registered thermal governor 'step_wise'
[    0.218307] thermal_sys: Registered thermal governor 'user_space'
[    0.218307] thermal_sys: Registered thermal governor 'power_allocator'
[    0.218307] cpuidle: using governor ladder
[    0.218307] cpuidle: using governor menu
[    0.218307] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.218307] PCI: ECAM [mem 0xf8000000-0xfbffffff] (base 0xf8000000) for =
domain 0000 [bus 00-3f]
[    0.218307] PCI: Using configuration type 1 for base access
[    0.218307] kprobes: kprobe jump-optimization is enabled. All kprobes ar=
e optimized if possible.
[    0.225572] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    0.225572] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.225572] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.225572] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.225572] Demotion targets for Node 0: null
[    0.225572] ACPI: Added _OSI(Module Device)
[    0.225572] ACPI: Added _OSI(Processor Device)
[    0.225572] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.225572] ACPI: Added _OSI(Processor Aggregator Device)
[    0.235117] ACPI: 6 ACPI AML tables successfully acquired and loaded
[    0.235738] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.237504] ACPI: _OSC evaluation for CPUs failed, trying _PDC
[    0.237689] ACPI: Interpreter enabled
[    0.237706] ACPI: PM: (supports S0 S3 S4 S5)
[    0.237708] ACPI: Using IOAPIC for interrupt routing
[    0.238445] PCI: Using host bridge windows from ACPI; if necessary, use =
"pci=3Dnocrs" and report a bug
[    0.238447] PCI: Using E820 reservations for host bridge windows
[    0.240764] ACPI: Enabled 2 GPEs in block 00 to 1F
[    0.246929] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.246935] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI EDR HPX-Type3]
[    0.247018] acpi PNP0A08:00: _OSC: platform does not support [SHPCHotplu=
g LTR DPC]
[    0.247166] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME AER =
PCIeCapability]
[    0.247175] acpi PNP0A08:00: [Firmware Info]: ECAM [mem 0xf8000000-0xfbf=
fffff] for domain 0000 [bus 00-3f] only partially covers this bridge
[    0.247571] PCI host bridge to bus 0000:00
[    0.247573] pci_bus 0000:00: root bus resource [io  0x0000-0x03af window]
[    0.247575] pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7 window]
[    0.247577] pci_bus 0000:00: root bus resource [io  0x03b0-0x03df window]
[    0.247578] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.247580] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000dfff=
f window]
[    0.247581] pci_bus 0000:00: root bus resource [mem 0xe0000000-0xfec2fff=
f window]
[    0.247582] pci_bus 0000:00: root bus resource [mem 0xfee00000-0xfffffff=
f window]
[    0.247584] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.247597] pci 0000:00:00.0: [1022:1450] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.247677] pci 0000:00:00.2: [1022:1451] type 00 class 0x080600 convent=
ional PCI endpoint
[    0.247766] pci 0000:00:01.0: [1022:1452] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.247815] pci 0000:00:01.1: [1022:1453] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.247828] pci 0000:00:01.1: PCI bridge to [bus 01]
[    0.247833] pci 0000:00:01.1:   bridge window [mem 0xf7c00000-0xf7cfffff]
[    0.247923] pci 0000:00:01.1: PME# supported from D0 D3hot D3cold
[    0.248103] pci 0000:00:01.3: [1022:1453] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.248117] pci 0000:00:01.3: PCI bridge to [bus 02-0a]
[    0.248120] pci 0000:00:01.3:   bridge window [io  0xd000-0xefff]
[    0.248122] pci 0000:00:01.3:   bridge window [mem 0xf6400000-0xf77fffff]
[    0.248128] pci 0000:00:01.3:   bridge window [mem 0xf2100000-0xf21fffff=
 64bit pref]
[    0.248209] pci 0000:00:01.3: PME# supported from D0 D3hot D3cold
[    0.248415] pci 0000:00:02.0: [1022:1452] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.248478] pci 0000:00:03.0: [1022:1452] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.248528] pci 0000:00:03.1: [1022:1453] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.248547] pci 0000:00:03.1: PCI bridge to [bus 0b]
[    0.248551] pci 0000:00:03.1:   bridge window [io  0xf000-0xffff]
[    0.248553] pci 0000:00:03.1:   bridge window [mem 0xf5000000-0xf60fffff]
[    0.248560] pci 0000:00:03.1:   bridge window [mem 0xe0000000-0xf1ffffff=
 64bit pref]
[    0.248885] pci 0000:00:03.1: PME# supported from D0 D3hot D3cold
[    0.249088] pci 0000:00:04.0: [1022:1452] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.249154] pci 0000:00:07.0: [1022:1452] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.249200] pci 0000:00:07.1: [1022:1454] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.249213] pci 0000:00:07.1: PCI bridge to [bus 0c]
[    0.249217] pci 0000:00:07.1:   bridge window [mem 0xf7800000-0xf7afffff]
[    0.249234] pci 0000:00:07.1: enabling Extended Tags
[    0.249299] pci 0000:00:07.1: PME# supported from D0 D3hot D3cold
[    0.249472] pci 0000:00:08.0: [1022:1452] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.249521] pci 0000:00:08.1: [1022:1454] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.249535] pci 0000:00:08.1: PCI bridge to [bus 0d]
[    0.249539] pci 0000:00:08.1:   bridge window [mem 0xf7b00000-0xf7bfffff]
[    0.249810] pci 0000:00:08.1: enabling Extended Tags
[    0.249878] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
[    0.250089] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500 convent=
ional PCI endpoint
[    0.250297] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100 convent=
ional PCI endpoint
[    0.250512] pci 0000:00:18.0: [1022:1460] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.250552] pci 0000:00:18.1: [1022:1461] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.250585] pci 0000:00:18.2: [1022:1462] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.250618] pci 0000:00:18.3: [1022:1463] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.250651] pci 0000:00:18.4: [1022:1464] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.250683] pci 0000:00:18.5: [1022:1465] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.250716] pci 0000:00:18.6: [1022:1466] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.250748] pci 0000:00:18.7: [1022:1467] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.250857] pci 0000:01:00.0: [144d:a804] type 00 class 0x010802 PCIe En=
dpoint
[    0.250872] pci 0000:01:00.0: BAR 0 [mem 0xf7c00000-0xf7c03fff 64bit]
[    0.251073] pci 0000:00:01.1: PCI bridge to [bus 01]
[    0.251148] pci 0000:02:00.0: [1022:43bb] type 00 class 0x0c0330 PCIe Le=
gacy Endpoint
[    0.251164] pci 0000:02:00.0: BAR 0 [mem 0xf77a0000-0xf77a7fff 64bit]
[    0.251247] pci 0000:02:00.0: PME# supported from D3hot D3cold
[    0.251392] pci 0000:02:00.1: [1022:43b7] type 00 class 0x010601 PCIe Le=
gacy Endpoint
[    0.251433] pci 0000:02:00.1: BAR 5 [mem 0xf7780000-0xf779ffff]
[    0.251440] pci 0000:02:00.1: ROM [mem 0xf7700000-0xf777ffff pref]
[    0.251481] pci 0000:02:00.1: PME# supported from D3hot D3cold
[    0.251563] pci 0000:02:00.2: [1022:43b2] type 01 class 0x060400 PCIe Sw=
itch Upstream Port
[    0.251588] pci 0000:02:00.2: PCI bridge to [bus 03-0a]
[    0.251593] pci 0000:02:00.2:   bridge window [io  0xd000-0xefff]
[    0.251596] pci 0000:02:00.2:   bridge window [mem 0xf6400000-0xf76fffff]
[    0.251605] pci 0000:02:00.2:   bridge window [mem 0xf2100000-0xf21fffff=
 64bit pref]
[    0.251655] pci 0000:02:00.2: PME# supported from D3hot D3cold
[    0.251754] pci 0000:00:01.3: PCI bridge to [bus 02-0a]
[    0.251840] pci 0000:03:00.0: [1022:43b4] type 01 class 0x060400 PCIe Sw=
itch Downstream Port
[    0.251866] pci 0000:03:00.0: PCI bridge to [bus 04]
[    0.251947] pci 0000:03:00.0: PME# supported from D3hot D3cold
[    0.252052] pci 0000:03:01.0: [1022:43b4] type 01 class 0x060400 PCIe Sw=
itch Downstream Port
[    0.252078] pci 0000:03:01.0: PCI bridge to [bus 05]
[    0.252158] pci 0000:03:01.0: PME# supported from D3hot D3cold
[    0.252264] pci 0000:03:04.0: [1022:43b4] type 01 class 0x060400 PCIe Sw=
itch Downstream Port
[    0.252290] pci 0000:03:04.0: PCI bridge to [bus 06]
[    0.252296] pci 0000:03:04.0:   bridge window [io  0xe000-0xefff]
[    0.252299] pci 0000:03:04.0:   bridge window [mem 0xf7600000-0xf76fffff]
[    0.252308] pci 0000:03:04.0:   bridge window [mem 0xf2100000-0xf21fffff=
 64bit pref]
[    0.252374] pci 0000:03:04.0: PME# supported from D3hot D3cold
[    0.252481] pci 0000:03:05.0: [1022:43b4] type 01 class 0x060400 PCIe Sw=
itch Downstream Port
[    0.252507] pci 0000:03:05.0: PCI bridge to [bus 07]
[    0.252587] pci 0000:03:05.0: PME# supported from D3hot D3cold
[    0.252694] pci 0000:03:06.0: [1022:43b4] type 01 class 0x060400 PCIe Sw=
itch Downstream Port
[    0.252720] pci 0000:03:06.0: PCI bridge to [bus 08-09]
[    0.252726] pci 0000:03:06.0:   bridge window [io  0xd000-0xdfff]
[    0.252729] pci 0000:03:06.0:   bridge window [mem 0xf6400000-0xf74fffff]
[    0.252802] pci 0000:03:06.0: PME# supported from D3hot D3cold
[    0.252910] pci 0000:03:07.0: [1022:43b4] type 01 class 0x060400 PCIe Sw=
itch Downstream Port
[    0.252936] pci 0000:03:07.0: PCI bridge to [bus 0a]
[    0.253016] pci 0000:03:07.0: PME# supported from D3hot D3cold
[    0.253129] pci 0000:02:00.2: PCI bridge to [bus 03-0a]
[    0.253168] pci 0000:03:00.0: PCI bridge to [bus 04]
[    0.253213] pci 0000:03:01.0: PCI bridge to [bus 05]
[    0.253286] pci 0000:06:00.0: [10ec:8168] type 00 class 0x020000 PCIe En=
dpoint
[    0.253313] pci 0000:06:00.0: BAR 0 [io  0xe000-0xe0ff]
[    0.253348] pci 0000:06:00.0: BAR 2 [mem 0xf7600000-0xf7600fff 64bit]
[    0.253370] pci 0000:06:00.0: BAR 4 [mem 0xf2100000-0xf2103fff 64bit pre=
f]
[    0.253519] pci 0000:06:00.0: supports D1 D2
[    0.253520] pci 0000:06:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.253731] pci 0000:03:04.0: PCI bridge to [bus 06]
[    0.253771] pci 0000:03:05.0: PCI bridge to [bus 07]
[    0.253863] pci 0000:08:00.0: [8086:10c9] type 00 class 0x020000 PCIe En=
dpoint
[    0.253899] pci 0000:08:00.0: BAR 0 [mem 0xf7420000-0xf743ffff]
[    0.253919] pci 0000:08:00.0: BAR 1 [mem 0xf7000000-0xf73fffff]
[    0.253939] pci 0000:08:00.0: BAR 2 [io  0xd020-0xd03f]
[    0.253958] pci 0000:08:00.0: BAR 3 [mem 0xf74c4000-0xf74c7fff]
[    0.254015] pci 0000:08:00.0: ROM [mem 0xf6c00000-0xf6ffffff pref]
[    0.254187] pci 0000:08:00.0: PME# supported from D0 D3hot D3cold
[    0.254264] pci 0000:08:00.0: VF BAR 0 [mem 0xf74a0000-0xf74a3fff 64bit]
[    0.254265] pci 0000:08:00.0: VF BAR 0 [mem 0xf74a0000-0xf74bffff 64bit]=
: contains BAR 0 for 8 VFs
[    0.254313] pci 0000:08:00.0: VF BAR 3 [mem 0xf7480000-0xf7483fff 64bit]
[    0.254314] pci 0000:08:00.0: VF BAR 3 [mem 0xf7480000-0xf749ffff 64bit]=
: contains BAR 3 for 8 VFs
[    0.254514] pci 0000:08:00.0: 2.000 Gb/s available PCIe bandwidth, limit=
ed by 2.5 GT/s PCIe x1 link at 0000:03:06.0 (capable of 8.000 Gb/s with 2.5=
 GT/s PCIe x4 link)
[    0.254671] pci 0000:08:00.1: [8086:10c9] type 00 class 0x020000 PCIe En=
dpoint
[    0.254707] pci 0000:08:00.1: BAR 0 [mem 0xf7400000-0xf741ffff]
[    0.254727] pci 0000:08:00.1: BAR 1 [mem 0xf6800000-0xf6bfffff]
[    0.254746] pci 0000:08:00.1: BAR 2 [io  0xd000-0xd01f]
[    0.254766] pci 0000:08:00.1: BAR 3 [mem 0xf74c0000-0xf74c3fff]
[    0.254823] pci 0000:08:00.1: ROM [mem 0xf6400000-0xf67fffff pref]
[    0.254994] pci 0000:08:00.1: PME# supported from D0 D3hot D3cold
[    0.255070] pci 0000:08:00.1: VF BAR 0 [mem 0xf7460000-0xf7463fff 64bit]
[    0.255071] pci 0000:08:00.1: VF BAR 0 [mem 0xf7460000-0xf747ffff 64bit]=
: contains BAR 0 for 8 VFs
[    0.255119] pci 0000:08:00.1: VF BAR 3 [mem 0xf7440000-0xf7443fff 64bit]
[    0.255120] pci 0000:08:00.1: VF BAR 3 [mem 0xf7440000-0xf745ffff 64bit]=
: contains BAR 3 for 8 VFs
[    0.255463] pci 0000:03:06.0: PCI bridge to [bus 08-09]
[    0.255503] pci 0000:03:07.0: PCI bridge to [bus 0a]
[    0.255884] pci 0000:0b:00.0: [10de:1d01] type 00 class 0x030000 PCIe Le=
gacy Endpoint
[    0.255901] pci 0000:0b:00.0: BAR 0 [mem 0xf5000000-0xf5ffffff]
[    0.255914] pci 0000:0b:00.0: BAR 1 [mem 0xe0000000-0xefffffff 64bit pre=
f]
[    0.255928] pci 0000:0b:00.0: BAR 3 [mem 0xf0000000-0xf1ffffff 64bit pre=
f]
[    0.255937] pci 0000:0b:00.0: BAR 5 [io  0xf000-0xf07f]
[    0.255946] pci 0000:0b:00.0: ROM [mem 0xf6000000-0xf607ffff pref]
[    0.255980] pci 0000:0b:00.0: Video device with shadowed ROM at [mem 0x0=
00c0000-0x000dffff]
[    0.256118] pci 0000:0b:00.0: 8.000 Gb/s available PCIe bandwidth, limit=
ed by 2.5 GT/s PCIe x4 link at 0000:00:03.1 (capable of 31.504 Gb/s with 8.=
0 GT/s PCIe x4 link)
[    0.256208] pci 0000:0b:00.1: [10de:0fb8] type 00 class 0x040300 PCIe En=
dpoint
[    0.256225] pci 0000:0b:00.1: BAR 0 [mem 0xf6080000-0xf6083fff]
[    0.256418] pci 0000:00:03.1: PCI bridge to [bus 0b]
[    0.256485] pci 0000:0c:00.0: [1022:145a] type 00 class 0x130000 PCIe En=
dpoint
[    0.256508] pci 0000:0c:00.0: enabling Extended Tags
[    0.256594] pci 0000:0c:00.2: [1022:1456] type 00 class 0x108000 PCIe En=
dpoint
[    0.256606] pci 0000:0c:00.2: BAR 2 [mem 0xf7900000-0xf79fffff]
[    0.256614] pci 0000:0c:00.2: BAR 5 [mem 0xf7a00000-0xf7a01fff]
[    0.256620] pci 0000:0c:00.2: enabling Extended Tags
[    0.256719] pci 0000:0c:00.3: [1022:145c] type 00 class 0x0c0330 PCIe En=
dpoint
[    0.256728] pci 0000:0c:00.3: BAR 0 [mem 0xf7800000-0xf78fffff 64bit]
[    0.256747] pci 0000:0c:00.3: enabling Extended Tags
[    0.256775] pci 0000:0c:00.3: PME# supported from D0 D3hot D3cold
[    0.256859] pci 0000:00:07.1: PCI bridge to [bus 0c]
[    0.256933] pci 0000:0d:00.0: [1022:1455] type 00 class 0x130000 PCIe En=
dpoint
[    0.256956] pci 0000:0d:00.0: enabling Extended Tags
[    0.257050] pci 0000:0d:00.2: [1022:7901] type 00 class 0x010601 PCIe En=
dpoint
[    0.257074] pci 0000:0d:00.2: BAR 5 [mem 0xf7b08000-0xf7b08fff]
[    0.257082] pci 0000:0d:00.2: enabling Extended Tags
[    0.257113] pci 0000:0d:00.2: PME# supported from D3hot D3cold
[    0.257187] pci 0000:0d:00.3: [1022:1457] type 00 class 0x040300 PCIe En=
dpoint
[    0.257194] pci 0000:0d:00.3: BAR 0 [mem 0xf7b00000-0xf7b07fff]
[    0.257217] pci 0000:0d:00.3: enabling Extended Tags
[    0.257247] pci 0000:0d:00.3: PME# supported from D0 D3hot D3cold
[    0.257326] pci 0000:00:08.1: PCI bridge to [bus 0d]
[    0.257709] ACPI: PCI: Interrupt link LNKA configured for IRQ 0
[    0.257761] ACPI: PCI: Interrupt link LNKB configured for IRQ 0
[    0.257805] ACPI: PCI: Interrupt link LNKC configured for IRQ 0
[    0.257862] ACPI: PCI: Interrupt link LNKD configured for IRQ 0
[    0.257911] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
[    0.257953] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
[    0.257993] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
[    0.258034] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
[    0.258532] iommu: Default domain type: Translated
[    0.258532] iommu: DMA domain TLB invalidation policy: lazy mode
[    0.258532] SCSI subsystem initialized
[    0.258532] libata version 3.00 loaded.
[    0.258532] ACPI: bus type USB registered
[    0.258532] usbcore: registered new interface driver usbfs
[    0.258532] usbcore: registered new interface driver hub
[    0.258532] usbcore: registered new device driver usb
[    0.258532] EDAC MC: Ver: 3.0.0
[    0.260709] efivars: Registered efivars operations
[    0.260711] NetLabel: Initializing
[    0.260711] NetLabel:  domain hash size =3D 128
[    0.260711] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.260722] NetLabel:  unlabeled traffic allowed by default
[    0.260726] mctp: management component transport protocol core
[    0.260727] NET: Registered PF_MCTP protocol family
[    0.260730] PCI: Using ACPI for IRQ routing
[    0.263361] PCI: pci_cache_line_size set to 64 bytes
[    0.263437] e820: reserve RAM buffer [mem 0x09d00000-0x0bffffff]
[    0.263438] e820: reserve RAM buffer [mem 0x0a200000-0x0bffffff]
[    0.263439] e820: reserve RAM buffer [mem 0x0b000000-0x0bffffff]
[    0.263440] e820: reserve RAM buffer [mem 0xceb12018-0xcfffffff]
[    0.263441] e820: reserve RAM buffer [mem 0xceb32018-0xcfffffff]
[    0.263442] e820: reserve RAM buffer [mem 0xceb63018-0xcfffffff]
[    0.263443] e820: reserve RAM buffer [mem 0xceb94018-0xcfffffff]
[    0.263444] e820: reserve RAM buffer [mem 0xd8135000-0xdbffffff]
[    0.263445] e820: reserve RAM buffer [mem 0xda4d8000-0xdbffffff]
[    0.263446] e820: reserve RAM buffer [mem 0xdbb66000-0xdbffffff]
[    0.263447] e820: reserve RAM buffer [mem 0xdf000000-0xdfffffff]
[    0.263448] e820: reserve RAM buffer [mem 0x21f380000-0x21fffffff]
[    0.263885] pci 0000:0b:00.0: vgaarb: setting as boot VGA device
[    0.263885] pci 0000:0b:00.0: vgaarb: bridge control possible
[    0.263885] pci 0000:0b:00.0: vgaarb: VGA device added: decodes=3Dio+mem=
,owns=3Dio+mem,locks=3Dnone
[    0.263885] vgaarb: loaded
[    0.263913] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    0.263917] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
[    0.267204] clocksource: Switched to clocksource tsc-early
[    0.267211] VFS: Disk quotas dquot_6.6.0
[    0.267211] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    0.267780] pnp: PnP ACPI init
[    0.267868] system 00:00: [mem 0xf8000000-0xfbffffff] has been reserved
[    0.268089] system 00:02: [io  0x0a00-0x0a2f] has been reserved
[    0.268091] system 00:02: [io  0x0a30-0x0a3f] has been reserved
[    0.268093] system 00:02: [io  0x0a40-0x0a4f] has been reserved
[    0.268355] pnp 00:03: [dma 0 disabled]
[    0.268591] system 00:04: [io  0x04d0-0x04d1] has been reserved
[    0.268593] system 00:04: [io  0x040b] has been reserved
[    0.268594] system 00:04: [io  0x04d6] has been reserved
[    0.268596] system 00:04: [io  0x0c00-0x0c01] has been reserved
[    0.268597] system 00:04: [io  0x0c14] has been reserved
[    0.268598] system 00:04: [io  0x0c50-0x0c51] has been reserved
[    0.268599] system 00:04: [io  0x0c52] has been reserved
[    0.268600] system 00:04: [io  0x0c6c] has been reserved
[    0.268601] system 00:04: [io  0x0c6f] has been reserved
[    0.268602] system 00:04: [io  0x0cd0-0x0cd1] has been reserved
[    0.268604] system 00:04: [io  0x0cd2-0x0cd3] has been reserved
[    0.268605] system 00:04: [io  0x0cd4-0x0cd5] has been reserved
[    0.268606] system 00:04: [io  0x0cd6-0x0cd7] has been reserved
[    0.268608] system 00:04: [io  0x0cd8-0x0cdf] has been reserved
[    0.268609] system 00:04: [io  0x0800-0x089f] has been reserved
[    0.268611] system 00:04: [io  0x0b00-0x0b0f] has been reserved
[    0.268612] system 00:04: [io  0x0b20-0x0b3f] has been reserved
[    0.268613] system 00:04: [io  0x0900-0x090f] has been reserved
[    0.268614] system 00:04: [io  0x0910-0x091f] has been reserved
[    0.268615] system 00:04: [mem 0xfec00000-0xfec00fff] could not be reser=
ved
[    0.268617] system 00:04: [mem 0xfec01000-0xfec01fff] could not be reser=
ved
[    0.268619] system 00:04: [mem 0xfedc0000-0xfedc0fff] has been reserved
[    0.268621] system 00:04: [mem 0xfee00000-0xfee00fff] has been reserved
[    0.268622] system 00:04: [mem 0xfed80000-0xfed8ffff] could not be reser=
ved
[    0.268624] system 00:04: [mem 0xfec10000-0xfec10fff] has been reserved
[    0.268625] system 00:04: [mem 0xff000000-0xffffffff] has been reserved
[    0.269001] pnp: PnP ACPI: found 5 devices
[    0.274800] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, m=
ax_idle_ns: 2085701024 ns
[    0.274851] NET: Registered PF_INET protocol family
[    0.274955] IP idents hash table entries: 131072 (order: 8, 1048576 byte=
s, linear)
[    0.286738] tcp_listen_portaddr_hash hash table entries: 4096 (order: 4,=
 65536 bytes, linear)
[    0.286768] Table-perturb hash table entries: 65536 (order: 6, 262144 by=
tes, linear)
[    0.286805] TCP established hash table entries: 65536 (order: 7, 524288 =
bytes, linear)
[    0.286986] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes,=
 linear)
[    0.287098] TCP: Hash tables configured (established 65536 bind 65536)
[    0.287158] MPTCP token hash table entries: 8192 (order: 5, 196608 bytes=
, linear)
[    0.287187] UDP hash table entries: 4096 (order: 5, 131072 bytes, linear)
[    0.287209] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes, l=
inear)
[    0.287251] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.287263] NET: Registered PF_XDP protocol family
[    0.287282] pci 0000:00:01.1: PCI bridge to [bus 01]
[    0.287288] pci 0000:00:01.1:   bridge window [mem 0xf7c00000-0xf7cfffff]
[    0.287294] pci 0000:03:00.0: PCI bridge to [bus 04]
[    0.287303] pci 0000:03:01.0: PCI bridge to [bus 05]
[    0.287313] pci 0000:03:04.0: PCI bridge to [bus 06]
[    0.287315] pci 0000:03:04.0:   bridge window [io  0xe000-0xefff]
[    0.287320] pci 0000:03:04.0:   bridge window [mem 0xf7600000-0xf76fffff]
[    0.287323] pci 0000:03:04.0:   bridge window [mem 0xf2100000-0xf21fffff=
 64bit pref]
[    0.287328] pci 0000:03:05.0: PCI bridge to [bus 07]
[    0.287337] pci 0000:03:06.0: PCI bridge to [bus 08-09]
[    0.287339] pci 0000:03:06.0:   bridge window [io  0xd000-0xdfff]
[    0.287343] pci 0000:03:06.0:   bridge window [mem 0xf6400000-0xf74fffff]
[    0.287350] pci 0000:03:07.0: PCI bridge to [bus 0a]
[    0.287359] pci 0000:02:00.2: PCI bridge to [bus 03-0a]
[    0.287360] pci 0000:02:00.2:   bridge window [io  0xd000-0xefff]
[    0.287364] pci 0000:02:00.2:   bridge window [mem 0xf6400000-0xf76fffff]
[    0.287367] pci 0000:02:00.2:   bridge window [mem 0xf2100000-0xf21fffff=
 64bit pref]
[    0.287371] pci 0000:00:01.3: PCI bridge to [bus 02-0a]
[    0.287373] pci 0000:00:01.3:   bridge window [io  0xd000-0xefff]
[    0.287375] pci 0000:00:01.3:   bridge window [mem 0xf6400000-0xf77fffff]
[    0.287377] pci 0000:00:01.3:   bridge window [mem 0xf2100000-0xf21fffff=
 64bit pref]
[    0.287382] pci 0000:00:03.1: PCI bridge to [bus 0b]
[    0.287383] pci 0000:00:03.1:   bridge window [io  0xf000-0xffff]
[    0.287386] pci 0000:00:03.1:   bridge window [mem 0xf5000000-0xf60fffff]
[    0.287388] pci 0000:00:03.1:   bridge window [mem 0xe0000000-0xf1ffffff=
 64bit pref]
[    0.287393] pci 0000:00:07.1: PCI bridge to [bus 0c]
[    0.287395] pci 0000:00:07.1:   bridge window [mem 0xf7800000-0xf7afffff]
[    0.287399] pci 0000:00:08.1: PCI bridge to [bus 0d]
[    0.287401] pci 0000:00:08.1:   bridge window [mem 0xf7b00000-0xf7bfffff]
[    0.287407] pci_bus 0000:00: resource 4 [io  0x0000-0x03af window]
[    0.287408] pci_bus 0000:00: resource 5 [io  0x03e0-0x0cf7 window]
[    0.287410] pci_bus 0000:00: resource 6 [io  0x03b0-0x03df window]
[    0.287411] pci_bus 0000:00: resource 7 [io  0x0d00-0xffff window]
[    0.287412] pci_bus 0000:00: resource 8 [mem 0x000a0000-0x000dffff windo=
w]
[    0.287413] pci_bus 0000:00: resource 9 [mem 0xe0000000-0xfec2ffff windo=
w]
[    0.287414] pci_bus 0000:00: resource 10 [mem 0xfee00000-0xffffffff wind=
ow]
[    0.287416] pci_bus 0000:01: resource 1 [mem 0xf7c00000-0xf7cfffff]
[    0.287417] pci_bus 0000:02: resource 0 [io  0xd000-0xefff]
[    0.287418] pci_bus 0000:02: resource 1 [mem 0xf6400000-0xf77fffff]
[    0.287419] pci_bus 0000:02: resource 2 [mem 0xf2100000-0xf21fffff 64bit=
 pref]
[    0.287421] pci_bus 0000:03: resource 0 [io  0xd000-0xefff]
[    0.287422] pci_bus 0000:03: resource 1 [mem 0xf6400000-0xf76fffff]
[    0.287423] pci_bus 0000:03: resource 2 [mem 0xf2100000-0xf21fffff 64bit=
 pref]
[    0.287425] pci_bus 0000:06: resource 0 [io  0xe000-0xefff]
[    0.287426] pci_bus 0000:06: resource 1 [mem 0xf7600000-0xf76fffff]
[    0.287427] pci_bus 0000:06: resource 2 [mem 0xf2100000-0xf21fffff 64bit=
 pref]
[    0.287428] pci_bus 0000:08: resource 0 [io  0xd000-0xdfff]
[    0.287429] pci_bus 0000:08: resource 1 [mem 0xf6400000-0xf74fffff]
[    0.287431] pci_bus 0000:0b: resource 0 [io  0xf000-0xffff]
[    0.287432] pci_bus 0000:0b: resource 1 [mem 0xf5000000-0xf60fffff]
[    0.287433] pci_bus 0000:0b: resource 2 [mem 0xe0000000-0xf1ffffff 64bit=
 pref]
[    0.287434] pci_bus 0000:0c: resource 1 [mem 0xf7800000-0xf7afffff]
[    0.287436] pci_bus 0000:0d: resource 1 [mem 0xf7b00000-0xf7bfffff]
[    0.287597] IOAPIC[1]: Preconfigured routing entry (6-8 -> IRQ 24 Level:=
1 ActiveLow:1)
[    0.287687] pci 0000:0b:00.1: extending delay after power-on from D3hot =
to 20 msec
[    0.287717] pci 0000:0b:00.1: D0 power state depends on 0000:0b:00.0
[    0.287846] IOAPIC[1]: Preconfigured routing entry (6-20 -> IRQ 24 Level=
:1 ActiveLow:1)
[    0.287871] IOAPIC[1]: Preconfigured routing entry (6-13 -> IRQ 25 Level=
:1 ActiveLow:1)
[    0.287912] PCI: CLS 64 bytes, default 64
[    0.287979] Trying to unpack rootfs image as initramfs...
[    0.288466] Initialise system trusted keyrings
[    0.288479] Key type blacklist registered
[    0.288515] workingset: timestamp_bits=3D41 max_order=3D21 bucket_order=
=3D0
[    0.288522] zbud: loaded
[    0.288614] fuse: init (API version 7.40)
[    0.288684] integrity: Platform Keyring initialized
[    0.288687] integrity: Machine keyring initialized
[    0.299364] Key type asymmetric registered
[    0.299366] Asymmetric key parser 'x509' registered
[    0.299387] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 246)
[    0.299445] io scheduler mq-deadline registered
[    0.299447] io scheduler kyber registered
[    0.299459] io scheduler bfq registered
[    0.301082] pcieport 0000:00:01.1: PME: Signaling with IRQ 25
[    0.301142] pcieport 0000:00:01.1: AER: enabled with IRQ 25
[    0.301594] pcieport 0000:00:01.3: PME: Signaling with IRQ 26
[    0.301640] pcieport 0000:00:01.3: AER: enabled with IRQ 26
[    0.301845] pcieport 0000:00:03.1: PME: Signaling with IRQ 27
[    0.301910] pcieport 0000:00:03.1: AER: enabled with IRQ 27
[    0.302439] pcieport 0000:00:07.1: PME: Signaling with IRQ 28
[    0.302498] pcieport 0000:00:07.1: AER: enabled with IRQ 28
[    0.302607] IOAPIC[1]: Preconfigured routing entry (6-8 -> IRQ 29 Level:=
1 ActiveLow:1)
[    0.302754] pcieport 0000:00:08.1: PME: Signaling with IRQ 30
[    0.302805] pcieport 0000:00:08.1: AER: enabled with IRQ 30
[    0.302885] IOAPIC[1]: Preconfigured routing entry (6-10 -> IRQ 31 Level=
:1 ActiveLow:1)
[    0.303070] IOAPIC[1]: Preconfigured routing entry (6-9 -> IRQ 33 Level:=
1 ActiveLow:1)
[    0.303500] IOAPIC[1]: Preconfigured routing entry (6-11 -> IRQ 38 Level=
:1 ActiveLow:1)
[    0.303624] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.303722] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0C:00/input/input0
[    0.303737] ACPI: button: Power Button [PWRB]
[    0.303760] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/inpu=
t/input1
[    0.306610] ACPI: button: Power Button [PWRF]
[    0.310155] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.310369] 00:03: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115200) =
is a 16550A
[    0.312058] Non-volatile memory driver v1.3
[    0.312060] Linux agpgart interface v0.103
[    0.312096] ACPI: bus type drm_connector registered
[    0.316753] ahci 0000:02:00.1: version 3.0
[    0.316861] ahci 0000:02:00.1: SSS flag set, parallel bus scan disabled
[    0.316897] ahci 0000:02:00.1: AHCI vers 0001.0301, 32 command slots, 6 =
Gbps, SATA mode
[    0.316900] ahci 0000:02:00.1: 4/8 ports implemented (port mask 0x33)
[    0.316901] ahci 0000:02:00.1: flags: 64bit ncq sntf stag pm led clo onl=
y pmp pio slum part sxs deso sadm sds apst=20
[    0.317297] scsi host0: ahci
[    0.317389] scsi host1: ahci
[    0.317466] scsi host2: ahci
[    0.317535] scsi host3: ahci
[    0.317606] scsi host4: ahci
[    0.317681] scsi host5: ahci
[    0.317749] scsi host6: ahci
[    0.317821] scsi host7: ahci
[    0.317845] ata1: SATA max UDMA/133 abar m131072@0xf7780000 port 0xf7780=
100 irq 40 lpm-pol 3
[    0.317847] ata2: SATA max UDMA/133 abar m131072@0xf7780000 port 0xf7780=
180 irq 40 lpm-pol 3
[    0.317849] ata3: DUMMY
[    0.317849] ata4: DUMMY
[    0.317851] ata5: SATA max UDMA/133 abar m131072@0xf7780000 port 0xf7780=
300 irq 40 lpm-pol 3
[    0.317852] ata6: SATA max UDMA/133 abar m131072@0xf7780000 port 0xf7780=
380 irq 40 lpm-pol 3
[    0.317853] ata7: DUMMY
[    0.317854] ata8: DUMMY
[    0.317917] IOAPIC[1]: Preconfigured routing entry (6-18 -> IRQ 41 Level=
:1 ActiveLow:1)
[    0.317983] ahci 0000:0d:00.2: AHCI vers 0001.0301, 32 command slots, 6 =
Gbps, SATA mode
[    0.317986] ahci 0000:0d:00.2: 2/2 ports implemented (port mask 0x3)
[    0.317987] ahci 0000:0d:00.2: flags: 64bit ncq sntf ilck pm led clo onl=
y pmp fbs pio slum part sxs=20
[    0.318159] scsi host8: ahci
[    0.318361] scsi host9: ahci
[    0.318392] ata9: SATA max UDMA/133 abar m4096@0xf7b08000 port 0xf7b0810=
0 irq 42 lpm-pol 0
[    0.318394] ata10: SATA max UDMA/133 abar m4096@0xf7b08000 port 0xf7b081=
80 irq 42 lpm-pol 0
[    0.318487] usbcore: registered new interface driver usbserial_generic
[    0.318492] usbserial: USB Serial support registered for generic
[    0.318548] rtc_cmos 00:01: RTC can wake from S4
[    0.318917] rtc_cmos 00:01: registered as rtc0
[    0.318979] rtc_cmos 00:01: setting system clock to 2024-07-25T21:36:01 =
UTC (1721943361)
[    0.319013] rtc_cmos 00:01: alarms up to one month, y3k, 114 bytes nvram=
, hpet irqs
[    0.319044] amd_pstate: the _CPC object is not present in SBIOS or ACPI =
disabled
[    0.319077] ledtrig-cpu: registered to indicate activity on CPUs
[    0.319196] Relocating firmware framebuffer to offset 0x0000000001000000=
[d] within [mem 0xf0000000-0xf1ffffff flags 0x14220c]
[    0.319343] [drm] Initialized simpledrm 1.0.0 20200625 for simple-frameb=
uffer.0 on minor 0
[    0.319792] fbcon: Deferring console take-over
[    0.319795] simple-framebuffer simple-framebuffer.0: [drm] fb0: simpledr=
mdrmfb frame buffer device
[    0.319841] hid: raw HID events driver (C) Jiri Kosina
[    0.319895] drop_monitor: Initializing network drop monitor service
[    0.319981] NET: Registered PF_INET6 protocol family
[    0.326712] Freeing initrd memory: 8988K
[    0.330955] Segment Routing with IPv6
[    0.330957] RPL Segment Routing with IPv6
[    0.330966] In-situ OAM (IOAM) with IPv6
[    0.330991] NET: Registered PF_PACKET protocol family
[    0.331302] microcode: Current revision: 0x08001137
[    0.331367] IPI shorthand broadcast: enabled
[    0.331398] ... APIC ID:      00000000 (0)
[    0.331400] ... APIC VERSION: 80050010
[    0.331402] 000000000000000000000000000000000000000000000000000000000000=
0000
[    0.331407] 000000000000000000000000000000000000000000000000000000000000=
0000
[    0.331411] 000000000000000000000000000000000000000000000000000000000000=
0000

[    0.331417] number of MP IRQ sources: 15.
[    0.331418] number of IO-APIC #5 registers: 24.
[    0.331419] number of IO-APIC #6 registers: 32.
[    0.331420] testing the IO APIC.......................
[    0.331431] IO APIC #5......
[    0.331432] .... register #00: 05000000
[    0.331432] .......    : physical APIC id: 05
[    0.331433] .......    : Delivery Type: 0
[    0.331434] .......    : LTS          : 0
[    0.331434] .... register #01: 00178021
[    0.331435] .......     : max redirection entries: 17
[    0.331436] .......     : PRQ implemented: 1
[    0.331436] .......     : IO APIC version: 21
[    0.331437] .... register #02: 05000000
[    0.331437] .......     : arbitration: 05
[    0.331438] .... register #03: 00000000
[    0.331439] .......     : Boot DT    : 0
[    0.331439] .... IRQ redirection table:
[    0.331440] IOAPIC 0:
[    0.331446]  pin00, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331452]  pin01, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331458]  pin02, enabled , edge , high, V(30), IRR(0), S(0), logical =
, D(0001), M(0)
[    0.331464]  pin03, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331470]  pin04, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331477]  pin05, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331482]  pin06, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331489]  pin07, enabled , level, low , V(20), IRR(0), S(0), logical =
, D(0004), M(0)
[    0.331495]  pin08, enabled , edge , high, V(23), IRR(0), S(0), logical =
, D(0001), M(0)
[    0.331501]  pin09, enabled , level, low , V(20), IRR(0), S(0), logical =
, D(0002), M(0)
[    0.331507]  pin0a, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331513]  pin0b, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331519]  pin0c, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331525]  pin0d, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331531]  pin0e, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331537]  pin0f, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331543]  pin10, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331549]  pin11, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331555]  pin12, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331562]  pin13, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331568]  pin14, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331574]  pin15, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331580]  pin16, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331586]  pin17, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331589] IO APIC #6......
[    0.331590] .... register #00: 06000000
[    0.331590] .......    : physical APIC id: 06
[    0.331591] .......    : Delivery Type: 0
[    0.331591] .......    : LTS          : 0
[    0.331592] .... register #01: 001F8021
[    0.331593] .......     : max redirection entries: 1F
[    0.331593] .......     : PRQ implemented: 1
[    0.331594] .......     : IO APIC version: 21
[    0.331594] .... register #02: 00000000
[    0.331595] .......     : arbitration: 00
[    0.331595] .... IRQ redirection table:
[    0.331596] IOAPIC 1:
[    0.331598]  pin00, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331600]  pin01, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331603]  pin02, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331605]  pin03, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331608]  pin04, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331610]  pin05, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331613]  pin06, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331615]  pin07, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331617]  pin08, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331620]  pin09, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331622]  pin0a, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331625]  pin0b, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331627]  pin0c, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331629]  pin0d, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331632]  pin0e, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331634]  pin0f, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331637]  pin10, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331639]  pin11, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331641]  pin12, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331644]  pin13, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331646]  pin14, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331649]  pin15, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331651]  pin16, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331653]  pin17, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331656]  pin18, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331658]  pin19, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331661]  pin1a, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331663]  pin1b, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331665]  pin1c, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331668]  pin1d, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331670]  pin1e, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331673]  pin1f, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(0000), M(0)
[    0.331673] IRQ to pin mappings:
[    0.331675] IRQ0 -> 0:2
[    0.331677] IRQ1 -> 0:1
[    0.331679] IRQ3 -> 0:3
[    0.331680] IRQ4 -> 0:4
[    0.331682] IRQ5 -> 0:5
[    0.331683] IRQ6 -> 0:6
[    0.331685] IRQ7 -> 0:7
[    0.331686] IRQ8 -> 0:8
[    0.331688] IRQ9 -> 0:9
[    0.331689] IRQ10 -> 0:10
[    0.331690] IRQ11 -> 0:11
[    0.331692] IRQ12 -> 0:12
[    0.331693] IRQ13 -> 0:13
[    0.331695] IRQ14 -> 0:14
[    0.331696] IRQ15 -> 0:15
[    0.331698] IRQ24 -> 1:20
[    0.331700] IRQ29 -> 1:8
[    0.331702] IRQ31 -> 1:10
[    0.331704] IRQ33 -> 1:9
[    0.331706] IRQ38 -> 1:11
[    0.331708] IRQ41 -> 1:18
[    0.331710] .................................... done.
[    0.333085] sched_clock: Marking stable (331074182, 283249)->(333578944,=
 -2221513)
[    0.333164] Timer migration: 1 hierarchy levels; 8 children per group; 1=
 crossnode level
[    0.333202] registered taskstats version 1
[    0.333405] Loading compiled-in X.509 certificates
[    0.336228] Loaded X.509 cert 'Build time autogenerated kernel key: 5573=
8377825f7b26692b49e2909156f6b0cd86dd'
[    0.338915] zswap: loaded using pool zstd/zsmalloc
[    0.338969] Demotion targets for Node 0: null
[    0.339231] Key type .fscrypt registered
[    0.339233] Key type fscrypt-provisioning registered
[    0.340173] PM:   Magic number: 0:695:652
[    0.340185] scsi_host host6: hash matches
[    0.340187] scsi host6: hash matches
[    0.340257] acpi LNXCPU:05: hash matches
[    0.342509] RAS: Correctable Errors collector initialized.
[    0.352881] clk: Disabling unused clocks
[    0.352885] PM: genpd: Disabling unused power domains
[    0.629297] ata1: SATA link down (SStatus 0 SControl 300)
[    0.634407] ata9: SATA link down (SStatus 0 SControl 300)
[    0.635425] ata10: SATA link down (SStatus 0 SControl 300)
[    0.944401] ata2: SATA link down (SStatus 0 SControl 300)
[    1.259746] ata5: SATA link down (SStatus 0 SControl 300)
[    1.290291] tsc: Refined TSC clocksource calibration: 3493.437 MHz
[    1.290294] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x325=
b1901053, max_idle_ns: 440795306184 ns
[    1.290307] clocksource: Switched to clocksource tsc
[    1.573075] ata6: SATA link down (SStatus 0 SControl 300)
[    1.574341] Freeing unused decrypted memory: 2028K
[    1.574741] Freeing unused kernel image (initmem) memory: 3424K
[    1.574759] Write protecting the kernel read-only data: 32768k
[    1.574993] Freeing unused kernel image (rodata/data gap) memory: 936K
[    1.617918] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.617923] rodata_test: all tests were successful
[    1.617930] Run /init as init process
[    1.617931]   with arguments:
[    1.617932]     /init
[    1.617933]   with environment:
[    1.617934]     HOME=3D/
[    1.617934]     TERM=3Dlinux
[    1.617935]     BOOT_IMAGE=3D/boot/vmlinuz-linux-mainline
[    1.651491] fbcon: Taking over console
[    1.656423] Console: switching to colour frame buffer device 128x48
[    1.752846] xhci_hcd 0000:02:00.0: xHCI Host Controller
[    1.752855] xhci_hcd 0000:02:00.0: new USB bus registered, assigned bus =
number 1
[    1.769407] nvme nvme0: pci function 0000:01:00.0
[    1.769485] IOAPIC[1]: Preconfigured routing entry (6-0 -> IRQ 43 Level:=
1 ActiveLow:1)
[    1.787672] nvme nvme0: 4/0/0 default/read/poll queues
[    1.808186] xhci_hcd 0000:02:00.0: hcc params 0x0200ef81 hci version 0x1=
10 quirks 0x0000010048000010
[    1.808363] xhci_hcd 0000:02:00.0: xHCI Host Controller
[    1.808366] xhci_hcd 0000:02:00.0: new USB bus registered, assigned bus =
number 2
[    1.808370] xhci_hcd 0000:02:00.0: Host supports USB 3.1 Enhanced SuperS=
peed
[    1.808422] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.10
[    1.808425] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.808426] usb usb1: Product: xHCI Host Controller
[    1.808427] usb usb1: Manufacturer: Linux 6.10.0-1.1-mainline-dirty xhci=
-hcd
[    1.808429] usb usb1: SerialNumber: 0000:02:00.0
[    1.808563] hub 1-0:1.0: USB hub found
[    1.808578] hub 1-0:1.0: 10 ports detected
[    1.808870] usb usb2: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    1.808888] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.10
[    1.808890] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.808891] usb usb2: Product: xHCI Host Controller
[    1.808892] usb usb2: Manufacturer: Linux 6.10.0-1.1-mainline-dirty xhci=
-hcd
[    1.808894] usb usb2: SerialNumber: 0000:02:00.0
[    1.808962] hub 2-0:1.0: USB hub found
[    1.808969] hub 2-0:1.0: 4 ports detected
[    1.809049] usb: port power management may be unreliable
[    1.809181] IOAPIC[1]: Preconfigured routing entry (6-13 -> IRQ 50 Level=
:1 ActiveLow:1)
[    1.809203] xhci_hcd 0000:0c:00.3: xHCI Host Controller
[    1.809207] xhci_hcd 0000:0c:00.3: new USB bus registered, assigned bus =
number 3
[    1.809296] xhci_hcd 0000:0c:00.3: hcc params 0x0270f665 hci version 0x1=
00 quirks 0x0000000040000010
[    1.809399] xhci_hcd 0000:0c:00.3: xHCI Host Controller
[    1.809401] xhci_hcd 0000:0c:00.3: new USB bus registered, assigned bus =
number 4
[    1.809403] xhci_hcd 0000:0c:00.3: Host supports USB 3.0 SuperSpeed
[    1.809429] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.10
[    1.809431] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.809432] usb usb3: Product: xHCI Host Controller
[    1.809433] usb usb3: Manufacturer: Linux 6.10.0-1.1-mainline-dirty xhci=
-hcd
[    1.809434] usb usb3: SerialNumber: 0000:0c:00.3
[    1.809512] hub 3-0:1.0: USB hub found
[    1.809519] hub 3-0:1.0: 4 ports detected
[    1.809682] usb usb4: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    1.809701] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.10
[    1.809702] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.809704] usb usb4: Product: xHCI Host Controller
[    1.809705] usb usb4: Manufacturer: Linux 6.10.0-1.1-mainline-dirty xhci=
-hcd
[    1.809706] usb usb4: SerialNumber: 0000:0c:00.3
[    1.809778] hub 4-0:1.0: USB hub found
[    1.809785] hub 4-0:1.0: 4 ports detected
[    1.810210]  nvme0n1: p1 p2 p3 p4 p5
[    1.917701] EXT4-fs (nvme0n1p2): mounted filesystem e317bc8b-4ecb-4d50-8=
a10-16c83daf75b3 r/w with ordered data mode. Quota mode: none.
[    1.987945] systemd[1]: systemd 256.3-1-arch running in system mode (+PA=
M +AUDIT -SELINUX -APPARMOR -IMA +SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL +=
ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LI=
BCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZ=
IP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +XKBCOMMON +UTMP -SYSVINIT +LIBARCH=
IVE)
[    1.987950] systemd[1]: Detected architecture x86-64.
[    1.988747] systemd[1]: Hostname set to <aquilonia>.
[    2.056964] usb 1-5: new high-speed USB device number 2 using xhci_hcd
[    2.218359] usb 1-5: New USB device found, idVendor=3D1a40, idProduct=3D=
0101, bcdDevice=3D 1.11
[    2.218364] usb 1-5: New USB device strings: Mfr=3D0, Product=3D1, Seria=
lNumber=3D0
[    2.218366] usb 1-5: Product: USB 2.0 Hub
[    2.223373] hub 1-5:1.0: USB hub found
[    2.226345] hub 1-5:1.0: 4 ports detected
[    2.245950] systemd[1]: bpf-restrict-fs: LSM BPF program attached
[    2.307888] systemd[1]: /usr/lib/systemd/system/shorewall6.service:17: S=
tandard output type syslog is obsolete, automatically updating to journal. =
Please update your unit file, and consider removing the setting altogether.
[    2.309241] systemd[1]: /usr/lib/systemd/system/shorewall.service:16: St=
andard output type syslog is obsolete, automatically updating to journal. P=
lease update your unit file, and consider removing the setting altogether.
[    2.374349] systemd[1]: Queued start job for default target Graphical In=
terface.
[    2.411294] systemd[1]: Created slice Slice /system/dirmngr.
[    2.411669] systemd[1]: Created slice Slice /system/getty.
[    2.411972] systemd[1]: Created slice Slice /system/gpg-agent.
[    2.412281] systemd[1]: Created slice Slice /system/gpg-agent-browser.
[    2.412590] systemd[1]: Created slice Slice /system/gpg-agent-extra.
[    2.412897] systemd[1]: Created slice Slice /system/gpg-agent-ssh.
[    2.413202] systemd[1]: Created slice Slice /system/keyboxd.
[    2.413512] systemd[1]: Created slice Slice /system/modprobe.
[    2.414271] systemd[1]: Created slice Slice /system/netctl.
[    2.414691] systemd[1]: Created slice Slice /system/systemd-fsck.
[    2.415002] systemd[1]: Created slice User and Session Slice.
[    2.415188] systemd[1]: Started Dispatch Password Requests to Console Di=
rectory Watch.
[    2.415373] systemd[1]: Started Forward Password Requests to Wall Direct=
ory Watch.
[    2.415658] systemd[1]: Set up automount Arbitrary Executable File Forma=
ts File System Automount Point.
[    2.415837] systemd[1]: Expecting device /dev/disk/by-uuid/0b65f5a0-93cf=
-4a0a-8a8f-f4bf9226f42c...
[    2.415984] systemd[1]: Expecting device /dev/disk/by-uuid/239d593f-624d=
-4dea-9861-d6b13c23eb78...
[    2.416129] systemd[1]: Expecting device /dev/disk/by-uuid/9607-240E...
[    2.416248] systemd[1]: Expecting device /dev/disk/by-uuid/be771001-b8ee=
-4984-9a81-5e565c762a52...
[    2.416392] systemd[1]: Expecting device /sys/subsystem/net/devices/enp6=
s0...
[    2.416517] systemd[1]: Expecting device /sys/subsystem/net/devices/enp8=
s0f0...
[    2.416649] systemd[1]: Reached target Local Encrypted Volumes.
[    2.416780] systemd[1]: Reached target Login Prompts.
[    2.416906] systemd[1]: Reached target Local Integrity Protected Volumes.
[    2.417063] systemd[1]: Reached target Host and Network Name Lookups.
[    2.417201] systemd[1]: Reached target Remote File Systems.
[    2.417330] systemd[1]: Reached target Slice Units.
[    2.417467] systemd[1]: Reached target Local Verity Protected Volumes.
[    2.417676] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[    2.417891] systemd[1]: Listening on LVM2 poll daemon socket.
[    2.421014] systemd[1]: Listening on RPCbind Server Activation Socket.
[    2.421105] systemd[1]: Reached target RPC Port Mapper.
[    2.422387] systemd[1]: Listening on Process Core Dump Socket.
[    2.423130] systemd[1]: Listening on Credential Encryption/Decryption.
[    2.423245] systemd[1]: Listening on Journal Socket (/dev/log).
[    2.423353] systemd[1]: Listening on Journal Sockets.
[    2.423697] systemd[1]: TPM PCR Measurements was skipped because of an u=
nmet condition check (ConditionSecurity=3Dmeasured-uki).
[    2.423714] systemd[1]: Make TPM PCR Policy was skipped because of an un=
met condition check (ConditionSecurity=3Dmeasured-uki).
[    2.423800] systemd[1]: Listening on udev Control Socket.
[    2.424088] systemd[1]: Listening on udev Kernel Socket.
[    2.425146] systemd[1]: Mounting Huge Pages File System...
[    2.426262] systemd[1]: Mounting POSIX Message Queue File System...
[    2.427915] systemd[1]: Mounting Kernel Debug File System...
[    2.430335] systemd[1]: Mounting Kernel Trace File System...
[    2.431835] systemd[1]: Starting Create List of Static Device Nodes...
[    2.434082] systemd[1]: Starting Monitoring of LVM2 mirrors, snapshots e=
tc. using dmeventd or progress polling...
[    2.436237] systemd[1]: Starting Load Kernel Module configfs...
[    2.438031] systemd[1]: Starting Load Kernel Module dm_mod...
[    2.440101] systemd[1]: Starting Load Kernel Module drm...
[    2.441678] systemd[1]: Starting Load Kernel Module fuse...
[    2.444023] systemd[1]: Starting Load Kernel Module loop...
[    2.446551] systemd[1]: File System Check on Root Device was skipped bec=
ause of an unmet condition check (ConditionPathIsReadWrite=3D!/).
[    2.446605] systemd[1]: Clear Stale Hibernate Storage Info was skipped b=
ecause of an unmet condition check (ConditionPathExists=3D/sys/firmware/efi=
/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67).
[    2.449730] systemd[1]: Starting Journal Service...
[    2.453776] device-mapper: uevent: version 1.0.3
[    2.456766] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised:=
 dm-devel@lists.linux.dev
[    2.456791] systemd[1]: Starting Load Kernel Modules...
[    2.457124] loop: module loaded
[    2.459162] systemd[1]: TPM PCR Machine ID Measurement was skipped becau=
se of an unmet condition check (ConditionSecurity=3Dmeasured-uki).
[    2.459923] systemd[1]: Starting Remount Root and Kernel File Systems...
[    2.460490] systemd[1]: Early TPM SRK Setup was skipped because of an un=
met condition check (ConditionSecurity=3Dmeasured-uki).
[    2.463527] systemd[1]: Starting Load udev Rules from Credentials...
[    2.468133] systemd[1]: Starting Coldplug All udev Devices...
[    2.473414] systemd[1]: Mounted Huge Pages File System.
[    2.474280] systemd[1]: Mounted POSIX Message Queue File System.
[    2.474793] systemd-journald[293]: Collecting audit messages is disabled.
[    2.477280] systemd[1]: Mounted Kernel Debug File System.
[    2.477846] systemd[1]: Mounted Kernel Trace File System.
[    2.478339] systemd[1]: Finished Create List of Static Device Nodes.
[    2.478898] systemd[1]: modprobe@configfs.service: Deactivated successfu=
lly.
[    2.479037] systemd[1]: Finished Load Kernel Module configfs.
[    2.479554] systemd[1]: modprobe@dm_mod.service: Deactivated successfull=
y.
[    2.479698] systemd[1]: Finished Load Kernel Module dm_mod.
[    2.480192] systemd[1]: modprobe@drm.service: Deactivated successfully.
[    2.480516] EXT4-fs (nvme0n1p2): re-mounted e317bc8b-4ecb-4d50-8a10-16c8=
3daf75b3 r/w. Quota mode: none.
[    2.480796] systemd[1]: Finished Load Kernel Module drm.
[    2.481875] systemd[1]: modprobe@fuse.service: Deactivated successfully.
[    2.482022] systemd[1]: Finished Load Kernel Module fuse.
[    2.482547] systemd[1]: modprobe@loop.service: Deactivated successfully.
[    2.482681] systemd[1]: Finished Load Kernel Module loop.
[    2.483163] systemd[1]: Finished Load Kernel Modules.
[    2.483631] systemd[1]: Finished Load udev Rules from Credentials.
[    2.484139] systemd[1]: Finished Remount Root and Kernel File Systems.
[    2.485344] systemd[1]: Mounting FUSE Control File System...
[    2.490350] systemd[1]: Mounting Kernel Configuration File System...
[    2.494259] systemd[1]: Rebuild Hardware Database was skipped because no=
 trigger condition checks were met.
[    2.494324] systemd[1]: Repartition Root Disk was skipped because no tri=
gger condition checks were met.
[    2.505239] systemd[1]: Starting Apply Kernel Variables...
[    2.507925] systemd[1]: Starting Create Static Device Nodes in /dev grac=
efully...
[    2.508942] systemd[1]: Finished Monitoring of LVM2 mirrors, snapshots e=
tc. using dmeventd or progress polling.
[    2.514967] systemd[1]: Mounted FUSE Control File System.
[    2.515371] systemd[1]: Mounted Kernel Configuration File System.
[    2.521352] systemd[1]: Finished Apply Kernel Variables.
[    2.530898] systemd[1]: Finished Create Static Device Nodes in /dev grac=
efully.
[    2.533807] systemd[1]: Starting Create System Users...
[    2.567124] systemd[1]: Finished Coldplug All udev Devices.
[    2.581417] systemd[1]: Finished Create System Users.
[    2.585376] systemd[1]: Starting Create Static Device Nodes in /dev...
[    2.623027] systemd[1]: Finished Create Static Device Nodes in /dev.
[    2.623426] systemd[1]: Reached target Preparation for Local File System=
s.
[    2.624651] systemd[1]: Starting Rule-based Manager for Device Events an=
d Files...
[    2.655457] systemd[1]: Started Rule-based Manager for Device Events and=
 Files.
[    2.656975] usb 1-5.3: new full-speed USB device number 3 using xhci_hcd
[    2.714724] systemd[1]: Found device Samsung SSD 960 EVO 250GB 1.
[    2.735831] systemd[1]: Found device Samsung SSD 960 EVO 250GB var.
[    2.746111] systemd[1]: Found device Samsung SSD 960 EVO 250GB swap.
[    2.756269] systemd[1]: Found device Samsung SSD 960 EVO 250GB home.
[    2.760370] systemd[1]: Activating swap /dev/disk/by-uuid/239d593f-624d-=
4dea-9861-d6b13c23eb78...
[    2.766222] systemd[1]: Starting File System Check on /dev/disk/by-uuid/=
0b65f5a0-93cf-4a0a-8a8f-f4bf9226f42c...
[    2.777624] systemd[1]: Starting File System Check on /dev/disk/by-uuid/=
9607-240E...
[    2.783272] Adding 4194300k swap on /dev/nvme0n1p3.  Priority:-2 extents=
:1 across:4194300k SS
[    2.783434] systemd[1]: Starting File System Check on /dev/disk/by-uuid/=
be771001-b8ee-4984-9a81-5e565c762a52...
[    2.797309] systemd[1]: Activated swap /dev/disk/by-uuid/239d593f-624d-4=
dea-9861-d6b13c23eb78.
[    2.798881] systemd[1]: Reached target Swaps.
[    2.800228] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, re=
vision 0
[    2.800235] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port=
 selection
[    2.802471] ccp 0000:0c:00.2: enabling device (0000 -> 0002)
[    2.802546] IOAPIC[1]: Preconfigured routing entry (6-12 -> IRQ 52 Level=
:1 ActiveLow:1)
[    2.802744] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller at=
 0xb20
[    2.805221] ccp 0000:0c:00.2: ccp enabled
[    2.805228] ccp 0000:0c:00.2: psp: unable to access the device: you migh=
t be running a broken BIOS.
[    2.805818] systemd[1]: Finished File System Check on /dev/disk/by-uuid/=
9607-240E.
[    2.808461] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[    2.808600] sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog MMIO ad=
dress
[    2.808735] sp5100-tco sp5100-tco: initialized. heartbeat=3D60 sec (nowa=
yout=3D0)
[    2.809334] input: PC Speaker as /devices/platform/pcspkr/input/input2
[    2.810646] systemd[1]: Finished File System Check on /dev/disk/by-uuid/=
be771001-b8ee-4984-9a81-5e565c762a52.
[    2.811310] systemd[1]: Finished File System Check on /dev/disk/by-uuid/=
0b65f5a0-93cf-4a0a-8a8f-f4bf9226f42c.
[    2.814587] dca service started, version 1.12.1
[    2.819359] RAPL PMU: API unit is 2^-32 Joules, 1 fixed counters, 163840=
 ms ovfl timer
[    2.819361] RAPL PMU: hw unit of domain package 2^-16 Joules
[    2.821655] pps_core: LinuxPPS API ver. 1 registered
[    2.821657] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    2.823353] cryptd: max_cpu_qlen set to 1000
[    2.825662] PTP clock support registered
[    2.839063] r8169 0000:06:00.0 eth0: RTL8168g/8111g, e0:d5:5e:68:14:c5, =
XID 4c0, IRQ 55
[    2.839069] r8169 0000:06:00.0 eth0: jumbo features [frames: 9194 bytes,=
 tx checksumming: ko]
[    2.867198] AVX2 version of gcm_enc/dec engaged.
[    2.867229] AES CTR mode by8 optimization enabled
[    2.867364] igb: Intel(R) Gigabit Ethernet Network Driver
[    2.867368] igb: Copyright (c) 2007-2014 Intel Corporation.
[    2.900385] systemd[1]: Starting Virtual Console Setup...
[    2.914074] systemd[1]: systemd-vconsole-setup.service: Deactivated succ=
essfully.
[    2.914224] systemd[1]: Stopped Virtual Console Setup.
[    2.916324] r8169 0000:06:00.0 enp6s0: renamed from eth0
[    2.919528] systemd[1]: Starting Virtual Console Setup...
[    2.920962] IOAPIC[1]: Preconfigured routing entry (6-31 -> IRQ 65 Level=
:1 ActiveLow:1)
[    2.920982] snd_hda_intel 0000:0b:00.1: Disabling MSI
[    2.920991] snd_hda_intel 0000:0b:00.1: Handle vga_switcheroo audio clie=
nt
[    2.921136] snd_hda_intel 0000:0d:00.3: enabling device (0000 -> 0002)
[    2.921168] IOAPIC[1]: Preconfigured routing entry (6-19 -> IRQ 66 Level=
:1 ActiveLow:1)
[    2.933350] systemd[1]: Found device RTL8111/8168/8211/8411 PCI Express =
Gigabit Ethernet Controller (Onboard Ethernet).
[    2.942827] systemd[1]: Finished Virtual Console Setup.
[    2.946959] input: HDA NVidia HDMI/DP,pcm=3D3 as /devices/pci0000:00/000=
0:00:03.1/0000:0b:00.1/sound/card0/input3
[    2.946998] input: HDA NVidia HDMI/DP,pcm=3D7 as /devices/pci0000:00/000=
0:00:03.1/0000:0b:00.1/sound/card0/input4
[    2.947029] input: HDA NVidia HDMI/DP,pcm=3D8 as /devices/pci0000:00/000=
0:00:03.1/0000:0b:00.1/sound/card0/input5
[    2.947059] input: HDA NVidia HDMI/DP,pcm=3D9 as /devices/pci0000:00/000=
0:00:03.1/0000:0b:00.1/sound/card0/input6
[    2.951960] snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC887-VD:=
 line_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:line
[    2.951966] snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=3D0 (0x0/=
0x0/0x0/0x0/0x0)
[    2.951967] snd_hda_codec_realtek hdaudioC1D0:    hp_outs=3D1 (0x1b/0x0/=
0x0/0x0/0x0)
[    2.951969] snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=3D0x0
[    2.951970] snd_hda_codec_realtek hdaudioC1D0:    dig-out=3D0x11/0x0
[    2.951975] snd_hda_codec_realtek hdaudioC1D0:    inputs:
[    2.951977] snd_hda_codec_realtek hdaudioC1D0:      Front Mic=3D0x19
[    2.951978] snd_hda_codec_realtek hdaudioC1D0:      Rear Mic=3D0x18
[    2.951979] snd_hda_codec_realtek hdaudioC1D0:      Line=3D0x1a
[    2.958453] systemd[1]: Starting Load Kernel Module dm_mod...
[    2.960184] systemd[1]: Starting Load Kernel Module loop...
[    2.960738] systemd[1]: File System Check on Root Device was skipped bec=
ause of an unmet condition check (ConditionPathIsReadWrite=3D!/).
[    2.960825] systemd[1]: Clear Stale Hibernate Storage Info was skipped b=
ecause of an unmet condition check (ConditionPathExists=3D/sys/firmware/efi=
/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67).
[    2.960966] systemd[1]: Rebuild Hardware Database was skipped because no=
 trigger condition checks were met.
[    2.961026] systemd[1]: TPM PCR Machine ID Measurement was skipped becau=
se of an unmet condition check (ConditionSecurity=3Dmeasured-uki).
[    2.961105] systemd[1]: Early TPM SRK Setup was skipped because of an un=
met condition check (ConditionSecurity=3Dmeasured-uki).
[    2.965302] input: HD-Audio Generic Front Mic as /devices/pci0000:00/000=
0:00:08.1/0000:0d:00.3/sound/card1/input7
[    2.965339] input: HD-Audio Generic Rear Mic as /devices/pci0000:00/0000=
:00:08.1/0000:0d:00.3/sound/card1/input8
[    2.965383] input: HD-Audio Generic Line as /devices/pci0000:00/0000:00:=
08.1/0000:0d:00.3/sound/card1/input9
[    2.965419] input: HD-Audio Generic Line Out as /devices/pci0000:00/0000=
:00:08.1/0000:0d:00.3/sound/card1/input10
[    2.965450] input: HD-Audio Generic Front Headphone as /devices/pci0000:=
00/0000:00:08.1/0000:0d:00.3/sound/card1/input11
[    2.973450] systemd[1]: File System Check on Root Device was skipped bec=
ause of an unmet condition check (ConditionPathIsReadWrite=3D!/).
[    2.973478] systemd[1]: Clear Stale Hibernate Storage Info was skipped b=
ecause of an unmet condition check (ConditionPathExists=3D/sys/firmware/efi=
/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67).
[    2.973531] systemd[1]: Rebuild Hardware Database was skipped because no=
 trigger condition checks were met.
[    2.973558] systemd[1]: TPM PCR Machine ID Measurement was skipped becau=
se of an unmet condition check (ConditionSecurity=3Dmeasured-uki).
[    2.973582] systemd[1]: Early TPM SRK Setup was skipped because of an un=
met condition check (ConditionSecurity=3Dmeasured-uki).
[    2.978927] systemd[1]: modprobe@loop.service: Deactivated successfully.
[    2.979090] systemd[1]: Finished Load Kernel Module loop.
[    2.982175] systemd[1]: modprobe@dm_mod.service: Deactivated successfull=
y.
[    2.982317] systemd[1]: Finished Load Kernel Module dm_mod.
[    2.983714] systemd[1]: Repartition Root Disk was skipped because no tri=
gger condition checks were met.
[    2.995252] intel_rapl_common: Found RAPL domain package
[    2.995257] intel_rapl_common: Found RAPL domain core
[    2.995862] AMD Address Translation Library initialized
[    3.053005] igb 0000:08:00.0: added PHC on eth0
[    3.053043] igb 0000:08:00.0: Intel(R) Gigabit Ethernet Network Connecti=
on
[    3.053045] igb 0000:08:00.0: eth0: (PCIe:2.5Gb/s:Width x1) 80:61:5f:0a:=
2c:fc
[    3.053129] igb 0000:08:00.0: eth0: PBA No: E43709-006
[    3.053130] igb 0000:08:00.0: Using MSI-X interrupts. 4 rx queue(s), 4 t=
x queue(s)
[    3.127359] usb 1-5.3: New USB device found, idVendor=3D046d, idProduct=
=3Dc318, bcdDevice=3D55.03
[    3.127364] usb 1-5.3: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[    3.127366] usb 1-5.3: Product: Logitech Illuminated Keyboard
[    3.127368] usb 1-5.3: Manufacturer: Logitech
[    3.239585] igb 0000:08:00.1: added PHC on eth1
[    3.239621] igb 0000:08:00.1: Intel(R) Gigabit Ethernet Network Connecti=
on
[    3.239622] igb 0000:08:00.1: eth1: (PCIe:2.5Gb/s:Width x1) 80:61:5f:0a:=
2c:fd
[    3.239707] igb 0000:08:00.1: eth1: PBA No: E43709-006
[    3.239708] igb 0000:08:00.1: Using MSI-X interrupts. 4 rx queue(s), 4 t=
x queue(s)
[    3.242980] igb 0000:08:00.1 enp8s0f1: renamed from eth1
[    3.243097] igb 0000:08:00.0 enp8s0f0: renamed from eth0
[    3.253049] systemd[1]: Found device 82576 Gigabit Network Connection.
[    3.350298] usb 1-5.4: new low-speed USB device number 4 using xhci_hcd
[    3.471612] systemd[1]: Mounting /boot/efi...
[    3.473078] systemd[1]: Mounting /home...
[    3.475677] systemd[1]: Mounting Temporary Directory /tmp...
[    3.476113] systemd[1]: var.mount: Directory /var to mount over is not e=
mpty, mounting anyway.
[    3.498259] systemd[1]: Mounting /var...
[    3.499485] systemd[1]: Mounted Temporary Directory /tmp.
[    3.501887] EXT4-fs (nvme0n1p5): mounted filesystem be771001-b8ee-4984-9=
a81-5e565c762a52 r/w with ordered data mode. Quota mode: none.
[    3.503114] systemd[1]: Mounted /home.
[    3.505831] EXT4-fs (nvme0n1p4): mounted filesystem 0b65f5a0-93cf-4a0a-8=
a8f-f4bf9226f42c r/w with ordered data mode. Quota mode: none.
[    3.507144] systemd[1]: Mounted /var.
[    3.508305] systemd[1]: Virtual Machine and Container Storage (Compatibi=
lity) was skipped because of an unmet condition check (ConditionPathExists=
=3D/var/lib/machines.raw).
[    3.509671] systemd[1]: Starting RPC Bind...
[    3.513080] systemd[1]: Starting Load/Save OS Random Seed...
[    3.514047] systemd[1]: TPM SRK Setup was skipped because of an unmet co=
ndition check (ConditionSecurity=3Dmeasured-uki).
[    3.517594] systemd[1]: Mounted /boot/efi.
[    3.518302] systemd[1]: Reached target Local File Systems.
[    3.519502] systemd[1]: Listening on Boot Entries Service Socket.
[    3.521029] systemd[1]: Listening on System Extension Image Management.
[    3.522353] systemd[1]: Starting Rebuild Dynamic Linker Cache...
[    3.523525] systemd[1]: Set Up Additional Binary Formats was skipped bec=
ause no trigger condition checks were met.
[    3.524311] systemd[1]: Finished Load/Save OS Random Seed.
[    3.524984] systemd[1]: Update Boot Loader Random Seed was skipped becau=
se no trigger condition checks were met.
[    3.535416] systemd[1]: Started RPC Bind.
[    3.627715] systemd[1]: Finished Rebuild Dynamic Linker Cache.
[    3.716368] usb 1-5.4: New USB device found, idVendor=3D03f0, idProduct=
=3D0941, bcdDevice=3D 1.00
[    3.716372] usb 1-5.4: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[    3.716374] usb 1-5.4: Product: HP X500 USB Optical Mouse
[    3.716375] usb 1-5.4: Manufacturer: PixArt
[    3.731587] systemd[1]: Started Journal Service.
[    3.776613] systemd-journald[293]: Received client request to flush runt=
ime journal.
[    3.819528] usbcore: registered new interface driver usbhid
[    3.819533] usbhid: USB HID core driver
[    3.826933] input: Logitech Logitech Illuminated Keyboard as /devices/pc=
i0000:00/0000:00:01.3/0000:02:00.0/usb1/1-5/1-5.3/1-5.3:1.0/0003:046D:C318.=
0001/input/input12
[    3.880443] hid-generic 0003:046D:C318.0001: input,hidraw0: USB HID v1.1=
1 Keyboard [Logitech Logitech Illuminated Keyboard] on usb-0000:02:00.0-5.3=
/input0
[    3.880608] input: Logitech Logitech Illuminated Keyboard Consumer Contr=
ol as /devices/pci0000:00/0000:00:01.3/0000:02:00.0/usb1/1-5/1-5.3/1-5.3:1.=
1/0003:046D:C318.0002/input/input13
[    3.937110] hid-generic 0003:046D:C318.0002: input,hiddev96,hidraw1: USB=
 HID v1.11 Device [Logitech Logitech Illuminated Keyboard] on usb-0000:02:0=
0.0-5.3/input1
[    3.937232] input: PixArt HP X500 USB Optical Mouse as /devices/pci0000:=
00/0000:00:01.3/0000:02:00.0/usb1/1-5/1-5.4/1-5.4:1.0/0003:03F0:0941.0003/i=
nput/input15
[    3.937274] hid-generic 0003:03F0:0941.0003: input,hidraw2: USB HID v1.1=
1 Mouse [PixArt HP X500 USB Optical Mouse] on usb-0000:02:00.0-5.4/input0
[    3.946619] mousedev: PS/2 mouse device common for all mice
[    4.196965] Generic FE-GE Realtek PHY r8169-0-600:00: attached PHY drive=
r (mii_bus:phy_addr=3Dr8169-0-600:00, irq=3DMAC)
[    4.387038] r8169 0000:06:00.0 enp6s0: Link is Down
[    6.437571] igb 0000:08:00.0 enp8s0f0: igb: enp8s0f0 NIC Link is Up 1000=
 Mbps Full Duplex, Flow Control: RX/TX
[    7.114399] r8169 0000:06:00.0 enp6s0: Link is Up - 1Gbps/Full - flow co=
ntrol rx/tx

--lcbc7voog2cgm6hc--

--r43caxcmhmq7iko2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmaiyy4ACgkQwEfU8yi1
JYUmkQ//a+hUVUf78EnLQkn/GABVGqcRLeQEqXMeghaMKM+c5wlborYbXzTBPPel
5T7Rr5b2hX/y0Qo0LeviE88DHhhL5P7fRoaHnEgdERdWkjsbOWQHqfYLabBwY4Qy
2CsDZVcnanYSfT09TKMb2u4SujsY+xYgzgeQszu4UdQvXdGMa7z/JxMXq2VjOgsj
xXsWMQ5IFTuy/IAzpuD8TSPCGyelebGYQuCSY3DhY3b1OG82WWjmh+Qsju/eOJjk
exwCt4TPZM1q/DInHN5K+CQXiCkwDhL5vSke2iNo8CxlMStjP3iJCdw4oxjdzBjZ
Fj5ndDJun+bZHsl7WIVgKfbjPmitXilXs0oo0tbMOgc3PlLn1LKVg5D7YIHp7MU0
KvejmwA9jaW4dmU9J+NTj/f39dnMy1EnK5IjWqP85eMEW7LLy+61VHvkCF2bRaTL
o4mJ2mopDcU2Jppg3IDfTFgUILtJROi2mOFY0Wj/0nzOFOGzEfDRj+2DJ3l8oWEd
4z/Fn0a7YIc40xD3nbjHrLSk2bO+KOpLgx5lR8n2+JWN1bt/qJ2My/kaRdRnUr0N
kAZkMmb6tW0ZR53VflmDaT+ux8a5CckfQJPVnx9dbIg4WxEyR4Gt8yaoj6uD4SQS
vpUv29faIA9RQC9C1BVfajlt2b/lcVLAoJvOLWFVAhoKyY+qDIY=
=cbx1
-----END PGP SIGNATURE-----

--r43caxcmhmq7iko2--
