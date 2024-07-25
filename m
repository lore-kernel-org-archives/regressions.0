Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C12B1741FE
	for <regressions@lists.linux.dev>; Thu, 25 Jul 2024 10:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721904663; cv=none; b=Ls8Wbl0zhoFCw5e98uMQ5WFQTTPSRcUJe+s22cL/uRymYYN+qNXvxsjkKtJvyRUA0hVBbKEc5w4H4yetEAw7ClZkiHvsEjtvCtj7hpeBX0OI0sRXu9hXYfRVZjGs8RV/zvLwO3oLfpF/VTRX+pUIayQFLWIzTIDAvK4Zhd5bK+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721904663; c=relaxed/simple;
	bh=RbZoGawAENi0dlFJwht0AlVGTByKjs16u34LcADTFMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JxTVsXLoKQSsGZBxEnd4hr9F+4b+I8Mw330oLP0pBREIp+EOJIk1TgoPkQBztD0LeLIF+tRvDQdLpcGw48LzS21DR8wW/M0HCj9kZqqoh0ZKJ7l47IWAXn6naA8R4cP4uxkl993dq3uBHBWExWEno2eNDqc8gZj4MJ3NUwPuTps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=gp0OOaFC; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="gp0OOaFC"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CF30340E0206;
	Thu, 25 Jul 2024 10:50:50 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id oiSWgrcwLj-y; Thu, 25 Jul 2024 10:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1721904647; bh=zx1qDX0+b4B+2ojICzdG+Ve0MwqXEpU7b771MVTOlZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gp0OOaFCwYL4Y0loKCULQ7Mje02hvcA6BiNxcT2AU+wCpV1g4632aVVrZ/TuR+JDQ
	 s/rc9peiyNMxINH6VmLr4FnEmuNSbMC/M+N4goF9aTrx9TQzm+ST2u7Pkumkqn/wYw
	 1SyYY12Ae9qW+rkUD8CrQS1J1UfLrTO+s3NKrI9RaCFgVQMZjluBwjnjm8W6eJDesQ
	 PJhXnUOGMM9YPi3Qi0tMT1rU9AMR8Cav/j7PIzMLO7p0Wb3QIY4yQK+LPz/n0+zQDR
	 bRg24nSK4es33FtEe694wN0MmOVl0pQYA0DGslry1ED+hDzVLLj5nE71NJtRyFqrOj
	 x5dJYrdwDHZ+wxMPaoohj9OnWX04e/EipywHnu1WRCj64BEK6zsLuFYClu0pAG9umr
	 6f1d0I+g5Uv1UgaUedmpRIXkrAnNv2BhSXJ2S7Bk8yWHRRxy5XFuleYIPFKU9CaP5s
	 D4uP347FhyLQBiWX0PiNlk7PTQ/z2GTeaG2DQ1a+lTwAs2S4BCNF7DzdxESODAewj8
	 mqA+5eYggg3xZiWHcNtNhdxR3vQvFdp4hYw1yDN3GhXm8Voe7rcMs8xChZacCbH4o4
	 4RRkbIWPIRwD8REipXaMtT5Y4feZzXsi5++Y3Bsc36wDxyltZXBLtD7mfKY9eh/6y4
	 9cTmHyVPKm2wRvrTa6ufYSBE=
Received: from zn.tnic (p5de8ee85.dip0.t-ipconnect.de [93.232.238.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1DA8740E0185;
	Thu, 25 Jul 2024 10:50:42 +0000 (UTC)
Date: Thu, 25 Jul 2024 12:50:29 +0200
From: Borislav Petkov <bp@alien8.de>
To: Christian Heusel <christian@heusel.eu>
Cc: Thomas Gleixner <tglx@linutronix.de>, regressions@lists.linux.dev,
	x86@kernel.org, rob@durendal.co.uk
Subject: Re: [REGRESSION][BISECTED] Early boot hangs since f0551af02130
Message-ID: <20240725105029.GAZqIt9aLsIaG7JqN5@fat_crate.local>
References: <361b2ba5-7fc3-4e9a-af63-adfd4bc20304@heusel.eu>
 <20240723120246.GBZp-b5nHHT0BWmKMZ@fat_crate.local>
 <5e08cab0-c6b5-4169-8d42-ddb0ffb4a6c9@heusel.eu>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5e08cab0-c6b5-4169-8d42-ddb0ffb4a6c9@heusel.eu>

On Wed, Jul 24, 2024 at 12:08:39AM +0200, Christian Heusel wrote:
> See the attached dmesg for a boot with the mainline kernel that has the
> problematic patch reverted!

Thx.

Now, please take plain 6.10 (no reverts), apply the below hunk and send me
dmesg again.

Make sure you boot with "apic=debug" on the kernel cmdline.

Let's see what crap MADT has there.

Also, send /proc/cpuinfo too pls.

> Regarding the Arch Kernel, we're using a minimal patchset of 3 or 4
> patches, see i.e. the following release:
> https://github.com/archlinux/linux/releases/tag/v6.9.9-arch1
> 
> Other releases are a bit more heavy, but mostly consist of additional
> backports to fix issues before the next stable release.

Yeah, when reporting an upstream bug, people should always test with the
upstream kernel because everybody is backporting stuff now.

Thx.

---
diff --git a/arch/x86/kernel/cpu/topology.c b/arch/x86/kernel/cpu/topology.c
index 621a151ccf7d..fabc1a0b58bb 100644
--- a/arch/x86/kernel/cpu/topology.c
+++ b/arch/x86/kernel/cpu/topology.c
@@ -222,6 +222,9 @@ static __init void topo_register_apic(u32 apic_id, u32 acpi_id, bool present)
 {
 	int cpu, dom;
 
+	pr_info("%s: APIC ID: %d, ACPI ID: %d, present: %d\n",
+		__func__, apic_id, acpi_id, present);
+
 	if (present) {
 		set_bit(apic_id, phys_cpu_present_map);
 
@@ -236,20 +239,24 @@ static __init void topo_register_apic(u32 apic_id, u32 acpi_id, bool present)
 		else
 			cpu = topo_get_cpunr(apic_id);
 
+		pr_info("%s: present, cpu %d\n", __func__, cpu);
+
 		cpuid_to_apicid[cpu] = apic_id;
 		topo_set_cpuids(cpu, apic_id, acpi_id);
 	} else {
 		u32 pkgid = topo_apicid(apic_id, TOPO_PKG_DOMAIN);
+		unsigned int unit_cnt = topo_unit_count(pkgid, TOPO_PKG_DOMAIN, phys_cpu_present_map);
+
+		pr_info("%s: unit_cnt: %d\n", __func__, unit_cnt);
 
 		/*
 		 * Check for present APICs in the same package when running
 		 * on bare metal. Allow the bogosity in a guest.
 		 */
-		if (hypervisor_is_type(X86_HYPER_NATIVE) &&
-		    topo_unit_count(pkgid, TOPO_PKG_DOMAIN, phys_cpu_present_map)) {
-			pr_info_once("Ignoring hot-pluggable APIC ID %x in present package.\n",
+		if (hypervisor_is_type(X86_HYPER_NATIVE) && unit_cnt) {
+			pr_info("Ignoring hot-pluggable APIC ID %x in present package.\n",
 				     apic_id);
-			topo_info.nr_rejected_cpus++;
+//			topo_info.nr_rejected_cpus++;
 			return;
 		}
 

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
